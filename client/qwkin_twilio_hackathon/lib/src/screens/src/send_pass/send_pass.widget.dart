import 'package:flutter/material.dart' hide Title;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qwkin_twilio_hackathon/src/extensions/extensions.dart';
import 'package:qwkin_twilio_hackathon/src/screens/src/send_pass/send_pass.store.dart';
import 'package:qwkin_twilio_hackathon/src/widgets/src/customer_list_tile/customer_list_tile.widget.dart';
import 'package:qwkin_twilio_hackathon/src/widgets/src/filter/filter.dart';
import 'package:qwkin_twilio_hackathon/src/widgets/src/pass_information_bottomsheet/pass_information_bottomsheet.widget.dart';
import 'package:qwkin_twilio_hackathon/src/widgets/src/pass_information_bottomsheet/pass_information_list_tile.widget.dart';
import 'package:qwkin_twilio_hackathon/src/widgets/src/standard_text_field/standard_text_field.widget.dart';
import 'package:qwkin_twilio_hackathon/src/widgets/widgets.dart';

class SendPass extends StatefulWidget {
  const SendPass({Key? key}) : super(key: key);

  @override
  SendPassState createState() => SendPassState();
}

class SendPassState extends State<SendPass> {
  final store = SendPassStore();

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Center(
          child: Observer(
            builder: (BuildContext context) {
              return Column(
                children: [
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Title('Send Pass').marginOnly(bottom: 20),
                        Column(
                          children: [
                            StandardTextField(
                              labelText: 'Phone Number',
                              textEditingController: store.phoneController,
                            ).marginSymmetric(vertical: 5),
                            StandardTextField(
                              labelText: 'Guest Name',
                              textEditingController: store.guestController,
                            ).marginSymmetric(vertical: 5),
                            StandardTextField(
                              labelText: 'Unit Number',
                              textEditingController: store.unitController,
                            ).marginSymmetric(vertical: 5),
                            StandardTextField(
                              labelText: 'Condominium',
                              textEditingController:
                                  store.condominiumController,
                            ).marginSymmetric(vertical: 5),
                          ],
                        )
                      ],
                    ),
                  ).marginOnly(bottom: 15),
                  DefaultCard(
                    child: DefaultButton(
                      title: 'SEND PASS',
                      onTap: () {},
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
}
