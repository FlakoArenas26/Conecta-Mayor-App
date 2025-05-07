import 'package:conecta_mayor/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String title;

  const ChatScreen({super.key, required this.title});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    // Enviar mensaje inicial automáticamente
    Future.delayed(Duration.zero, () {
      _addBotMessage(
        "¡Hola! Soy tu asistente digital.\n¿En qué puedo ayudarte hoy?",
      );
      _showOptions();
    });
  }

  void _addBotMessage(String text) {
    setState(() {
      _messages.add(
        ChatMessage(
          text: text,
          isUser: false,
          time: TimeOfDay.now().format(context),
        ),
      );
    });
  }

  void _addUserMessage(String text) {
    setState(() {
      _messages.add(
        ChatMessage(
          text: text,
          isUser: true,
          time: TimeOfDay.now().format(context),
        ),
      );
    });
  }

  void _showOptions() {
    final optionsMessage =
        "Por favor, selecciona una de estas consultas frecuentes:\n\n"
        "1. ¿Cómo puedo aumentar el tamaño del texto en la pantalla?\n"
        "2. ¿Cómo conecto mi teléfono al WiFi?\n"
        "3. ¿Cómo puedo hacer una videollamada?\n"
        "4. ¿Cómo protejo mis datos personales?\n"
        "5. Tengo otra consulta...";

    _addBotMessage(optionsMessage);
  }

  void _handleOptionSelected(String option) {
    _addUserMessage(option);

    // Respuestas según la opción seleccionada
    String response;
    switch (option) {
      case '1':
        response =
            "Para aumentar el tamaño del texto:\n1. Ve a Configuración\n2. Selecciona 'Accesibilidad'\n3. Elige 'Tamaño de texto'\n4. Ajusta el slider para cambiar el tamaño";
        break;
      case '2':
        response =
            "Para conectar tu teléfono al WiFi:\n1. Abre Configuración\n2. Selecciona 'Redes e Internet'\n3. Elige tu red WiFi\n4. Ingresa la contraseña si es necesario";
        break;
      case '3':
        response =
            "Para hacer una videollamada:\n1. Abre la aplicación de videollamadas\n2. Selecciona el contacto\n3. Toca el ícono de videollamada\n4. Espera a que respondan";
        break;
      case '4':
        response =
            "Para proteger tus datos:\n1. No compartas contraseñas\n2. Usa autenticación de dos factores\n3. Actualiza tu sistema regularmente\n4. Descarga apps solo de tiendas oficiales";
        break;
      case '5':
        response =
            "Por favor describe tu consulta y un asistente humano te responderá pronto.";
        break;
      default:
        response =
            "No reconozco el número seleccionado. Por favor intenta nuevamente con un número del 1 al 5.";
        break;
    }

    Future.delayed(const Duration(seconds: 1), () {
      _addBotMessage(response);
      if (option == '1' || option == '2' || option == '3' || option == '4') {
        Future.delayed(const Duration(seconds: 1), () {
          _showOptions();
        });
      }
    });
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    final message = _messageController.text;
    _messageController.clear();
    _handleOptionSelected(message);
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              reverse: false,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ChatBubble(
                  message: message.text,
                  isUser: message.isUser,
                  time: message.time,
                );
              },
            ),
          ),
          _buildInputField(),
        ],
      ),
    );
  }

  Widget _buildInputField() {
    return Container(
      padding: const EdgeInsets.all(12), // Aumentado el padding
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              style: const TextStyle(fontSize: 28), // Tamaño de texto aumentado
              decoration: InputDecoration(
                hintText: "Escribe el número de tu consulta...",
                hintStyle: const TextStyle(
                  fontSize: 22, // Tamaño del hint text aumentado
                  color: Colors.grey,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16, // Ajuste de padding interno
                  horizontal: 12,
                ),
              ),
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.send,
              color: Color(0xFF3366FF),
              size: 40, // Tamaño del icono aumentado
            ),
            onPressed: _sendMessage,
            padding: const EdgeInsets.all(12), // Padding del botón aumentado
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;
  final String time;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isUser,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment:
            isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isUser ? const Color(0xFF3366FF) : Colors.grey[200],
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(12),
                topRight: const Radius.circular(12),
                bottomLeft:
                    isUser
                        ? const Radius.circular(12)
                        : const Radius.circular(0),
                bottomRight:
                    isUser
                        ? const Radius.circular(0)
                        : const Radius.circular(12),
              ),
            ),
            child: Text(
              message,
              style: TextStyle(
                color: isUser ? Colors.white : Colors.black,
                fontSize: 28,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(time, style: const TextStyle(fontSize: 24, color: Colors.grey)),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUser;
  final String time;

  ChatMessage({required this.text, required this.isUser, required this.time});
}
