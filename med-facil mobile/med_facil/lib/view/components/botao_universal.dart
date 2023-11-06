// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class BotaoUniversal extends StatelessWidget {
  final String buttonText;
  void Function()? onTapButton;
  BotaoUniversal({
    super.key,
    required this.buttonText,
    required this.onTapButton,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTapButton,
        child: Container(
            width: 344,
            height: 44,
            decoration: ShapeDecoration(
              color: Color(0xFF304D63),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: Center(
                child: Text(buttonText,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.center))));
  }
}
