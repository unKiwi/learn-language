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
              Text(Data.lsAsso[Data.index][0], textScaleFactor: 2,),
              SizedBox(height: 20,),
              Text(Data.lsAsso[Data.index][1], textScaleFactor: 2, style: TextStyle(color: Colors.red),),
              SizedBox(height: 20,),
              Text(Data.lsAsso[Data.index][2], textScaleFactor: 2, style: TextStyle(color: Colors.blue),),
            ],
          );
        });
      },
      child: Text('Show'),
    );

    _response = _showBtn;
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
                  child: IconButton(
                    onPressed: () {
                      playSound("${Data.lsAsso[Data.index][3]}.mp3");
                    },
                    icon: Icon(Icons.volume_up),
                  ),
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