import 'package:conecta_mayor/screens/assistance/videocall_support_screen.dart';
import 'package:conecta_mayor/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class VideoCallScreen extends StatefulWidget {
  final String title;

  const VideoCallScreen({super.key, required this.title});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3366FF),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 31),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.home, size: 32),
            onPressed:
                () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                  (Route<dynamic> route) => false,
                ),
            tooltip: 'Inicio',
          ),
        ],
      ),
      body: _buildBodyContent(),
      backgroundColor: const Color(0xFFF4F8FF),
    );
  }

  Widget _buildBodyContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Contactos de Soporte',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF3366FF),
                ),
              ),
            ),
          ),
          _buildInstructions(),
          const SizedBox(height: 16),
          _buildSupportContacts(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildSupportContacts() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.all(16)),
          _buildContactItem(name: 'Soporte Bancario', phone: '3101234567'),
          const Divider(height: 1, thickness: 1, indent: 16, endIndent: 16),
          _buildContactItem(name: 'Soporte Técnico', phone: '3009876543'),
          const Divider(height: 1, thickness: 1, indent: 16, endIndent: 16),
          _buildContactItem(name: 'Soporte Médico', phone: '3204567890'),
          const Divider(height: 1, thickness: 1, indent: 16, endIndent: 16),
          _buildContactItem(name: 'Soporte Familiar', phone: '3155551234'),
        ],
      ),
    );
  }

  Widget _buildContactItem({required String name, required String phone}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFE6F0FF),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.transparent),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 16,
            backgroundColor: Color(0xFFCFDEFF),
            child: Icon(Icons.person, color: Color(0xFF3366FF), size: 26),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  phone,
                  style: const TextStyle(
                    fontSize: 26,
                    color: Color.fromARGB(255, 61, 61, 61),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => VideoCallSupportScreen(
                        title: name,
                        phoneNumber: phone,
                      ),
                ),
              );
            },
            icon: const Icon(Icons.videocam, size: 24),
            label: const Text(
              'Video',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3366FF),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInstructions() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Instrucciones',
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'A continuación encontrará una lista de contactos de soporte. Elige con cual deseas comunicarte y empieza tu videollamada para darte una mejor asesoría.',
            style: TextStyle(
              fontSize: 24,
              color: Color.fromARGB(255, 22, 22, 22),
            ),
          ),
        ],
      ),
    );
  }
}
