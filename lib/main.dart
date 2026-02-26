
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:permission_handler/permission_handler.dart';

// ---------------- CONFIGURATION ----------------
// GET YOUR KEY HERE: https://aistudio.google.com/app/apikey
const String apiKey = "'Gemini_API_Key'"; 
// -----------------------------------------------

late List<CameraDescription> _cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _cameras = await availableCameras();
  runApp(const SafePathApp());
}

class SafePathApp extends StatelessWidget {
  const SafePathApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BlindCameraScreen(),
    );
  }
}

class BlindCameraScreen extends StatefulWidget {
  const BlindCameraScreen({super.key});

  @override
  State<BlindCameraScreen> createState() => _BlindCameraScreenState();
}

class _BlindCameraScreenState extends State<BlindCameraScreen> {
  late CameraController _controller;
  final FlutterTts _tts = FlutterTts();
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _speak("Safe Path Active. Tap the screen to scan.");
  }

  Future<void> _initializeCamera() async {
    // Ask for permissions first
    await Permission.camera.request();
    
    _controller = CameraController(_cameras[0], ResolutionPreset.medium);
    await _controller.initialize();
    if (!mounted) return;
    setState(() {});
  }

  Future<void> _speak(String text) async {
    await _tts.setLanguage("en-US");
    await _tts.setPitch(1.0);
    await _tts.speak(text);
  }

  Future<void> _analyzeScene() async {
    if (_isProcessing) return;
    setState(() => _isProcessing = true);
    await _speak("Analyzing...");

    try {
      // 1. Take Picture
      final image = await _controller.takePicture();
      final imageBytes = await image.readAsBytes();

      // 2. Send to Gemini AI
      final model = GenerativeModel(model: 'gemini-2.5-flash', apiKey: apiKey);
      final prompt = TextPart("I am blind. In 1 short sentence, tell me what is directly in front of me and if it is dangerous.");
      final content = [
        Content.multi([prompt, DataPart('image/jpeg', imageBytes)])
      ];

      final response = await model.generateContent(content);
      
      // 3. Speak Result
      await _speak(response.text ?? "I could not see anything.");

    } catch (e) {
      // This will make the phone read the specific technical error out loud
      await _speak(e.toString().substring(0, 50)); 
    } finally {
      setState(() => _isProcessing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    // THE SCREEN IS THE BUTTON
    return Scaffold(
      body: GestureDetector(
        onTap: _analyzeScene,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CameraPreview(_controller),
            // Visual overlay for sighted judges to see what's happening
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 100,
                color: Colors.black54,
                child: Center(
                  child: Text(
                    _isProcessing ? "AI IS THINKING..." : "TAP SCREEN TO SCAN",
                    style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}