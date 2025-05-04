import 'package:conecta_mayor/screens/home/home_screen.dart';
import 'package:conecta_mayor/widgets/tutorial_card.dart';
import 'package:flutter/material.dart';
import 'package:conecta_mayor/models/tutorial_model.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  int _selectedTab = 0;

  // Lista completa de tutoriales
  final List<Tutorial> _basicTutorials = [
    Tutorial(
      id: 'basic-1',
      title: 'Usar tu teléfono',
      description:
          'Aprende a encender, apagar y ajustar el volumen de tu dispositivo.',
      steps: [
        TutorialStep(
          title: 'Encender tu dispositivo',
          content:
              'Mantén presionado el botón de encendido ubicado en el lateral de tu teléfono durante 3 segundos hasta que veas el logo aparecer en pantalla.',
          iconName: 'smartphone',
          hasCheckboxes: true,
          stepNumber: 1,
        ),
        TutorialStep(
          title: 'Ajustar el volumen',
          content:
              'Utiliza los botones de volumen en el lateral de tu teléfono para subir o bajar el sonido. Presiona arriba para subir y abajo para bajar.',
          iconName: 'smartphone',
          stepNumber: 2,
        ),
        TutorialStep(
          title: 'Apagar tu dispositivo',
          content:
              'Mantén presionado el botón de encendido y, cuando aparezca el menú en pantalla, desliza donde dice "Apagar".',
          iconName: 'smartphone',
          hasCheckboxes: true,
          stepNumber: 3,
        ),
      ],
      level: 'Básico',
    ),
    Tutorial(
      id: 'basic-2',
      title: 'Hacer llamadas',
      description: 'Aprende a realizar y recibir llamadas telefónicas.',
      steps: [
        TutorialStep(
          title: 'Abrir la aplicación de teléfono',
          content:
              'Busca en tu pantalla principal el ícono de teléfono y púlsalo para abrir la aplicación.',
          iconName: 'smartphone',
          stepNumber: 1,
        ),
        TutorialStep(
          title: 'Marcar un número',
          content:
              'Utiliza el teclado numérico para introducir el número de teléfono que deseas llamar.',
          iconName: 'smartphone',
          stepNumber: 2,
        ),
        TutorialStep(
          title: 'Finalizar una llamada',
          content:
              'Para terminar la llamada, presiona el botón rojo con el ícono de teléfono.',
          iconName: 'smartphone',
          stepNumber: 3,
        ),
      ],
      level: 'Básico',
    ),
    Tutorial(
      id: 'basic-3',
      title: 'Enviar mensajes',
      description: 'Aprende a enviar y recibir mensajes de texto.',
      steps: [
        TutorialStep(
          title: 'Abrir la aplicación de mensajes',
          content:
              'Busca en tu pantalla principal el ícono de mensajes y púlsalo para abrir la aplicación.',
          iconName: 'mail',
          stepNumber: 1,
        ),
        TutorialStep(
          title: 'Crear un nuevo mensaje',
          content:
              'Pulsa el botón con el símbolo "+" o "Nuevo mensaje" para comenzar a escribir un mensaje.',
          iconName: 'mail',
          stepNumber: 2,
        ),
        TutorialStep(
          title: 'Enviar el mensaje',
          content:
              'Cuando hayas terminado de escribir, pulsa el botón de enviar (generalmente una flecha o avión de papel).',
          iconName: 'mail',
          stepNumber: 3,
        ),
      ],
      level: 'Básico',
    ),
  ];

  final List<Tutorial> _intermediateTutorials = [
    Tutorial(
      id: 'inter-1',
      title: 'Usar el correo electrónico',
      description: 'Cómo enviar, recibir y organizar tus correos electrónicos.',
      steps: [
        TutorialStep(
          title: 'Configurar tu cuenta',
          content:
              'Abre la aplicación de correo y sigue las instrucciones para añadir tu cuenta de correo electrónico.',
          iconName: 'mail',
          stepNumber: 1,
        ),
        TutorialStep(
          title: 'Revisar bandeja de entrada',
          content:
              'Pulsa en "Bandeja de entrada" para ver todos los correos electrónicos recibidos.',
          iconName: 'mail',
          stepNumber: 2,
        ),
        TutorialStep(
          title: 'Escribir un nuevo correo',
          content:
              'Pulsa el botón de "Nuevo correo" o "+" para comenzar a escribir un correo electrónico nuevo.',
          iconName: 'mail',
          stepNumber: 3,
        ),
      ],
      level: 'Intermedio',
    ),
    Tutorial(
      id: 'inter-2',
      title: 'Navegar por internet',
      description: 'Aprende a buscar información en internet de forma segura.',
      steps: [
        TutorialStep(
          title: 'Abrir el navegador',
          content:
              'Busca en tu pantalla principal el ícono del navegador (Chrome, Safari) y púlsalo para abrir.',
          iconName: 'globe',
          stepNumber: 1,
        ),
        TutorialStep(
          title: 'Buscar información',
          content:
              'Toca la barra de búsqueda en la parte superior y escribe lo que quieres buscar.',
          iconName: 'globe',
          stepNumber: 2,
        ),
        TutorialStep(
          title: 'Navegar entre páginas',
          content:
              'Utiliza los botones de atrás y adelante para moverte entre las páginas que has visitado.',
          iconName: 'globe',
          stepNumber: 3,
        ),
      ],
      level: 'Intermedio',
    ),
    Tutorial(
      id: 'inter-3',
      title: 'Instalar aplicaciones',
      description: 'Cómo encontrar y descargar aplicaciones útiles.',
      steps: [
        TutorialStep(
          title: 'Abrir la tienda de aplicaciones',
          content:
              'Busca en tu pantalla principal el ícono de la tienda de aplicaciones (Play Store o App Store).',
          iconName: 'settings',
          stepNumber: 1,
        ),
        TutorialStep(
          title: 'Buscar una aplicación',
          content:
              'Utiliza la barra de búsqueda para encontrar la aplicación que deseas instalar.',
          iconName: 'settings',
          stepNumber: 2,
        ),
        TutorialStep(
          title: 'Descargar e instalar',
          content:
              'Pulsa el botón "Instalar" o "Obtener" y espera a que la aplicación se descargue e instale.',
          iconName: 'settings',
          stepNumber: 3,
        ),
      ],
      level: 'Intermedio',
    ),
  ];

  final List<Tutorial> _advancedTutorials = [
    Tutorial(
      id: 'adv-1',
      title: 'Banca en línea',
      description:
          'Gestionar tus finanzas de forma segura desde tu dispositivo.',
      steps: [
        TutorialStep(
          title: 'Configurar la aplicación bancaria',
          content:
              'Descarga la aplicación de tu banco e inicia sesión con las credenciales proporcionadas por tu banco.',
          iconName: 'credit-card',
          stepNumber: 1,
        ),
        TutorialStep(
          title: 'Consultar saldos',
          content:
              'En la pantalla principal, podrás ver tus cuentas y el saldo disponible en cada una.',
          iconName: 'credit-card',
          stepNumber: 2,
        ),
        TutorialStep(
          title: 'Realizar transferencias',
          content:
              'Busca la opción de "Transferencias" y sigue las instrucciones para enviar dinero a otra cuenta.',
          iconName: 'credit-card',
          stepNumber: 3,
        ),
      ],
      level: 'Avanzado',
    ),
    Tutorial(
      id: 'adv-2',
      title: 'Trámites gubernamentales',
      description: 'Realizar gestiones oficiales en plataformas de gobierno.',
      steps: [
        TutorialStep(
          title: 'Acceder al portal',
          content:
              'Busca el sitio web oficial del gobierno o la aplicación correspondiente e inicia sesión.',
          iconName: 'book-open',
          stepNumber: 1,
        ),
        TutorialStep(
          title: 'Buscar el trámite',
          content:
              'Navega por las categorías o utiliza el buscador para encontrar el trámite que necesitas.',
          iconName: 'book-open',
          stepNumber: 2,
        ),
        TutorialStep(
          title: 'Completar formularios',
          content:
              'Sigue las instrucciones y completa todos los campos requeridos para realizar el trámite.',
          iconName: 'book-open',
          stepNumber: 3,
        ),
      ],
      level: 'Avanzado',
    ),
    Tutorial(
      id: 'adv-3',
      title: 'Compras en línea',
      description: 'Aprender a comprar productos de forma segura por internet.',
      steps: [
        TutorialStep(
          title: 'Elegir productos',
          content:
              'Navega por la tienda en línea y añade los productos que deseas comprar al carrito.',
          iconName: 'shopping-cart',
          stepNumber: 1,
        ),
        TutorialStep(
          title: 'Proceso de pago',
          content:
              'Revisa tu carrito, confirma los productos y procede al pago introduciendo tus datos.',
          iconName: 'shopping-cart',
          stepNumber: 2,
        ),
        TutorialStep(
          title: 'Seguimiento de pedido',
          content:
              'Una vez realizada la compra, podrás seguir el estado de tu pedido desde la sección "Mis pedidos".',
          iconName: 'shopping-cart',
          stepNumber: 3,
        ),
      ],
      level: 'Avanzado',
    ),
  ];

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
          'Aprender',
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
      body: Column(
        children: [
          const SizedBox(height: 16),
          const Text(
            'Tutoriales',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3366FF),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                _buildTabItem('Básicos', 0),
                _buildTabItem('Intermedios', 1),
                _buildTabItem('Avanzados', 2),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: IndexedStack(
              index: _selectedTab,
              children: [
                _TutorialList(tutorials: _basicTutorials),
                _TutorialList(tutorials: _intermediateTutorials),
                _TutorialList(tutorials: _advancedTutorials),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, int index) {
    final isSelected = _selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTab = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
            border: isSelected ? Border.all(color: Colors.white) : null,
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? const Color(0xFF3366FF) : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 23,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class _TutorialList extends StatelessWidget {
  final List<Tutorial> tutorials;

  const _TutorialList({required this.tutorials});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: tutorials.length,
      itemBuilder: (context, index) {
        final tutorial = tutorials[index];
        return TutorialCard(
          tutorial: tutorial,
          borderColor: _getBorderColor(tutorial.level),
          backgroundColor: _getBackgroundColor(tutorial.level),
          textColor: _getTextColor(tutorial.level),
        );
      },
    );
  }

  Color _getBorderColor(String level) {
    switch (level.toLowerCase()) {
      case 'básico':
        return const Color(0xFF25A244);
      case 'intermedio':
        return const Color(0xFF3366FF);
      case 'avanzado':
        return const Color(0xFFE53935);
      default:
        return Colors.grey;
    }
  }

  Color _getBackgroundColor(String level) {
    switch (level.toLowerCase()) {
      case 'básico':
        return const Color(0xFFE6F7EC);
      case 'intermedio':
        return const Color(0xFFE6EEF7);
      case 'avanzado':
        return const Color(0xFFF7E6E6);
      default:
        return Colors.grey.shade100;
    }
  }

  Color _getTextColor(String level) {
    switch (level.toLowerCase()) {
      case 'básico':
        return const Color(0xFF25A244);
      case 'intermedio':
        return const Color(0xFF3366FF);
      case 'avanzado':
        return const Color(0xFFE53935);
      default:
        return Colors.black;
    }
  }
}
