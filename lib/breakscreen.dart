/* 
Copyright (c) 2022, Payton Lo
All rights reserved.

This source code is licensed under the MIT-style license found in the
LICENSE file in the root directory of this source tree.
*/

import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';


class BreakScreen extends StatefulWidget {
  final int study;
  final int rest;
  
  const BreakScreen({required Key key, required this.study, required this.rest}) : super (key: key);
  
  @override
  State<BreakScreen> createState() => _TimerBreakState();
} 

class _TimerBreakState extends State<BreakScreen>{

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Rest Time'),
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
                  duration: widget.rest * 60, 
                  fillColor: Colors.white, 
                  height: 300.0, 
                  ringColor: Colors.grey, 
                  width: 300.0,
                  isReverse: true,
                  textStyle: const TextStyle(fontSize: 30.0, color: Colors.white),
                  //on complete, auto pop back context until the original homescreen is reached
                  onComplete: () => Navigator.of(context).popUntil((route) => route.isFirst),
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
                            onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
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
