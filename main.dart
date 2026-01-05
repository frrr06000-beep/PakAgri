import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PakAgriApp(camera: cameras.first),
  ));
}

class PakAgriApp extends StatefulWidget {
  final CameraDescription camera;
  PakAgriApp({required this.camera});
  @override
  _PakAgriAppState createState() => _PakAgriAppState();
}

class _PakAgriAppState extends State<PakAgriApp> {
  late CameraController _controller;
  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.camera, ResolutionPreset.medium);
    _controller.initialize().then((_) {
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // The Background Waves
          Positioned.fill(child: Opacity(opacity: 0.1, child: Icon(Icons.waves, size: 800, color: Colors.green))),
          Column(
            children: [
              // Government Green Header
              Container(
                height: 180, width: double.infinity,
                decoration: BoxDecoration(color: Color(0xFF00441B), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50))),
                child: Center(child: Text("PAK AGRI AI", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold))),
              ),
              // The Camera View (The Eyes)
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: _controller.value.isInitialized ? CameraPreview(_controller) : Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),
              // AI Scan Button
              Padding(
                padding: EdgeInsets.only(bottom: 40, left: 40, right: 40),
                child: ElevatedButton.icon(
                  icon: Icon(Icons.center_focus_strong, color: Colors.white),
                  label: Text("SCAN CROP DISEASE", style: TextStyle(color: Colors.white, fontSize: 18)),
                  onPressed: () {}, // This will trigger your PakAgriBrain.tflite
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF00441B), minimumSize: Size(double.infinity, 60), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
