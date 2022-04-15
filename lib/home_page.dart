import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/clock_data.dart';
import 'package:provider_example/theme.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      var timerData = Provider.of<TimerData>(context, listen: false);
      timerData.updateremaningTime();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(flex: 2, child: clockUI()),
            Expanded(
              flex: 1,
              child: Consumer<TimerData>(
                builder: (BuildContext context, value, Widget? child) {
                  print('=========reset btn==========');
                  return IconButton(
                    splashColor: MyColors.accent,
                    iconSize: 50,
                    onPressed: () {
                      value.resetClock();
                    },
                    icon: Icon(
                      Icons.refresh,
                      color: MyColors.primaryDark,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget clockUI() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Consumer<TimerData>(
              builder: (BuildContext context, data, Widget? child) {
                return CircularProgressIndicator(
                  color: MyColors.accent,
                  value: data.getremaningTime / 60,
                  strokeWidth: 40,
                );
              },
            ),
          ),
          Image.asset(
            'assets/images/watchIcon.png',
            width: 300,
          ),
          Consumer<TimerData>(
            builder: (BuildContext context, data, Widget? child) {
              return Text(
                '${data.getremaningTime}',
                style: GoogleFonts.orbitron(
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                  fontSize: 60.0,
                  color: MyColors.white,
                ),
                textAlign: TextAlign.center,
              );
            },
          ),
        ],
      ),
    );
  }
}
