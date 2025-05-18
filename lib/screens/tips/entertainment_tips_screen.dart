import 'package:conecta_mayor/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class EntertainmentTipsScreen extends StatefulWidget {
  final String title;

  const EntertainmentTipsScreen({super.key, required this.title});

  @override
  State<EntertainmentTipsScreen> createState() =>
      _EntertainmentTipsScreenState();
}

class _EntertainmentTipsScreenState extends State<EntertainmentTipsScreen> {
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
                'Contenido digital',
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
                  "\"Descubre nuevas formas de entretenimiento adaptadas a ti\"",
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

          // Card 1 - Consejos Prácticos
          _buildMainCard(Icons.lightbulb_outline, 'Consejos Prácticos', [
            _buildTipCard(
              '1. Ajusta el tamaño del texto',
              'Ve a Configuración → Accesibilidad → Tamaño de texto',
            ),
            SizedBox(height: 12),
            _buildTipCard(
              '2. Activa subtítulos automáticos',
              'En YouTube: Toca el icono CC → Configuración',
            ),
            SizedBox(height: 12),
            _buildTipCard(
              '3. Usa controles de voz',
              'Di "Ok Google, reproducir música relajante"',
            ),
          ]),

          const SizedBox(height: 20),

          // Card 2 - Videos recomendados
          _buildMainCard(Icons.local_movies, 'Videos recomendados', [
            _buildMediaCard(
              'Tutorial de jardinería básica',
              '15 min • Subtítulos disponibles',
            ),
            SizedBox(height: 12),
            _buildMediaCard(
              'Recetas fáciles para principiantes',
              '22 min • Audio descriptivo',
            ),
          ]),

          const SizedBox(height: 20),

          // Card 3 - Audiolibros recomendados
          _buildMainCard(Icons.menu_book, 'Audiolibros recomendados', [
            _buildMediaCard(
              'Cuentos clásicos narrados',
              '3 horas 15 min • Voz clara',
            ),
            SizedBox(height: 12),
            _buildMediaCard(
              'Historia del arte para todos',
              '5 horas • Con explicaciones',
            ),
          ]),

          const SizedBox(height: 20),

          // Card 4 - Listas de música
          _buildMainCard(Icons.music_note, 'Listas de música', [
            _buildMediaCard('Boleros de los 60s', '2 horas • 25 canciones'),
            SizedBox(height: 12),
            _buildMediaCard(
              'Música clásica relajante',
              '3 horas • Para leer o dormir',
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

  Widget _buildMediaCard(String title, String details) {
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
          SizedBox(height: 4),
          Text(details, style: TextStyle(fontSize: 26, color: Colors.black87)),
        ],
      ),
    );
  }
}
