import 'package:conecta_mayor/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class PhoneTipsScreen extends StatefulWidget {
  final String title;

  const PhoneTipsScreen({super.key, required this.title});

  @override
  _PhoneTipsScreenState createState() => _PhoneTipsScreenState();
}

class _PhoneTipsScreenState extends State<PhoneTipsScreen> {
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
                'Consejos para usar su telefóno',
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

          _buildMainCard(Icons.settings_display, 'Personalizar la Pantalla', [
            _buildTipCard(
              'Iconos más grandes',
              'Mantenga presionada la pantalla inicial y busque la opción de "Configuración de la pantalla" para aumentar el tamaño de los iconos.',
            ),
            SizedBox(height: 12),
            _buildTipCard(
              'Teclado más grande',
              'En la configuración del teclado puede activar un teclado más grande para escribir con mayor facilidad.',
            ),
          ]),

          const SizedBox(height: 20),

          _buildMainCard(Icons.accessibility, 'Opciones de Accesibilidad', [
            _buildTipCard(
              'Lupa integrada',
              'La mayoría de los teléfonos tienen una opción de lupa en el menú de accesibilidad para ayudarle a leer textos pequeños.',
            ),
            SizedBox(height: 12),
            _buildTipCard(
              'Asistente de voz',
              'Active el asistente de voz para que pueda dar comandos hablados sin necesidad de escribir.',
            ),
          ]),

          const SizedBox(height: 20),

          _buildMainCard(Icons.notifications, 'Notificaciones', [
            _buildTipCard(
              'Personalice sus alertas',
              'Ajuste el volumen de las notificaciones o active la vibración para no perderse llamadas o mensajes importantes.',
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
              color: Color(0xFF3366FF),
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
}
