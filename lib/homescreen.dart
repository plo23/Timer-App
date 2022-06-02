/* 
Copyright (c) 2022, Payton Lo
All rights reserved.

This source code is licensed under the MIT-style license found in the
LICENSE file in the root directory of this source tree.
*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'timerscreen.dart';

class StudyApp extends StatefulWidget {
  const StudyApp({Key? key}) : super(key: key);

  @override
  State<StudyApp> createState() => _StudyAppState();
}

class _StudyAppState extends State<StudyApp> {
  final _biggerFont = const TextStyle(fontSize: 18);
  //create some default timer lists
  final studyTime  = <int>[1,5,7,9,23];
  final breakTime = <int>[1,1,1,1,3];

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  void addItem(){
    setState(() {
      //add the input times to the list
      studyTime.add(int.parse(myController1.text));
      breakTime.add(int.parse(myController2.text));
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController1.dispose();
    myController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => showDialog(
              context: context, 
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Add timer'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  //position
                  mainAxisSize: MainAxisSize.min,
                  // wrap content in flutter
                  children: <Widget>[
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Number of minutes to study',
                      ),
                      //restrict the input to numbers
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                      ],
                      //handle the output
                      controller: myController1,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Number of minutes per break',
                      ),
                      //similarly limit the input to numbers, must be done slightly
                      //different as it is a textformfield rather than a textfield
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      controller: myController2,
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    //on cancel go back
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    //on submit add item and remove the alert
                    onPressed: () => {
                      addItem(),
                      Navigator.pop(context, 'Submit'),
                      },
                    child: const Text('OK'),
                  ),
                ],
              ),
            ),  
            tooltip: 'Add Item',
            )
          ),
          
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: studyTime.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(
              //add times from lists of ints
              studyTime[i].toString() + ' minutes study, ' + breakTime[i].toString() + ' minutes break',
              style: _biggerFont,
            ),
            trailing: TextButton(
                    onPressed: () => {
                      Navigator.of(context).push(
                        //on start, move to timerscreen passing relevant info
                        MaterialPageRoute<void>(
                          builder: (context) => TimerScreen(study: studyTime[i], rest: breakTime[i], key: UniqueKey(),),
                        ),
                      ),
                    },
                    child: const Text('Start'),
            ),
            onTap: () {}
          );
          //seperate each item
        }, separatorBuilder: (BuildContext context, int index) { return const Divider(); },
      ),
    );
  }
}
