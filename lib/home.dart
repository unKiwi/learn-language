import 'package:flutter/material.dart';
import 'package:learn_language/data.dart';
import 'package:learn_language/settings.dart';
import 'package:learn_language/util.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Widget _response;
  late Widget _showBtn;

  late Widget _soundBtn;
  late Widget _iconSoundBtn;
  late Widget _textSoundBtn;

  @override
  void initState() {
    super.initState();

    _showBtn = ElevatedButton(
      onPressed: () {
        setState(() {
          _response = Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(Data.lsAsso[Data.index][3], textScaleFactor: 2, textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              Text(Data.lsAsso[Data.index][1], textScaleFactor: 2, textAlign: TextAlign.center, style: TextStyle(color: Colors.red),),
            ],
          );
        });
      },
      child: Text('Show'),
    );

    _response = _showBtn;

    _textSoundBtn = TextButton(
      onPressed: () {
        playSound("${Data.lsAsso[Data.index][0]}.mp3");
      },
      child: Text(Data.lsAsso[Data.index][2], textScaleFactor: 2, textAlign: TextAlign.center, style: TextStyle(color: Colors.blue),),
    );
    _iconSoundBtn = IconButton(
      onPressed: () {
        playSound("${Data.lsAsso[Data.index][0]}.mp3");
        setState(() {
          _soundBtn = _textSoundBtn;
        });
      },
      icon: Icon(Icons.volume_up),
    );
    _soundBtn = _iconSoundBtn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learn language"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showSetings(context);
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(child: Center(child: _response),),
              Expanded(
                child: Center(
                  child: _soundBtn
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (Data.index < Data.lsAsso.length) {
            Data.index++;
            setState(() {
              _response = _showBtn;
              _soundBtn = _iconSoundBtn;
            });
          }
          else {
            showSetings(context);
          }
        },
        child: Icon(Icons.skip_next),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}