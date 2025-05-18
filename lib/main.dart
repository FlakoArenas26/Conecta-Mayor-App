import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:conecta_mayor/screens/home/home_screen.dart';

void main() {
  // Configuración inicial para orientación y escalado de texto
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Bloquear orientación a vertical
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // 2. Deshabilitar escalado de texto del sistema
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conecta Mayor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2D68F4),
          primary: const Color(0xFF2D68F4),
        ),
        fontFamily: 'Century Gothic',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.normal,
            color: Colors.white,
            height: 1.5,
          ),
          titleLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1C419B),
          ),
        ).apply(bodyColor: Colors.white, displayColor: Colors.white),
      ),
      // 3. Forzar tamaño de texto constante
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);
        return MediaQuery(
          data: mediaQueryData.copyWith(
            textScaleFactor: 1.0, // Fija el escalado a 1.0
            boldText: false, // Desactiva texto en negrita forzado
            disableAnimations:
                true, // Opcional: desactiva animaciones de accesibilidad
          ),
          child: child!,
        );
      },
      home: const HomeScreen(),
    );
  }
}
