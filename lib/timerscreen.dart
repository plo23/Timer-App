/* 
Copyright (c) 2022, Payton Lo
All rights reserved.

This source code is licensed under the MIT-style license found in the
LICENSE file in the root directory of this source tree.
*/

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'breakscreen.dart';

class TimerScreen extends StatefulWidget {
  final int study;
  final int rest;
  
  const TimerScreen({required Key key, required this.study, required this.rest}) : super (key: key);
  
  @override
  State<TimerScreen> createState() => _TimerScreenState();
} 

class _TimerScreenState extends State<TimerScreen>{

  @override
  void initState(){
    //uncommented, this line (21) shows the error I ran into.
    //int minutes = widget.study;
    _startTimer(context);
    super.initState();
  }

  //This is the code written to hand the timer start.
  // Issues: you cannot set a class variable from a widget.value.
  //    You also cannot pass by reference in flutter.
  //    Thus, amending the code that is accessed in the build is very difficult.
  //    I circumvented the problem by using a timer plugin.
  //This is here to document the code and the attempt, but _startTimer has little to no
  // actual function in the current state (pun intended)
  Future _startTimer(BuildContext context) async{
    int time = widget.study * 60;
    int minutes = widget.study;
    double secPercent = (time/100);
    double percent = 0;
    Timer timer;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if(time > 0){
          time--;
          if(time % 60 == 0){
            minutes--;
          }
          if(time % secPercent == 0){
            if(percent < 1){
              percent += 0.01;
            }else{
              percent = 1;
            }
          }
        }else{
          percent = 0;
          minutes = 1;
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Study Time'),
    ),
    body: SafeArea(
    child: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green,Colors.deepOrange],
            begin: FractionalOffset(0.5,1),
          ),
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 18.0),
            ),
            Expanded(
              //this is the usage of the plugin expected for this program
              child: CircularCountDownTimer(
                duration: widget.study * 60, 
                fillColor: Colors.white, 
                height: 300.0, 
                ringColor: Colors.grey, 
                width: 300.0,
                isReverse: true,
                textStyle: const TextStyle(fontSize: 30.0, color: Colors.white),
                onComplete: () => {
                  //on complete, auto move to the break timer
                  Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => BreakScreen(study: widget.study, rest: widget.rest, key: UniqueKey(),),
                  ),
                  ),
                },
              ),
            ),
            const SizedBox(height: 30.0,),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30.0),topLeft: Radius.circular(30.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  const Text(
                                    "Study Time",
                                    style: TextStyle(
                                      fontSize: 30.0,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0,),
                                  Text(
                                    //for each timer, get the study time from the homescreen
                                    '${widget.study.toString()}:00',
                                    style: const TextStyle(
                                      fontSize: 40.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  const Text(
                                    "Break Time",
                                    style: TextStyle(
                                      fontSize: 30.0,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0,),
                                  Text(
                                    //for each timer, get the break time from the homescreen
                                    '${widget.rest.toString()}:00',
                                    style: const TextStyle(
                                      fontSize: 40.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        //cancel button
                        padding: const EdgeInsets.symmetric(vertical: 28.0),
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ),
  );
}
