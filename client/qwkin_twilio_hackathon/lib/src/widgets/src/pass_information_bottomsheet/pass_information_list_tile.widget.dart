import 'package:flutter/material.dart' hide Title;
import 'package:qwkin_twilio_hackathon/src/models/models.dart';
import 'package:qwkin_twilio_hackathon/src/widgets/widgets.dart';

class PassInformationListTile extends StatelessWidget {
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final Pass pass;

  const PassInformationListTile({
    Key? key,
    required this.pass,
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
                  Title(pass.guestName!),
                  Text('${pass.unitNumber} ${pass.condoName}'),
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
