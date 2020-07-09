import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:apftcalculator/calculator_view.dart';

String appTitle = 'APFT Calculator';

void main() => runApp(MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          title: Text(
            appTitle,
            style: TextStyle(color: Colors.yellow),
          ),
        ),
        body: Center(
          child: SizedBox.expand(
            child: Calculator(),
          ),
        ),
      ),
    ));
