import 'package:flutter/material.dart';
import 'package:qwkin_twilio_hackathon/src/extensions/extensions.dart';
import 'package:qwkin_twilio_hackathon/src/models/models.dart';
import 'package:qwkin_twilio_hackathon/src/widgets/src/customer_information_bottomsheet/customer_information_list_tile.widget.dart';

import '../../widgets.dart';

class PassInformationBottomSheet extends StatelessWidget {
  final VoidCallback? onCheckInPressed;
  final bool isLoading;
  final Pass pass;

  const PassInformationBottomSheet({
    Key? key,
    this.onCheckInPressed,
    this.isLoading = false,
    required this.pass,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 60,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25),
              ),
            ),
            child: const Text(
              'Pass Information',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ).marginOnly(bottom: 15),
          Expanded(
            child: ListView(
              children: [
                CustomerInformationListTile(
                  title: 'Guest Name',
                  description: pass.guestName!,
                ).marginSymmetric(vertical: 1),
                CustomerInformationListTile(
                  title: 'Phone Number',
                  description: pass.phoneNumber!,
                ).marginSymmetric(vertical: 1),
                CustomerInformationListTile(
                  title: 'Unit',
                  description: pass.unitNumber!,
                ).marginSymmetric(vertical: 1),
                CustomerInformationListTile(
                  title: 'Condominium',
                  description: pass.condoName!,
                ).marginOnly(bottom: 15),
                DefaultCard(
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : DefaultButton(
                          title: 'CHECK-IN',
                          onTap: onCheckInPressed,
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
