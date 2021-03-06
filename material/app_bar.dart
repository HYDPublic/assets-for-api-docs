// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'lib/utils.dart';

void main() {
  runApp(new Diagram());
}

class Diagram extends StatefulWidget {
  Diagram({ Key key }) : super(key: key);

  @override
  _DiagramState createState() => new _DiagramState();
}

class _DiagramState extends State<Diagram> {
  final GlobalKey leading = new GlobalKey();
  final GlobalKey actions = new GlobalKey();
  final GlobalKey title = new GlobalKey();
  final GlobalKey flexibleSpace = new GlobalKey();
  final GlobalKey bottom = new GlobalKey();
  final GlobalKey heroKey = new GlobalKey();
  final GlobalKey canvasKey = new GlobalKey();

  Labeller _labeller;

  @override
  void initState() {
    super.initState();
    _labeller = new Labeller(
      labels: <Label>[
        new Label(leading, 'leading', const FractionalOffset(0.5, 0.25)),
        new Label(actions, 'actions', const FractionalOffset(0.25, 0.5)),
        new Label(title, 'title', const FractionalOffset(0.5, 0.5)),
        new Label(flexibleSpace, 'flexibleSpace', const FractionalOffset(0.2, 0.5)),
        new Label(bottom, 'bottom', const FractionalOffset(0.5, 0.75)),
      ],
      heroKey: heroKey,
      canvasKey: canvasKey,
      filename: 'app_bar.png',
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Material(
        color: const Color(0xFFFFFFFF),
        child: new MediaQuery(
          data: new MediaQueryData(
            padding: new EdgeInsets.all(0.0),
          ),
          child: new Stack(
            children: <Widget>[
              new Center(
                child: new Container(
                  width: 300.0,
                  height: kToolbarHeight * 2.0 + 50.0,
                  child: new AppBar(
                    key: heroKey,
                    leading: new Hole(key: leading),
                    title: new Text('Abc', key: title),
                    actions: <Widget>[
                      new Hole(),
                      new Hole(),
                      new Hole(key: actions),
                    ],
                    flexibleSpace: new DecoratedBox(
                      key: flexibleSpace,
                      decoration: new BoxDecoration(
                        gradient: new LinearGradient(
                          begin: new FractionalOffset(0.50, 0.0),
                          end: new FractionalOffset(0.48, 1.0),
                          colors: [Colors.blue.shade500, Colors.blue.shade800]
                        ),
                      ),
                    ),
                    bottom: new PreferredSize(
                      key: bottom,
                      preferredSize: const Size(0.0, kToolbarHeight),
                      child: new Container(
                        height: 50.0,
                        padding: new EdgeInsets.all(4.0),
                        child: new Placeholder(
                          strokeWidth: 2.0,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              new Positioned.fill(
                child: new CustomPaint(
                  key: canvasKey,
                  painter: _labeller,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
