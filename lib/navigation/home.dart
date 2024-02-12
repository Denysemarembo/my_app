import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOMEPAGE'),
        backgroundColor: Colors.indigo,
        
      ),
      backgroundColor: Colors.lightBlue,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to My App!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.grey,
              ),
              
            ),
            SizedBox(height: 20),
            Text(
              'This mobile app has a homepage,calculator and about page.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
              
            ),
          ],
        ),
      ),
    );
  }
}
