import 'package:draggable_example/main.dart';
import 'package:flutter/material.dart';

class DraggableTextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: Center(
          child: Draggable(
            child: buildText('Drag Me', Colors.purple),
            feedback: Material(child: buildText('Dragged', Colors.green)),
            childWhenDragging: buildText('Behind', Colors.red),
          ),
        ),
      );

  Widget buildText(String text, Color color) => Container(
        alignment: Alignment.center,
        width: 160,
        height: 100,
        color: color,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 32),
          textAlign: TextAlign.center,
        ),
      );
}
