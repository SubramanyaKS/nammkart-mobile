import 'package:flutter/material.dart';
import 'package:nammkart/src/features/about/data/about_data.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            // Text('About Us', style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            // SizedBox(height: 30,),
            Text(
              AboutData.appNAme,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),
            Text(AboutData.tagline),
            SizedBox(
              height: 20,
            ),
            Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.shopping_cart,
                  size: 60,
                  color: Colors.deepPurple,
                )),
            SizedBox(
              height: 20,
            ),
            Text(AboutData.description, style: TextStyle(fontSize: 18)),
            SizedBox(
              height: 20,
            ),
            Text(
              'Vision',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(AboutData.vision, style: TextStyle(fontSize: 18)),
            SizedBox(
              height: 20,
            ),
            Text(
              'Mission',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(AboutData.mission, style: TextStyle(fontSize: 18)),
          ],
        ),
      )),
    );
  }
}
