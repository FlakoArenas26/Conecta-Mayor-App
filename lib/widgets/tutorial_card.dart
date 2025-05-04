import 'package:flutter/material.dart';
import 'package:conecta_mayor/models/tutorial_model.dart';
import 'package:conecta_mayor/screens/learn/tutorial_steps_screen.dart';

class TutorialCard extends StatelessWidget {
  final Tutorial tutorial;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;

  const TutorialCard({
    super.key,
    required this.tutorial,
    required this.borderColor,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: () => _navigateToTutorial(context),
        borderRadius: BorderRadius.circular(12),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [_buildColoredBorder(), _buildContent()],
          ),
        ),
      ),
    );
  }

  Widget _buildColoredBorder() {
    return Container(
      width: 4,
      decoration: BoxDecoration(
        color: borderColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          bottomLeft: Radius.circular(12),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tutorial.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3366FF),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              tutorial.description,
              style: const TextStyle(fontSize: 22, color: Colors.black),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLevelBadge(),
                if (tutorial.isCompleted) _buildCompletedIcon(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLevelBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        tutorial.level,
        style: TextStyle(
          fontSize: 20,
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildCompletedIcon() {
    return const Icon(Icons.check_circle, color: Colors.green);
  }

  void _navigateToTutorial(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TutorialStepsScreen(tutorial: tutorial),
      ),
    );
  }
}
