import 'package:flutter/material.dart';
import 'package:conecta_mayor/models/tutorial_model.dart';
import 'package:conecta_mayor/screens/home/home_screen.dart';
import 'package:conecta_mayor/screens/learn/learn_screen.dart';

class TutorialStepsScreen extends StatefulWidget {
  final Tutorial tutorial;

  const TutorialStepsScreen({super.key, required this.tutorial});

  @override
  State<TutorialStepsScreen> createState() => _TutorialStepsScreenState();
}

class _TutorialStepsScreenState extends State<TutorialStepsScreen> {
  int _currentStepIndex = 0;

  void _nextStep() {
    if (_currentStepIndex < widget.tutorial.steps.length - 1) {
      setState(() {
        _currentStepIndex++;
      });
    } else {
      // Marcar el tutorial como completado
      widget.tutorial.isCompleted = true;
      _showCompletionDialog(context);
    }
  }

  void _previousStep() {
    if (_currentStepIndex > 0) {
      setState(() {
        _currentStepIndex--;
      });
    }
  }

  void _showCompletionDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            title: const Text(
              '¡Felicidades!',
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check_circle, color: Colors.green, size: 200),
                const SizedBox(height: 24),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Has completado el tutorial ',
                        style: TextStyle(fontSize: 30, color: Colors.black),
                      ),
                      TextSpan(
                        text: '"${widget.tutorial.title}"',
                        style: const TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3366FF),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: const Text(
                      'Volver al Inicio',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentStep = widget.tutorial.steps[_currentStepIndex];
    final isFirstStep = _currentStepIndex == 0;
    final isLastStep = _currentStepIndex == widget.tutorial.steps.length - 1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3366FF),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 31),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.tutorial.title,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.home, size: 32),
            onPressed:
                () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (route) => false,
                ),
            tooltip: 'Inicio',
          ),
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Encabezado con número de paso y ayuda
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Paso ${_currentStepIndex + 1} de ${widget.tutorial.steps.length}',
                        style: const TextStyle(
                          fontSize: 28,
                          color: Colors.black54,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.help_outline, size: 28),
                        onPressed: () => _showHelpDialog(context),
                        tooltip: 'Ayuda',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Barra de progreso lineal
                  LinearProgressIndicator(
                    value:
                        (_currentStepIndex + 1) / widget.tutorial.steps.length,
                    backgroundColor: Colors.grey[300],
                    color: const Color(0xFF3366FF),
                    minHeight: 18,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  const SizedBox(height: 8),
                  // Texto de porcentaje
                  Text(
                    '${((_currentStepIndex + 1) / widget.tutorial.steps.length * 100).toStringAsFixed(0)}% completado',
                    style: const TextStyle(fontSize: 24, color: Colors.black54),
                  ),
                  const SizedBox(height: 16),

                  // Título del paso actual
                  Text(
                    currentStep.title,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3366FF),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Contenido del paso
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      currentStep.content,
                      style: const TextStyle(
                        fontSize: 28,
                        height: 1.4,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Barra inferior fija con botones
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey[300]!)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Botón Anterior (siempre visible)
                ElevatedButton(
                  onPressed: isFirstStep ? null : _previousStep,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isFirstStep
                            ? Colors.grey[300]
                            : const Color(
                              0xFF3366FF,
                            ), // Azul cuando está activo
                    foregroundColor:
                        isFirstStep
                            ? Colors.grey[500]
                            : Colors.white, // Texto blanco cuando está activo
                    minimumSize: const Size(150, 50),
                    side: isFirstStep ? null : null, // Sin borde
                  ),
                  child: const Text(
                    'Anterior',
                    style: TextStyle(
                      fontSize: 22, // Tamaño 22px
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Botón Siguiente/Completar
                ElevatedButton(
                  onPressed: _nextStep,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isLastStep
                            ? const Color(0xFF4CAF50)
                            : const Color(
                              0xFF3366FF,
                            ), // Verde cuando es último paso, azul en otros casos
                    foregroundColor: Colors.white,
                    minimumSize: const Size(150, 50),
                  ),
                  child: Text(
                    isLastStep ? 'Completar' : 'Siguiente',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold, // Texto en negrita para ambos casos
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void _showHelpDialog(BuildContext context) {
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: const Text(
            'Ayuda',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Sigue las instrucciones paso a paso.\n'
            'Usa los botones "Anterior" y "Siguiente" para navegar.',
            style: const TextStyle(color: Colors.black, fontSize: 22),
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3366FF),
                foregroundColor: Colors.white,
                minimumSize: const Size(120, 50),
              ),
              child: const Text(
                'Entendido',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
  );
}
