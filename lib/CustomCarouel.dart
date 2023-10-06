import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Carousel extends StatelessWidget {
  final List<String> items = ["Item 1", "Item 2", "Item 3"];
  final List<String> urls = ["https://example.com", "https://example.org", "https://example.net"];
  final List<String> images = ["image1.jpg", "image2.jpg", "image3.jpg"]; // Add your image file paths

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _launchURL(urls[index]),
            child: Card(
              elevation: 5.0,
              margin: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200.0,
                    child: Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                  ListTile(
                    title: Text(items[index]),
                    subtitle: Text('Tap to open web page'),
                    leading: Icon(Icons.open_in_browser),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}