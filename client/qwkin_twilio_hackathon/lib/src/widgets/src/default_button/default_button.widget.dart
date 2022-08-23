import 'package:flutter/material.dart' hide Title;

import '../../widgets.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const DefaultButton({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
          color: Color(0xFF3F50B5),
        ),
        child: Title(
          title,
          color: Colors.white,
        ),
      ),
    );
  }
}
