import 'package:conecta_mayor/screens/home/home_screen.dart';
import 'package:conecta_mayor/screens/security/password_secure_screen.dart';
import 'package:conecta_mayor/screens/security/verify_screen.dart';
import 'package:flutter/material.dart';

class SecurityScreen extends StatefulWidget {
  final String title;

  const SecurityScreen({super.key, required this.title});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  final List<Map<String, String>> securityAlerts = [
    {
      'title': 'Mensaje de banco falso',
      'time': 'Hoy',
      'description':
          'Están circulando mensajes falsos que se hacen pasar por bancos pidiendo datos personales. Nunca comparta sus claves o códigos.',
    },
    {
      'title': 'Estafa en redes sociales',
      'time': 'Hoy',
      'description':
          'Cuidado con ofertas demasiado buenas para ser verdad en redes sociales. Verifique siempre la autenticidad del vendedor.',
    },
    {
      'title': 'Aplicación maliciosa',
      'time': 'Ayer',
      'description':
          'Se ha detectado una aplicación que roba datos personales. No instale aplicaciones fuera de tiendas oficiales.',
    },
    {
      'title': 'Phishing por correo',
      'time': 'Ayer',
      'description':
          'Nuevo correo fraudulento que simula ser de servicios públicos. No haga clic en enlaces sospechosos.',
    },
    {
      'title': 'Robo de identidad',
      'time': '3 días atrás',
      'description':
          'Aumentan casos de suplantación de identidad. Proteja sus datos personales y verifique solicitudes inusuales.',
    },
    {
      'title': 'Actualización urgente',
      'time': '4 días atrás',
      'description':
          'Actualice su aplicación para protegerse contra nuevas vulnerabilidades descubiertas.',
    },
    {
      'title': 'Fraude telefónico',
      'time': '5 días atrás',
      'description':
          'Llamadas falsas de soporte técnico. Recuerde que nunca le pediremos información confidencial por teléfono.',
    },
    {
      'title': 'Wi-Fi público inseguro',
      'time': '1 semana atrás',
      'description':
          'Evite realizar transacciones bancarias cuando esté conectado a redes Wi-Fi públicas.',
    },
    {
      'title': 'Falsos sorteos',
      'time': '1 semana atrás',
      'description':
          'Alertas sobre falsos sorteos que piden datos bancarios. Los sorteos oficiales nunca solicitan información confidencial.',
    },
    {
      'title': 'Secuestro de cuentas',
      'time': '2 semanas atrás',
      'description':
          'Nueva modalidad de robo de cuentas mediante enlaces falsos. Active la autenticación en dos pasos.',
    },
    {
      'title': 'Tarjetas clonadas',
      'time': '2 semanas atrás',
      'description':
          'Aumentan casos de clonación de tarjetas en cajeros automáticos. Tape siempre el teclado al ingresar su PIN.',
    },
    {
      'title': 'Falsos empleos',
      'time': '3 semanas atrás',
      'description':
          'Ofertas de trabajo falsas que solicitan depósitos de dinero. Las empresas serias no piden dinero por adelantado.',
    },
    {
      'title': 'Extorsión telefónica',
      'time': '3 semanas atrás',
      'description':
          'Llamadas amenazantes que dicen ser de autoridades. Las autoridades reales nunca solicitan pagos por teléfono.',
    },
    {
      'title': 'Falsas inversiones',
      'time': '1 mes atrás',
      'description':
          'Esquemas de inversión con altos rendimientos son estafas. Desconfíe de promesas de ganancias exageradas.',
    },
    {
      'title': 'Suplantación de apps',
      'time': '1 mes atrás',
      'description':
          'Aplicaciones falsas que imitan bancos y servicios oficiales. Descargue solo desde tiendas oficiales.',
    },
  ];

  final ScrollController _scrollController = ScrollController();
  List<Widget> displayedAlerts = [];
  int currentAlertIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadAlertsSequentially();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadAlertsSequentially() {
    // Ordenamos las alertas de más reciente a más antigua
    final orderedAlerts = securityAlerts.reversed.toList();

    Future.doWhile(() {
      if (currentAlertIndex < orderedAlerts.length) {
        return Future.delayed(const Duration(milliseconds: 700), () {
          setState(() {
            // Insertamos al inicio para que las más recientes queden arriba
            displayedAlerts.insert(
              0,
              _buildAlertCard(orderedAlerts[currentAlertIndex]),
            );
            currentAlertIndex++;
          });

          // Desplazamiento automático suave hacia la primera alerta
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (_scrollController.hasClients && displayedAlerts.isNotEmpty) {
              _scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
              );
            }
          });

          return true;
        });
      }
      return false;
    });
  }

  Widget _buildAlertCard(Map<String, String> alert) {
    return AnimatedOpacity(
      opacity: 1,
      duration: const Duration(milliseconds: 500),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: Colors.red[700]!, width: 6)),
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        alert['title']!,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      alert['time']!,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  alert['description']!,
                  style: const TextStyle(fontSize: 26, color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
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
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
        child: Column(
          children: [
            // Primera tarjeta con características
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
                    // Título con icono
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.security,
                          size: 40,
                          color: Color(0xFF3366FF),
                        ),
                        const SizedBox(width: 15),
                        Text(
                          'Tu protección digital',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF3366FF),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Card de Verificar enlaces
                    _buildFeatureCard(
                      icon: Icons.warning_amber,
                      title: 'Verificar Enlaces',
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => const VerifyScreen(
                                    title: 'Verificar Enlaces',
                                  ),
                            ),
                          ),
                    ),
                    const SizedBox(height: 15),

                    // Card de Contraseñas Seguras
                    _buildFeatureCard(
                      icon: Icons.lock,
                      title: 'Contraseñas Seguras',
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => const PasswordSecureScreen(
                                    title: 'Contraseñas Seguras',
                                  ),
                            ),
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Tarjeta de alertas de seguridad
            Expanded(
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Título con icono
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.notifications,
                            size: 40,
                            color: Color(0xFF3366FF),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            'Alertas de Seguridad',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF3366FF),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Lista de alertas
                      Expanded(
                        child:
                            displayedAlerts.isEmpty
                                ? const Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CircularProgressIndicator(
                                        color: Color(0xFF3366FF),
                                      ),
                                      SizedBox(height: 16),
                                      Text(
                                        'Cargando alertas...',
                                        style: TextStyle(
                                          color: Color(0xFF3366FF),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                : SingleChildScrollView(
                                  controller: _scrollController,
                                  child: Column(children: displayedAlerts),
                                ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 40, color: const Color(0xFF3366FF)),
              const SizedBox(width: 15),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
