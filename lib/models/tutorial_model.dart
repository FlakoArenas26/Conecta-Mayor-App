class Tutorial {
  final String id;
  final String title;
  final String description;
  final List<TutorialStep> steps;
  final String level;
  bool isCompleted;

  Tutorial({
    required this.id,
    required this.title,
    required this.description,
    required this.steps,
    required this.level,
    this.isCompleted = false,
  });
}

class TutorialStep {
  final String title;
  final String content; // Esta es la propiedad correcta (no 'description')
  final String iconName;
  final bool hasCheckboxes;
  final int stepNumber;

  TutorialStep({
    required this.title,
    required this.content, // Usar 'content' en lugar de 'description'
    required this.iconName,
    this.hasCheckboxes = false,
    required this.stepNumber,
  });
}
