import 'package:conecta_mayor/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class VerifyScreen extends StatefulWidget {
  final String title;

  const VerifyScreen({super.key, required this.title});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final TextEditingController _urlController = TextEditingController();
  bool _showAlert = false;
  bool _isSecure = false;
  bool _showInvalidUrlError = false;

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  bool _isValidUrl(String url) {
    // Expresión regular simple para validar URLs básicas
    final urlRegex = RegExp(
      r'^(https?:\/\/)?' // http:// or https://
      r'([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}' // dominio
      r'(\/[^\s]*)?$', // path opcional
      caseSensitive: false,
    );
    return urlRegex.hasMatch(url);
  }

  void _verifyUrl() {
    String url = _urlController.text.trim().toLowerCase();

    if (url.isEmpty) {
      setState(() {
        _showInvalidUrlError = true;
        _showAlert = false;
      });
      return;
    }

    if (!_isValidUrl(url)) {
      setState(() {
        _showInvalidUrlError = true;
        _showAlert = false;
      });
      return;
    }

    setState(() {
      _showInvalidUrlError = false;
      _showAlert = true;
      _isSecure = url.startsWith('https://');
    });

    // Hide alert after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _showAlert = false;
        });
      }
    });
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
      body: Stack(
        children: [_buildBodyContent(), if (_showAlert) _buildSecurityAlert()],
      ),
      backgroundColor: const Color(0xFFF4F8FF),
    );
  }

  Widget _buildSecurityAlert() {
    return Positioned(
      top: 20,
      left: 20,
      right: 20,
      child: AnimatedOpacity(
        opacity: _showAlert ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _isSecure ? Colors.green.shade600 : Colors.red.shade600,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    _isSecure ? Icons.security : Icons.warning_amber_rounded,
                    color: Colors.white,
                    size: 32,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    _isSecure ? "Enlace Seguro" : "Enlace Peligroso",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                _isSecure
                    ? "Este enlace parece seguro. Aún así, siempre verifica la identidad del sitio web antes de ingresar información personal."
                    : "El enlace no parece seguro. Evita compartir información personal.\nRecomendación: No abras este enlace ni proporciones información personal o bancaria.",
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
            ],
          ),
        ),
      ),
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
                'Comprueba si un enlace es seguro',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A53F8),
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
              // Card para ingresar enlace
              Container(
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
                      Row(
                        children: [
                          Icon(Icons.language, color: Colors.blue, size: 30),
                          SizedBox(width: 10),
                          const Text(
                            "Ingresa el enlace a verificar",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Campo de texto para ingresar el enlace
                      TextField(
                        controller: _urlController,
                        decoration: InputDecoration(
                          hintText: 'https://ejemplo.com',
                          border: OutlineInputBorder(),
                          errorText:
                              _showInvalidUrlError
                                  ? 'Por favor ingresa una URL válida'
                                  : null,
                          errorStyle: TextStyle(fontSize: 22),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Botón para verificar
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1A53F8),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          onPressed: _verifyUrl,
                          child: const Text(
                            'Verificar',
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
                      const Text(
                        "Consejos de seguridad",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Consejo 1
                      _buildSecurityTip(
                        Icons.warning_amber,
                        "Desconfía de ofertas que parecen demasiado buenas para ser verdad.",
                      ),
                      const SizedBox(height: 16),

                      // Consejo 2
                      _buildSecurityTip(
                        Icons.warning_amber,
                        "Los bancos nunca te pedirán claves o información personal por correo.",
                      ),
                      const SizedBox(height: 16),

                      // Consejo 3
                      _buildSecurityTip(
                        Icons.warning_amber,
                        "Verifica siempre la dirección web en la barra de navegación.",
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
        Icon(
          icon,
          color: const Color(0xFF3366FF), // Icono en color negro
          size: 28, // Tamaño del icono ajustado
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 28, // Tamaño de texto ajustado
              height: 1.4,
              color: Colors.black, // Texto en color negro
            ),
          ),
        ),
      ],
    );
  }
}
