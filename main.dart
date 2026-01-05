import 'package:flutter/material.dart';

void main() => runApp(PakAgriApp());

class PakAgriApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: AgriHome(),
    );
  }
}

class AgriHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background White Waves
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: Icon(Icons.waves, size: 800, color: Colors.green),
            ),
          ),
          Column(
            children: [
              // Government Green Header
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF00441B), // Official deep green
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
                ),
                child: Center(
                  child: Text("PAK AGRI AI", 
                    style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 2)),
                ),
              ),
              Spacer(),
              // AI Status
              Icon(Icons.psychology, size: 100, color: Color(0xFF00441B)),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text("AI Model: PakAgriBrain Loaded", 
                  style: TextStyle(color: Color(0xFF00441B), fontSize: 18, fontWeight: FontWeight.w500)),
              ),
              Spacer(),
              // Action Button
              Padding(
                padding: EdgeInsets.all(40),
                child: ElevatedButton.icon(
                  icon: Icon(Icons.camera_enhance),
                  label: Text("START ANALYSIS", style: TextStyle(fontSize: 18)),
                  onPressed: () {}, // This triggers your .tflite model
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF00441B),
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
