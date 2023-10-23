import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todome_app/widgets/colors.dart';

class TaskTile extends StatelessWidget {
  final bool? isChecked;
  final String? tastTitle;
  final Function(bool?) checkBoxCallBack;
  final void Function()? longPressedCallBack;

  const TaskTile(
      {super.key, this.isChecked,
      this.tastTitle,
      required this.checkBoxCallBack,
      required this.longPressedCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressedCallBack,
      title: Text(
        tastTitle!,
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            decoration: isChecked! ? TextDecoration.lineThrough : null,
            decorationColor: isChecked! ? primaryColor : null,
            letterSpacing: .5,
          ),
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        activeColor: primaryColor,
        onChanged: checkBoxCallBack,
      ),
    );
  }
}
