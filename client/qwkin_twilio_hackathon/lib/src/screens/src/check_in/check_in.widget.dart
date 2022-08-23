import 'package:flutter/material.dart' hide Title;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:qwkin_twilio_hackathon/src/extensions/extensions.dart';
import 'package:qwkin_twilio_hackathon/src/widgets/src/pass_information_bottomsheet/pass_information_bottomsheet.widget.dart';
import 'package:qwkin_twilio_hackathon/src/widgets/src/pass_information_bottomsheet/pass_information_list_tile.widget.dart';
import 'package:qwkin_twilio_hackathon/src/widgets/widgets.dart';

import 'check_in.store.dart';

class CheckIn extends StatefulWidget {
  const CheckIn({Key? key}) : super(key: key);

  @override
  CheckInState createState() => CheckInState();
}

class CheckInState extends State<CheckIn> {
  final store = CheckInStore();

  @override
  void initState() {
    super.initState();
    store.fetchPasses();
  }

  @override
  Widget build(BuildContext context) =>
      SmartRefresher(

        controller: store.refreshController,
        onRefresh: store.onRefresh,
        child: SingleChildScrollView(
          child: Center(
            child: Observer(
              builder: (BuildContext context) {
                return Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Title('Sent Passes (${store.passes.length.toString()})').marginOnly(
                        bottom: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: store.isFetchingPasses
                            ? const CircularProgressIndicator()
                            : Column(
                          children: List.generate(store.passes.length, (index) {
                            return PassInformationListTile(
                              pass: store.passes[index],
                              onTap: () {
                                showModalBottomSheet<void>(
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  backgroundColor: const Color(0xFFEEEEEE),
                                  builder: (BuildContext context) {
                                    return PassInformationBottomSheet(
                                      pass: store.passes[index],
                                      isLoading: false,
                                      onCheckInPressed: () {
                                        _checkIn().then((success) {
                                          final checkInMessage = success
                                              ? 'Check-In Success'
                                              : 'Check-In Failed';
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                              content: Text(checkInMessage)));
                                        });
                                      },
                                    );
                                  },
                                );
                              },
                            );
                          }),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      );

  Future<bool> _checkIn() async {
    final success = await store.checkIn();
    return success;
  }
}
