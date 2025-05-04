import 'package:conecta_mayor/screens/assistance/assistance_screen.dart';
import 'package:flutter/material.dart';
import 'package:conecta_mayor/screens/learn/learn_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              Color(0xFF2D68F4),
              Color(0xFF2D68F4),
              Color(0xFF2D68F4),
              Colors.white,
            ],
            stops: [0.0, 0.5, 0.55, 0.55],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            // Añadido para permitir scroll
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.04), // Responsivo
                Text(
                  'Conecta Mayor',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: screenHeight * 0.04, // Tamaño responsivo
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'Tu guía digital personalizada',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: screenHeight * 0.02,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.03),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.06, // Padding responsivo
                  ),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: screenHeight * 0.02),
                          Text(
                            '¿Qué te gustaría hacer hoy?',
                            style: TextStyle(
                              fontSize: screenHeight * 0.028, // Responsivo
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF0633A4),
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2, // Previene overflow
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          _buildOptionButton(
                            context,
                            title: 'Aprender',
                            icon: Icons.menu_book,
                            onTap:
                                () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LearnScreen(),
                                  ),
                                ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          _buildOptionButton(
                            context,
                            title: 'Asistencia',
                            icon: Icons.phone,
                            onTap:
                                () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => const AssistanceScreen(),
                                  ),
                                ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          _buildOptionButton(
                            context,
                            title: 'Seguridad',
                            icon: Icons.shield,
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          _buildOptionButton(
                            context,
                            title: 'Consejos',
                            icon: Icons.lightbulb,
                          ),
                          SizedBox(height: screenHeight * 0.04),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton(
    BuildContext context, {
    required String title,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: screenWidth * 0.8, // Ancho mínimo responsivo
        maxWidth: screenWidth * 0.9, // Ancho máximo responsivo
        minHeight: 80, // Altura mínima fija
      ),
      child: ElevatedButton(
        onPressed: onTap ?? () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2D68F4),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          elevation: 0,
          padding: EdgeInsets.symmetric(
            vertical: 16,
            horizontal: screenWidth * 0.04,
          ),
        ),
        child: FittedBox(
          // Ajusta el contenido al espacio disponible
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: screenWidth * 0.08), // Icono responsivo
              SizedBox(width: screenWidth * 0.03),
              Flexible(
                // Permite que el texto se ajuste
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: screenWidth * 0.05, // Tamaño responsivo
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis, // Previene overflow
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
