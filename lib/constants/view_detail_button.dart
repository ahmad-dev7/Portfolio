import 'package:aali_portfolio/constants/my_text.dart';
import 'package:flutter/material.dart';

class ViewDetailButton extends StatelessWidget {
  final VoidCallback onTap;
  const ViewDetailButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 10,
        backgroundColor: const Color(0xFF7E64C4),
        padding: const EdgeInsets.symmetric(horizontal: 14),
      ),
      child: MyText(key: UniqueKey(), "View Details", color: Colors.white, fontFamily: 'Lato'),
    );
  }
}
