import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final Function _onPressHanlder;
  final String _text;

  AdaptiveFlatButton(this._text, this._onPressHanlder);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
            margin: EdgeInsets.only(left: 45),
            child: CupertinoButton(
                child: Text(
                  _text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: _onPressHanlder),
          )
        : FlatButton(
            onPressed: _onPressHanlder,
            child: Text(
              _text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            textColor: Theme.of(context).primaryColor,
          );
  }
}
