import 'package:conecta_mayor/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class CommunicationTipsScreen extends StatefulWidget {
  final String title;

  const CommunicationTipsScreen({super.key, required this.title});

  @override
  State<CommunicationTipsScreen> createState() =>
      _CommunicationTipsScreenState();
}

class _CommunicationTipsScreenState extends State<CommunicationTipsScreen> {
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
        elevation: 0,
      ),
      body: _buildBodyContent(),
      backgroundColor: const Color(0xFFF4F8FF),
    );
  }

  Widget _buildBodyContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text(
                'Tips comunicación',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF3366FF),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Card para el mensaje inspiracional
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  "\"Mantente conectado con tus seres queridos de forma sencilla\"",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),

          // Primera Card - Consejos Básicos
          _buildMainCard(Icons.contact_phone, 'Consejos Básicos', [
            _buildTipCard(
              '1. Agrega contactos importantes',
              'Guarda los números de familiares en tu lista de contactos',
            ),
            SizedBox(height: 12),
            _buildTipCard(
              '2. Usa mensajes de voz',
              'Si te cuesta escribir, graba un mensaje de audio',
            ),
            SizedBox(height: 12),
            _buildTipCard(
              '3. Configura contactos favoritos',
              'Marca a tus familiares como favoritos para llamarlos más fácil',
            ),
          ]),

          const SizedBox(height: 20),

          // Segunda Card - Formas de comunicarte
          _buildMainCard(Icons.chat_bubble, 'Formas de comunicarte', [
            _buildCommunicationMethodCard(
              Icons.call,
              'Llamada',
              'Simple y directo',
            ),
            SizedBox(height: 12),
            _buildCommunicationMethodCard(
              Icons.videocam,
              'Videollamada',
              'Ver a tus seres queridos',
            ),
            SizedBox(height: 12),
            _buildCommunicationMethodCard(
              Icons.message,
              'Mensaje',
              'Texto o audio',
            ),
            SizedBox(height: 12),
            _buildCommunicationMethodCard(
              Icons.group,
              'Grupo',
              'Habla con varios',
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildMainCard(IconData icon, String title, List<Widget> children) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border(
          left: BorderSide(color: const Color(0xFF3366FF), width: 5),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: const Color(0xFF3366FF), size: 32),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF3366FF),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildTipCard(String title, String content) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[100],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF3366FF),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(fontSize: 28, color: Colors.black87, height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _buildCommunicationMethodCard(
    IconData icon,
    String title,
    String description,
  ) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[100],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF3366FF), size: 32),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3366FF),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black87,
                    height: 1.4,
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
