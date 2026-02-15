import 'package:flutter/material.dart';
import 'package:price_app/utils/extention.dart';

class WelcomeUser extends StatelessWidget {
  const WelcomeUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'WELCOME BACK',
          style: context.textTheme.labelSmall?.copyWith(
            color: context.colors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Kofi Mensah',
          style: context.textTheme.headlineMedium?.copyWith(
            color: context.colors.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
