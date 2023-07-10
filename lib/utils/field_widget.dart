import 'package:flutter/material.dart';

class WidgetField extends StatelessWidget {
  final String titre;
  final TextEditingController textEditingController;
  final bool enabled;
  final bool obscure;
  const WidgetField({
    super.key,
    required this.titre,
    required this.textEditingController,
    required this.enabled,
    required this.obscure,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            titre,
            style: const TextStyle(color: Colors.lightBlue),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextField(
            enabled: enabled,
            controller: textEditingController,
            obscureText: obscure,
          ),
        ),
      ],
    );
  }
}
