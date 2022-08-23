import 'package:flutter/material.dart' hide Title;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:qwkin_twilio_hackathon/src/extensions/extensions.dart';
import 'package:qwkin_twilio_hackathon/src/screens/src/send_pass/send_pass.store.dart';
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
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Title('Send Pass').marginOnly(bottom: 20),
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
                    child: store.isSendingPass
                        ? const CircularProgressIndicator()
                        : DefaultButton(
                            title: 'SEND PASS',
                            onTap: () async {
                              late final String snackBarMessage;

                              final success = await store.sendPass();

                              snackBarMessage = success
                                  ? 'Pass sent successfully'
                                  : 'Pass not sent';

                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(snackBarMessage)));
                            },
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      );
}
