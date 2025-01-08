import 'package:aali_portfolio/constants/my_text.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class CollaborateIndicator extends StatelessWidget {
  const CollaborateIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: null,
      icon: AvatarGlow(
        glowColor: Colors.green,
        glowRadiusFactor: .5,
        child: const Icon(Icons.circle, color: Colors.green),
      ),
      label: MyText("Let's Collaborate", fontFamily: "Poppins", color: Theme.of(context).colorScheme.onBackground),
      style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8)),
    );
  }
}
