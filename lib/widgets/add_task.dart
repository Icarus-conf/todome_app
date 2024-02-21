import 'package:flutter/material.dart';
import 'package:todome_app/components/text_format.dart';

// ignore: must_be_immutable
class AddTask extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final String text;
  final Function() onPressed;
  AddTask({
    super.key,
    required this.controller,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF757575),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PoppinsText(
              text: text,
              textAlign: TextAlign.center,
              fontS: 18,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              controller: controller,
            ),
            const SizedBox(
              height: 25,
            ),
            TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: const Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
