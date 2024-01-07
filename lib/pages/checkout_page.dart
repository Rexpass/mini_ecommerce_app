import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Order Form',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'name',
                      decoration: const InputDecoration(labelText: 'Name'),
                    ),
                    const SizedBox(height: 20),
                    FormBuilderTextField(
                      name: 'address',
                      decoration: const InputDecoration(labelText: 'Address'),
                    ),
                    const SizedBox(height: 20),
                    FormBuilderTextField(
                      name: 'phoneNumber',
                      decoration:
                          const InputDecoration(labelText: 'Phone Number'),
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              const Text(
                'Choose Payment Method',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _paymentMethodButton(
                    'Cash on Delivery',
                    'assets/cash_on_delivery.jpg',
                    Colors.green,
                  ),
                  const SizedBox(width: 10),
                  _paymentMethodButton(
                    'Chapa',
                    'assets/chapa.jpg',
                    Colors.blue,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    var formData = _formKey.currentState!.value;
                    print('Name: ${formData['name']}');
                    print('Address: ${formData['address']}');
                    print('Phone Number: ${formData['phoneNumber']}');
                    _showSuccessMessage();
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  onPrimary: Colors.white,
                ),
                child: const Text('Place Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _paymentMethodButton(String label, String imagePath, Color color) {
    return ElevatedButton(
      onPressed: () {
        if (label == 'Cash on Delivery') {
          // Handle cash on delivery option
          print('Selected: Cash on Delivery');
        } else if (label == 'Chapa') {
          // Handle Chapa payment option
          _redirectToChapaApi();
        }
      },
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: 50,
            width: 50,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  void _redirectToChapaApi() {
    // Logic to redirect to Chapa API
    print('Redirecting to Chapa API...');
  }

  void _showSuccessMessage() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Success'),
        content: const Text('Order submitted successfully!'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
            ),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
