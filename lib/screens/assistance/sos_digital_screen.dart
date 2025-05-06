import 'package:conecta_mayor/screens/assistance/call_screen.dart';
import 'package:conecta_mayor/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class SosDigitalScreen extends StatefulWidget {
  final String title;

  const SosDigitalScreen({super.key, required this.title});

  @override
  State<SosDigitalScreen> createState() => _SosDigitalScreenState();
}

class _SosDigitalScreenState extends State<SosDigitalScreen> {
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
                'Contactos de Emergencia',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A53F8),
                ),
              ),
            ),
          ),
          _buildEmergencyContacts(), // 1. Lista de contactos
          const SizedBox(height: 16),
          _buildInstructions(), // 2. Instrucciones
          const SizedBox(height: 16),
          _buildEmergencySosButton(), // 3. Botón de emergencia (ahora al final)
        ],
      ),
    );
  }

  Widget _buildEmergencyContacts() {
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
          _buildContactItem(name: 'Hija', phone: '310-123-4567'),
          const Divider(height: 1, thickness: 1, indent: 16, endIndent: 16),
          _buildContactItem(name: 'Hijo', phone: '300-987-6543'),
          const Divider(height: 1, thickness: 1, indent: 16, endIndent: 16),
          _buildContactItem(name: 'Dr. Rodríguez', phone: '320-456-7890'),
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
                    fontWeight: FontWeight.bold, // Cambiado de w500 a bold
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
                      (context) =>
                          CallScreen(contactName: name, phoneNumber: phone),
                ),
              );
            },
            icon: const Icon(Icons.phone, size: 24),
            label: const Text(
              'Llamar',
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
          Align(
            alignment: Alignment.center, // Centra horizontalmente
            child: const Text(
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
            'Presiona el botón rojo para enviar una alerta a todos tus contactos de emergencia. Ellos recibirán tu ubicación y podrán llamarte inmediatamente.',
            style: TextStyle(
              fontSize: 24,
              color: Color.fromARGB(255, 22, 22, 22),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmergencySosButton() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton.icon(
        onPressed: () => _showEmergencyAlert(context),
        icon: const Icon(Icons.phone_enabled, color: Colors.white, size: 35),
        label: const Text(
          'Emergencia SOS',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  void _showEmergencyAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // El usuario debe tocar un botón para cerrar
      builder:
          (context) => AlertDialog(
            backgroundColor: Colors.white,
            icon: const Icon(
              Icons.warning_rounded,
              color: Colors.red,
              size: 100,
            ),
            title: const Text(
              '¡ALERTA DE EMERGENCIA ENVIADA!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
            content: const Text(
              'Se ha enviado tu ubicación a todos tus contactos de emergencia. '
              'Ellos recibirán una notificación y podrán contactarte inmediatamente.',
              style: TextStyle(fontSize: 26, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                  foregroundColor: const Color(
                    0xFF3366FF,
                  ), // Color del texto y efecto ripple
                ),
                child: const Text(
                  'Cerrar', // Texto en mayúsculas para mantener consistencia
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3366FF), // Mismo color que el tema
                  ),
                ),
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
    );
  }
}
