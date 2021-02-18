import 'package:draggable_example/utils.dart';
import 'package:draggable_example/widget/app_bar_widget.dart';
import 'package:draggable_example/widget/draggable_widget.dart';
import 'package:flutter/material.dart';
import '../data/data.dart';

class DraggableBasicPage extends StatefulWidget {
  @override
  _DraggableBasicPageState createState() => _DraggableBasicPageState();
}

class _DraggableBasicPageState extends State<DraggableBasicPage> {
  final List<Animal> all = allAnimals;
  int score = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: buildAppBar(score: score),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildOrigin(),
              buildTargets(context),
            ],
          ),
        ),
      );

  Widget buildTargets(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildTarget(
            context,
            text: 'Animals',
            acceptType: AnimalType.land,
          ),
          buildTarget(
            context,
            text: 'Birds',
            acceptType: AnimalType.air,
          ),
        ],
      );

  Widget buildOrigin() => Stack(
        alignment: Alignment.center,
        children: all.map((animal) => DraggableWidget(animal: animal)).toList(),
      );

  Widget buildTarget(
    BuildContext context, {
    @required String text,
    @required AnimalType acceptType,
  }) =>
      CircleAvatar(
        radius: 75,
        backgroundColor: Theme.of(context).primaryColor,
        child: DragTarget<Animal>(
          builder: (context, candidateData, rejectedData) => Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          onWillAccept: (data) => true,
          onAccept: (data) {
            if (data.type == acceptType) {
              Utils.showSnackBar(
                context,
                text: 'This Is Correct 🥳',
                color: Colors.green,
              );

              setState(() {
                score += 50;
                all.removeWhere((animal) => animal.imageUrl == data.imageUrl);
              });
            } else {
              setState(() => score -= 20);

              Utils.showSnackBar(
                context,
                text: 'Try Again! 😥',
                color: Colors.red,
              );
            }
          },
        ),
      );
}
