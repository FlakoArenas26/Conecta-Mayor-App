import 'package:conecta_mayor/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class PasswordSecureScreen extends StatefulWidget {
  final String title;

  const PasswordSecureScreen({super.key, required this.title});

  @override
  State<PasswordSecureScreen> createState() => _PasswordSecureScreenState();
}

class _PasswordSecureScreenState extends State<PasswordSecureScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _generatedPasswordController =
      TextEditingController();
  bool _obscureText = true;
  double _passwordStrength = 0.0;
  String _passwordFeedback = '';

  @override
  void dispose() {
    _passwordController.dispose();
    _generatedPasswordController.dispose();
    super.dispose();
  }

  void _checkPasswordStrength(String password) {
    double strength = 0.0;
    String feedback = '';

    if (password.isEmpty) {
      setState(() {
        _passwordStrength = 0.0;
        _passwordFeedback = '';
      });
      return;
    }

    // Longitud mínima
    if (password.length >= 12) {
      strength += 0.3;
    } else {
      feedback = 'Mínimo 12 caracteres';
    }

    // Contiene mayúsculas y minúsculas
    if (password.contains(RegExp(r'[A-Z]'))) strength += 0.2;
    if (password.contains(RegExp(r'[a-z]'))) strength += 0.1;

    // Contiene números
    if (password.contains(RegExp(r'[0-9]'))) strength += 0.2;

    // Contiene símbolos
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) strength += 0.2;

    // Asegurar que no exceda 1.0
    strength = strength.clamp(0.0, 1.0);

    setState(() {
      _passwordStrength = strength;
      _passwordFeedback = feedback;
    });
  }

  void _generatePassword() {
    const String upperCase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const String lowerCase = 'abcdefghijklmnopqrstuvwxyz';
    const String numbers = '0123456789';
    const String symbols = '!@#\$%^&*()<>,./';

    String allChars = upperCase + lowerCase + numbers + symbols;
    const int length = 12;

    String password = '';
    for (int i = 0; i < length; i++) {
      int randomIndex = Random.secure().nextInt(allChars.length);
      password += allChars[randomIndex];
    }

    setState(() {
      _generatedPasswordController.text = password;
    });
  }

  Future<void> _copyToClipboard() async {
    await Clipboard.setData(
      ClipboardData(text: _generatedPasswordController.text),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Contraseña copiada al portapapeles',
          style: TextStyle(fontSize: 24),
        ),
        duration: Duration(seconds: 2),
      ),
    );
  }

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
          // Título centrado
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text(
                'Seguridad de contraseñas',
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

          // Contenido normal (alineado a la izquierda)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Card para evaluar contraseña
              Container(
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
                          Icon(
                            Icons.lock,
                            color: const Color(0xFF3366FF),
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          const Text(
                            "Evaluar Contraseña",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _passwordController,
                        obscureText: _obscureText,
                        onChanged: _checkPasswordStrength,
                        style: TextStyle(fontSize: 28),
                        decoration: InputDecoration(
                          hintText: 'Ingresa tu contraseña',
                          hintStyle: TextStyle(fontSize: 28),
                          border: OutlineInputBorder(),
                          errorText:
                              _passwordFeedback.isNotEmpty
                                  ? _passwordFeedback
                                  : null,
                          errorStyle: TextStyle(fontSize: 22),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 18,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                              size: 40,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Mostrar el indicador de fortaleza SOLO cuando hay texto
                      if (_passwordController.text.isNotEmpty) ...[
                        LinearProgressIndicator(
                          value: _passwordStrength,
                          backgroundColor: Colors.grey[300],
                          color:
                              _passwordStrength < 0.4
                                  ? Colors.red
                                  : _passwordStrength < 0.7
                                  ? Colors.orange
                                  : Colors.green,
                          minHeight: 10,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          _passwordStrength < 0.4
                              ? 'Débil'
                              : _passwordStrength < 0.7
                              ? 'Intermedia'
                              : 'Excelente',
                          style: TextStyle(
                            fontSize: 24,
                            color:
                                _passwordStrength < 0.4
                                    ? Colors.red
                                    : _passwordStrength < 0.7
                                    ? Colors.orange
                                    : Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Card para generar contraseña segura
              Container(
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
                          Icon(Icons.autorenew, color: Colors.blue, size: 30),
                          SizedBox(width: 10),
                          const Text(
                            "Generar Contraseña Segura",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Campo de texto para mostrar la contraseña generada
                      TextField(
                        controller: _generatedPasswordController,
                        readOnly: true,
                        style: TextStyle(fontSize: 28),
                        decoration: InputDecoration(
                          hintText: 'Contraseña generada',
                          hintStyle: TextStyle(fontSize: 28),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 18,
                          ),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.copy,
                                  color: Colors.black,
                                  size: 40,
                                ),
                                onPressed: _copyToClipboard,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Botón para generar
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3366FF),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          onPressed: _generatePassword,
                          child: const Text(
                            'Generar',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Card de consejos de seguridad
              Container(
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
                      const Text(
                        "Consejos para contraseñas seguras",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Consejo 1
                      _buildSecurityTip(
                        Icons.check_circle,
                        "Utiliza al menos 12 caracteres",
                      ),
                      const SizedBox(height: 16),

                      // Consejo 2
                      _buildSecurityTip(
                        Icons.check_circle,
                        "Combina mayúsculas, minúsculas, números y símbolos",
                      ),
                      const SizedBox(height: 16),

                      // Consejo 3
                      _buildSecurityTip(
                        Icons.check_circle,
                        "Evita información personal como nombres o fechas",
                      ),
                      const SizedBox(height: 16),

                      // Consejo 4
                      _buildSecurityTip(
                        Icons.check_circle,
                        "Utiliza contraseñas diferentes para cada servicio",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSecurityTip(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xFF3366FF), size: 28),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 28,
              height: 1.4,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
