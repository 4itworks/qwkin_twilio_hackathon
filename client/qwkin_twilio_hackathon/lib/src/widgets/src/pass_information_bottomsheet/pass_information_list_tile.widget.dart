import 'dart:ffi';

import 'package:flutter/material.dart' hide Title;
import 'package:qwkin_twilio_hackathon/src/widgets/widgets.dart';

class PassInformationListTile extends StatelessWidget {
  final String title;
  final String description;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;

  const PassInformationListTile({
    Key? key,
    required this.description,
    required this.title,
    this.borderRadius,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Title('João Carlos'),
                  Text('105 - São Gabriel'),
                ],
              ),
            ),
            Image.asset('assets/arrow.png')
          ],
        ),
      ),
    );
  }
}
