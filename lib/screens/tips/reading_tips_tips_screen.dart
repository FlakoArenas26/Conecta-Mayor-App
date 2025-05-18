import 'package:conecta_mayor/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class ReadingTipsScreen extends StatefulWidget {
  final String title;

  const ReadingTipsScreen({super.key, required this.title});

  @override
  _ReadingTipsScreenState createState() => _ReadingTipsScreenState();
}

class _ReadingTipsScreenState extends State<ReadingTipsScreen> {
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
                'Consejos de Lectura',
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

          _buildMainCard(Icons.remove_red_eye, 'Cuidando su Vista', [
            _buildTipCard(
              'Ajustar el brillo de la pantalla',
              'Mantenga un brillo adecuado para no cansar la vista. Por lo general, el brillo debe ser similar a la luz ambiental de la habitación.',
            ),
            SizedBox(height: 12),
            _buildTipCard(
              'Tome descansos regulares',
              'La regla 20-20-20: cada 20 minutos, mire algo a 20 pies (6 metros) durante 20 segundos.',
            ),
          ]),

          const SizedBox(height: 20),

          _buildMainCard(Icons.text_fields, 'Aumentando la Legibilidad', [
            _buildTipCard(
              'Aumentar el tamaño del texto',
              'En la mayoría de los dispositivos, puede ir a Configuración > Pantalla > Tamaño de texto para hacerlo más grande.',
            ),
            SizedBox(height: 12),
            _buildTipCard(
              'Usar modo oscuro o luz',
              'Según la hora del día, puede cambiar entre modo oscuro (fondo negro) y modo luz (fondo blanco) para mayor comodidad.',
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
