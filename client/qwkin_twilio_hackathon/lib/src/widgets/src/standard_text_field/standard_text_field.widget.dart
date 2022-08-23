import 'package:flutter/material.dart';

class StandardTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? labelText;
  final Widget? prefixIcon;

  const StandardTextField({
    Key? key,
    this.labelText,
    this.textEditingController,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey, width: 0.0),
          ),
          labelText: labelText,
          prefix: prefixIcon,
          suffixIcon: IconButton(
            icon: const Icon(Icons.close),
            onPressed: textEditingController?.clear,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
