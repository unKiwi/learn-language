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
              return CheckboxListTile(
                title: Text(Data.lsLesson[index]),
                controlAffinity: ListTileControlAffinity.leading,
                checkColor: Colors.white,
                value: false,
                onChanged: (bool? value) {
                  setState(() {
                    
                  });
                },
              );
            }),
          );
        }
      ),
    ),
  );
}