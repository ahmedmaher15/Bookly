import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String errorMessage) {
  final snackBar = SnackBar(
    backgroundColor: Colors.red,
    content: Row(
      children: [
        const Icon(Icons.error, color: Colors.white),
        const SizedBox(width: 16.0),
        Expanded(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
