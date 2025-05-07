import 'package:conecta_mayor/screens/assistance/chat_screen.dart';
import 'package:conecta_mayor/screens/assistance/sos_digital_screen.dart';
import 'package:conecta_mayor/screens/assistance/videocall_screen.dart';
import 'package:conecta_mayor/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

// Pantalla SOS Digital (debes tenerla en un archivo separado)
class MainAssistanceScreen extends StatefulWidget {
  const MainAssistanceScreen({super.key});

  @override
  State<MainAssistanceScreen> createState() => _MainAssistanceScreenState();
}

class _MainAssistanceScreenState extends State<MainAssistanceScreen> {
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
        title: const Text(
          'Asistencia',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
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
        elevation: 0,
      ),
    );
  }
}

// Pantalla principal de Asistencia
class AssistanceScreen extends StatefulWidget {
  const AssistanceScreen({super.key});

  @override
  State<AssistanceScreen> createState() => _AssistanceScreenState();
}

class _AssistanceScreenState extends State<AssistanceScreen> {
  final Color primaryColor = const Color(0xFF3366FF);
  final List<AssistanceOption> options = [
    AssistanceOption(
      title: 'SOS Digital',
      description:
          'Contacta inmediatamente con un familiar registrado o voluntario',
      icon: Icons.emergency,
      destination: SosDigitalScreen(title: 'SOS Digital'),
    ),
    AssistanceOption(
      title: 'Videollamada de Asistencia',
      description:
          'Realiza una videollamada para recibir soporte en tiempo real',
      icon: Icons.video_camera_back,
      destination: VideoCallScreen(title: 'Videollamada de Asistencia'),
    ),
    AssistanceOption(
      title: 'Chat de Ayuda',
      description: 'Envía mensajes para recibir soporte por escrito',
      icon: Icons.chat_bubble,
      destination: ChatScreen(title: 'Chat de Ayuda'),
    ),
    AssistanceOption(
      title: 'Agendar Capacitación',
      description: 'Programa una sesión personalizada con un instructor',
      icon: Icons.calendar_today,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 31),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Asistencia',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
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
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                '¿Cómo podemos ayudarte?',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children:
                  options
                      .map((option) => _buildOptionCard(option, context))
                      .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard(AssistanceOption option, BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          if (option.destination != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => option.destination!),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(option.icon, size: 30, color: primaryColor),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      option.title,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      option.description,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AssistanceOption {
  final String title;
  final String description;
  final IconData icon;
  final Widget? destination;

  AssistanceOption({
    required this.title,
    required this.description,
    required this.icon,
    this.destination,
  });
}
