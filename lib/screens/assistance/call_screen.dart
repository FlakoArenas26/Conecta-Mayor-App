import 'package:flutter/material.dart';

class CallScreen extends StatefulWidget {
  final String contactName;
  final String phoneNumber;

  const CallScreen({
    super.key,
    required this.contactName,
    required this.phoneNumber,
  });

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  final bool _isCallConnected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Contacto y estado de llamada
            Column(
              children: [
                Text(
                  widget.contactName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.phoneNumber,
                  style: const TextStyle(color: Colors.grey, fontSize: 24),
                ),
                const SizedBox(height: 16),
                Text(
                  _isCallConnected ? 'Conectado' : 'Llamando...',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            const Spacer(),
            // Avatar del contacto (puedes personalizarlo)
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.grey[800],
              child: const Icon(Icons.person, size: 100, color: Colors.white),
            ),
            const Spacer(),
            // Botones de acción
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Botón de silencio (opcional)
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mic_off, size: 32),
                    color: Colors.white,
                  ),
                  // Botón de colgar
                  FloatingActionButton(
                    onPressed: () => Navigator.pop(context),
                    backgroundColor: Colors.red,
                    child: const Icon(
                      Icons.call_end,
                      size: 36,
                      color: Colors.white,
                    ),
                  ),
                  // Botón de altavoz (opcional)
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.volume_up, size: 32),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
