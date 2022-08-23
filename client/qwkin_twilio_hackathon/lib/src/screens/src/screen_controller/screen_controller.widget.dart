import 'package:flutter/material.dart';

import '../../screens.dart';

class ScreenController extends StatelessWidget {
  const ScreenController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: _tabs,
            ),
            backgroundColor: const Color(0xFFEEEEEE),
            title: Image.asset('assets/qwkin_logo.png'),
          ),
          body: TabBarView(
            children: body,
          ),
        ),
      ),
    );
  }

  List<Widget> get body => const [
        Home(),
        CheckIn(),
        SendPass(),
      ];

  List<Widget> get _tabs => const [
        Tab(
          child: Text(
            'Data',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        Tab(
          child: Text(
            'Check-In',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        Tab(
          child: Text(
            'Send Pass',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ];
}
