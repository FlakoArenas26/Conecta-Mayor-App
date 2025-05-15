import 'package:conecta_mayor/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class TipsScreen extends StatefulWidget {
  final String title;

  const TipsScreen({super.key, required this.title});

  @override
  State<TipsScreen> createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
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
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 15),
                          Text(
                            'Consejos Tecnológicos',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF3366FF),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),

                      // Mensaje inspiracional
                      Center(
                        child: Text(
                          "\"La tecnología puede abrirnos un mundo de posibilidades a cualquier edad\"",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),

                      // Card 1 - Lectura Digital
                      _buildTipCard(
                        Icons.menu_book,
                        "Lectura Digital",
                        "Cómo ajustar el texto para leer cómodamente",
                      ),

                      const SizedBox(height: 20.0),

                      // Card 2 - Uso de Celular
                      _buildTipCard(
                        Icons.smartphone,
                        "Uso de Celular",
                        "Consejos para usar su teléfono sin dificultad",
                      ),

                      const SizedBox(height: 20.0),

                      // Card 3 - Comunicación
                      _buildTipCard(
                        Icons.chat_bubble,
                        "Comunicación",
                        "Cómo comunicarse fácilmente con familiares y amigos",
                      ),

                      const SizedBox(height: 20.0),

                      // Card 4 - Entretenimiento
                      _buildTipCard(
                        Icons.local_movies,
                        "Entretenimiento",
                        "Cómo disfrutar contenido digital de forma accesible",
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTipCard(IconData icon, String title, String description) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border(
          left: BorderSide(color: const Color(0xFF1A53F8), width: 5),
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
            Center(child: Icon(icon, color: Colors.blue, size: 75)),
            const SizedBox(height: 10),
            Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              description,
              style: TextStyle(fontSize: 28, color: Colors.black87),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
