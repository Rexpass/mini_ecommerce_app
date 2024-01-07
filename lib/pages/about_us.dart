import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_social_button/flutter_social_button.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key});

  // Function to launch URLs
  void launchURL(String url) async {
    if (url.isNotEmpty && await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("About us"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/MSK_4993.JPG'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Robel Effa',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'The developer behind this application. I am a \n computer science & software engineering student \n specialize in Backend Devt. For more info Contact me.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlutterSocialButton(
                    onTap: () {
                      launchURL(
                          'https://www.linkedin.com/in/robel-effa-7178a7265/');
                    },
                    mini: true,
                    buttonType: ButtonType.linkedin,
                  ),
                ),

                const SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlutterSocialButton(
                    onTap: () {
                      launchURL('https://twitter.com/RobelEffa');
                    },
                    mini: true,
                    buttonType: ButtonType.twitter,
                  ),
                ),

                const SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlutterSocialButton(
                    onTap: () {
                      launchURL('https://github.com/Rexpass');
                    },
                    mini: true,
                    buttonType: ButtonType.github,
                  ),
                ),
                // Add more social media links
              ],
            ),
          ],
        ),
      ),
    );
  }
}
