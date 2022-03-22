import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_language/data.dart';

void showSetings(context) {
  showCupertinoModalPopup(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        bool noCheck = true;
        Data.lsLesson.forEach((key, value) { //////////////////////////////////////////// preffer for
          if (value["selected"] == true) {
            noCheck = false;
            // break;
          }
        });

        return WillPopScope(
          onWillPop: () async {
            return Future.value(false);
          },
          child: AlertDialog(
            title: Text("Choose your lessons"),
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: 0,
              child: ListView(
                shrinkWrap: true,
                // mainAxisSize: MainAxisSize.min,
                children: List.generate(Data.lsLesson.length, (index) {
                  String lesson = Data.lsLesson.keys.toList()[index];
                  return CheckboxListTile(
                    title: Text(lesson),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: Data.lsLesson[lesson]!["selected"] == true,
                    onChanged: (bool? value) {
                      setState(() {
                        Data.lsLesson[lesson]!["selected"] = value!;
                      });
                    },
                  );
                }),
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: noCheck ? null : () {
                  Data.fillLsAsso();
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      },
    ),
  );
}