import 'package:flutter/material.dart';

class EditText extends StatefulWidget {
  String errorMsg = '';
  String hintText = '';
  bool obsecureText = false;
  Function(String value, Function(String errorMsg) setErrorCallback) onChange;
  EditText(
      {super.key,
      String? errorMsg,
      String? hintText,
      this.obsecureText = false,
      required this.onChange}) {
    this.errorMsg = errorMsg ?? '';
    this.hintText = hintText ?? '';
  }

  @override
  State<EditText> createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextField(
          obscureText: widget.obsecureText,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: widget.hintText,
          ),
          onChanged: (value) {
            setState(() {
              widget.errorMsg = '';
            });
            widget.onChange(value, (errorMsg) {
              setState(() {
                widget.errorMsg = errorMsg;
              });
            });
          },
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          widget.errorMsg,
          style: TextStyle(color: Colors.red.shade500),
        ),
      ],
    );
  }
}
