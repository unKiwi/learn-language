// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learn_language/data.dart';
import 'package:learn_language/util.dart';

import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Widget _question;
  late Widget _response;
  late Widget _trueResponse;
  Widget _note = Container();
  late Widget _keyboard;

  late TextEditingController textEdit;
  bool shiftEnabled = false;
  bool showKeyboard = false;
  bool trueResponseIsShow = false;

  void update() {
    // define _question
    if (Data.modeView == "readEn_writeRu" || Data.modeView == "readEn_speakRu") {
      _question = Text(Data.getCurrentWord()["en"]);
    }
    else if (Data.modeView == "readRu_writeEn") {
      _question = Text(Data.getCurrentWord()["lang"]);
    }
    else if (Data.modeView == "hearRu_writeEn") {
      _question = IconButton(
        icon: const Icon(Icons.volume_up),
        tooltip: 'Hear',
        onPressed: () {
          playSound(Data.getCurrentWord()["audio"] + ".mp3");
        },
      );
    }

    // define _response
    if (Data.modeView == "readEn_speakRu") {
      _response = const Center(
        child: Text("In voice"),
      );
    }
    else if (trueResponseIsShow) {
      _response = Center(
        child: Text(textEdit.text),
      );
    }
    else {
      _response = Row(
        children: [
          AspectRatio(
            aspectRatio: 7 / 5,
            child: Center(
              child: Focus(
                child: TextField(
                  controller: textEdit,
                  onSubmitted: (String value) async {
                    await showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Thanks!'),
                          content: Text(
                              'You typed "$value", which has length ${value.characters.length}.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                onFocusChange: (hasFocus) {
                  setState(() {
                    showKeyboard = true;
                    update();
                  });
                },
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 2 / 5,
            child: IconButton(
              onPressed: () {
                setState(() {
                  showKeyboard = false;
                  trueResponseIsShow = true;
                  update();
                });
              },
              icon: const Icon(Icons.check),
            ),
          ),
        ],
      );
    }

    // define _trueResponse
    if (trueResponseIsShow) {
      List<Widget> children = [];

      if (Data.modeView != "hearRu_writeEn") {
        children.add(Expanded(
          child: Center(
            child: IconButton(
              color: Colors.blue,
              icon: const Icon(Icons.volume_up),
              tooltip: 'Hear',
              onPressed: () {
                playSound(Data.getCurrentWord()["audio"] + ".mp3");
              },
            ),
          ),
        ));
      }
      children.add(Expanded(
        child: Center(
          child: Text(Data.getCurrentWord()["phonetique"], style: const TextStyle(color: Colors.blue)),
        ),
      ));
      if (Data.modeView != "readRu_writeEn") {
        children.add(Expanded(
          child: Center(
            child: Text(Data.getCurrentWord()["lang"], style: const TextStyle(color: Colors.red),),
          ),
        ));
      }
      if (Data.modeView != "readEn_writeRu" && Data.modeView != "readEn_speakRu") {
        children.add(Expanded(
          child: Center(
            child: Text(Data.getCurrentWord()["en"]),
          ),
        ));
      }

      _trueResponse = Column(
        children: children,
      );
    }
    else {
      _trueResponse = Container();
    }

    // define _note
    if (trueResponseIsShow) {
      _note = Row(
        children: [
          Expanded(
            child: IconButton(
              color: Colors.red,
              icon: const Icon(Icons.close),
              tooltip: 'False',
              onPressed: () {
                setState(() {
                  Data.endQuestion(-1);
                  trueResponseIsShow = false;
                  textEdit.text = "";
                  update();
                });
              },
            ),
          ),
          Expanded(
            child: IconButton(
              color: Colors.green,
              icon: const Icon(Icons.check),
              tooltip: 'True',
              onPressed: () {
                setState(() {
                  Data.endQuestion(1);
                  trueResponseIsShow = false;
                  textEdit.text = "";
                  update();
                });
              },
            ),
          ),
        ],
      );
    }
    else {
      _note = Container();
    }

    // define _keyboard
    if (showKeyboard) {
      _keyboard = SafeArea(
        child: Container(
          // Keyboard is transparent
          color: Colors.deepPurple,
          child: VirtualKeyboard(
            // Default height is 300
            height: 350,
            // Default height is will screen width
            width: 600,
            // Default is black
            textColor: Colors.white,
            // Default 14
            fontSize: 20,
            // the layouts supported
            defaultLayouts: const [
              VirtualKeyboardDefaultLayouts.Arabic,
              VirtualKeyboardDefaultLayouts.English
            ],
            // [A-Z, 0-9]
            type: VirtualKeyboardType.Alphanumeric,
            // Callback for key press event
            onKeyPress: (VirtualKeyboardKey key) {
              if (key.keyType == VirtualKeyboardKeyType.String) {
                textEdit.text = textEdit.text +
                    (shiftEnabled ? key.capsText : key.text);
              } else if (key.keyType == VirtualKeyboardKeyType.Action) {
                switch (key.action) {
                  case VirtualKeyboardKeyAction.Backspace:
                    if (textEdit.text.isEmpty) return;
                    textEdit.text = textEdit.text
                        .substring(0, textEdit.text.length - 1);
                    break;
                  case VirtualKeyboardKeyAction.Return:
                    textEdit.text = textEdit.text + '\n';
                    break;
                  case VirtualKeyboardKeyAction.Space:
                    textEdit.text = textEdit.text + key.text;
                    break;
                  case VirtualKeyboardKeyAction.Shift:
                    shiftEnabled = !shiftEnabled;
                    break;
                  default:
                }
              }
            },
          ),
        ),
      );
    }
    else {
      _keyboard = Container();
    }
  }

  @override
  void initState() {
    super.initState();
    textEdit = TextEditingController();

    update();
  }

  @override
  void dispose() {
    textEdit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/image/bg.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 4,
                sigmaY: 4,
              ),
              child: Container(
                color: Colors.black.withOpacity(0),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: AspectRatio(
                aspectRatio: 9 / 21,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 9 / 1,
                        child: Center(
                          child: Text("You are level: ${Data.level}"),
                        ),
                      ),
                      AspectRatio(
                        aspectRatio: 9 / 5,
                        child: Center(
                          child: _question,
                        ),
                      ),
                      AspectRatio(
                        aspectRatio: 9 / 5,
                        child: _response,
                      ),
                      AspectRatio(
                        aspectRatio: 9 / 5,
                        child: _trueResponse,
                      ),
                      AspectRatio(
                        aspectRatio: 9 / 5,
                        child: _note,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            left: 0,
            child: _keyboard,
          ),
        ],
      ),
    );
  }
}