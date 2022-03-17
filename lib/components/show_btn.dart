import 'package:flutter/material.dart';

class ShowBtn extends StatefulWidget {
  @override
  State<ShowBtn> createState() => _ShowBtnState();
}

class _ShowBtnState extends State<ShowBtn> {
  late Widget _btn;

  @override
  void initState() {
    super.initState();

    _btn = ElevatedButton(
      onPressed: () {
        setState(() {
          _btn = Text("Hello");
        });
      },
      child: Text('Show'),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Center(child: _btn,);
  }
}