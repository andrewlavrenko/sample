import 'package:flutter/material.dart';

import 'failures.dart';

class FailureFactory {
  FailureMessage getMessage(Failure failure) {
    return const FailureMessage(
      title: 'Неизвестная ошибка',
      subtitle: 'Что-то пошло не так, попробуйте еще раз.',
      button: 'Обновить',
      icon: Icons.error,
    );
  }
}

class FailureMessage {
  final String title;
  final String subtitle;
  final String button;
  final IconData icon;

  const FailureMessage({
    required this.title,
    required this.subtitle,
    required this.button,
    required this.icon,
  });
}
