import 'package:flutter/material.dart';

class DisplayImage extends StatefulWidget {
  @override
  _DisplayImageState createState() => _DisplayImageState();
}

class _DisplayImageState extends State<DisplayImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        'Display image'
      ),),
    );
  }
}
