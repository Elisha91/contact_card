import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contact Card'),
        ),
        body: BackgroundContainer(
          child: ContactCard(),
        ),
      ),
    );
  }
}

class BackgroundContainer extends StatelessWidget {
  final Widget child;

  BackgroundContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/profile.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}

class ContactCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.white.withOpacity(0.8), // Slightly transparent to see the background
        margin: EdgeInsets.all(16.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/contact.jpg'), // Make sure the path matches
              ),
              SizedBox(height: 16.0),
              Text(
                'Elisha kipkemboi',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'elishakipkemboi754@gmail.com',
                style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
              ),
              SizedBox(height: 8.0),
              Text(
                '0799040729',
                style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocialMediaIcon(
                    icon: FontAwesomeIcons.facebook,
                    url: 'https://facebook.com/Elisha Kipkemboi',
                  ),
                  SizedBox(width: 16.0),
                  SocialMediaIcon(
                    icon: FontAwesomeIcons.twitter,
                    url: 'https://twitter.com/@kipkemboiElisha',
                  ),
                  SizedBox(width: 16.0),
                  SocialMediaIcon(
                    icon: FontAwesomeIcons.instagram,
                    url: 'https://instagram.com/Blessedelishakenya',
                  ),
                  SizedBox(width: 16.0),
                  SocialMediaIcon(
                    icon: FontAwesomeIcons.linkedin,
                    url: 'https://linkedin.com/in/elisha-kipkemboi',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialMediaIcon extends StatelessWidget {
  final IconData icon;
  final String url;

  SocialMediaIcon({required this.icon, required this.url});

  Future<void> _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: FaIcon(icon),
      iconSize: 30.0,
      color: Colors.blue, // Customize icon color
      onPressed: _launchURL,
    );
  }
}
