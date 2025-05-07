import 'package:flutter/material.dart';

class VideoCallSupportScreen extends StatefulWidget {
  final String title;
  final String phoneNumber;

  const VideoCallSupportScreen({
    super.key,
    required this.title,
    required this.phoneNumber,
  });

  @override
  State<VideoCallSupportScreen> createState() => _VideoCallSupportScreenState();
}

class _VideoCallSupportScreenState extends State<VideoCallSupportScreen> {
  bool _isConnected = true;
  final bool _showControls = true;
  bool _isCameraOn = true;
  bool _isMicOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
      ),
      body: Stack(
        children: [
          // Video del asistente (simulado)
          if (_isConnected)
            Center(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.grey[800],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.blueGrey,
                      child: Icon(Icons.person, size: 80, color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(color: Colors.white),
                  const SizedBox(height: 20),
                  Text(
                    'Conectando con ${widget.title}...',
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
            ),

          // Video del usuario (recuadro pequeño)
          if (_isConnected && _isCameraOn)
            Positioned(
              top: 20,
              right: 20,
              child: Container(
                width: 120,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blueGrey,
                      child: Icon(Icons.person, size: 40, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text('Tú', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),

          // Controles
          if (_showControls)
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () => Navigator.pop(context),
                    backgroundColor: _isConnected ? Colors.red : Colors.green,
                    child: Icon(
                      _isConnected ? Icons.call_end : Icons.videocam,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 30),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        _isMicOn = !_isMicOn;
                      });
                    },
                    backgroundColor: Colors.grey[800],
                    child: Icon(
                      _isMicOn ? Icons.mic : Icons.mic_off,
                      color: _isMicOn ? Colors.white : Colors.red,
                    ),
                  ),
                  const SizedBox(width: 30),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        _isCameraOn = !_isCameraOn;
                      });
                    },
                    backgroundColor: Colors.grey[800],
                    child: Icon(
                      _isCameraOn ? Icons.videocam : Icons.videocam_off,
                      color: _isCameraOn ? Colors.white : Colors.red,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
