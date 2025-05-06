import 'package:flutter/material.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  bool _isVideoOn = true;
  bool _isMicOn = true;
  bool _isFrontCamera = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Video remoto (soporte)
            _buildRemoteVideo(),
            // Video local (usuario)
            _buildLocalVideo(),
            // Controles de llamada
            _buildCallControls(),
            // Encabezado con información
            _buildCallHeader(),
          ],
        ),
      ),
    );
  }

  Widget _buildRemoteVideo() {
    return Container(
      color: Colors.grey[900],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/support_avatar.png'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Soporte Técnico',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              _isVideoOn ? 'Estableciendo conexión...' : 'Llamada en curso',
              style: const TextStyle(color: Colors.white70, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocalVideo() {
    return Positioned(
      bottom: 120,
      right: 20,
      child: GestureDetector(
        onTap: () => setState(() => _isFrontCamera = !_isFrontCamera),
        child: Container(
          width: 150,
          height: 200,
          decoration: BoxDecoration(
            color: _isVideoOn ? Colors.blueGrey[800] : Colors.black,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white, width: 2),
          ),
          child:
              _isVideoOn
                  ? Icon(
                    _isFrontCamera ? Icons.face : Icons.face_retouching_natural,
                    color: Colors.white,
                    size: 50,
                  )
                  : const Icon(
                    Icons.videocam_off,
                    color: Colors.white,
                    size: 40,
                  ),
        ),
      ),
    );
  }

  Widget _buildCallControls() {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Botón de micrófono
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white.withOpacity(0.2),
            child: IconButton(
              icon: Icon(
                _isMicOn ? Icons.mic : Icons.mic_off,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () => setState(() => _isMicOn = !_isMicOn),
            ),
          ),
          // Botón de colgar
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.red,
            child: IconButton(
              icon: const Icon(Icons.call_end, color: Colors.white, size: 36),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          // Botón de cámara
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white.withOpacity(0.2),
            child: IconButton(
              icon: Icon(
                _isVideoOn ? Icons.videocam : Icons.videocam_off,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () => setState(() => _isVideoOn = !_isVideoOn),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCallHeader() {
    return Positioned(
      top: 20,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Duración de la llamada (simulada)
          const Text(
            '05:23',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Botón para más opciones
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white, size: 30),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
