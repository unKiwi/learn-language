import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_language/data.dart';

void showSetings(context) {
  showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text("Choose your lessons"),
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
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
          );
        }
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Data.fillLsAsso();
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
    ),
  );
}