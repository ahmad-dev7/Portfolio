import 'package:aali_portfolio/constants/my_text.dart';
import 'package:flutter/material.dart';

class InfoChip extends StatelessWidget {
  final String label;
  final IconData icon;
  const InfoChip({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        const SizedBox(width: 5),
        CircleAvatar(
          backgroundColor: Colors.deepPurpleAccent.withOpacity(.15),
          radius: 15,
          child: Icon(icon, color: Theme.of(context).colorScheme.onBackground),
        ),
        const SizedBox(width: 10),
        Padding(
          padding: const EdgeInsets.only(top: 3.5),
          child: MyText(label, fontFamily: "Poppins", size: 16),
        )
      ],
    );
  }
}
