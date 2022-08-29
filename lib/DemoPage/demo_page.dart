import 'package:demo1/DemoPage/models/coordinate_model.dart';
import 'package:demo1/DemoPage/models/line_model.dart';
import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  List<Line> parallelToX = [];
  List<Line> parallelToY = [];
  List<Coordinate> coordinateList = [
    Coordinate(1, 2),
    Coordinate(3, 7),
    Coordinate(0, 6),
    Coordinate(1, 1),
    Coordinate(-5, 2),
    Coordinate(1, 5),
    Coordinate(3, -5),
  ];

  void findAll() {
    parallelToX.clear();
    parallelToY.clear();

    for (var control in coordinateList) {
      for (var test in coordinateList) {
        if (control.x == test.x && control.y != test.y) {
          parallelToY.add(Line(control, test));
        }
        if (control.x != test.x && control.y == test.y) {
          parallelToX.add(Line(control, test));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Biofarma")),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.calculate), onPressed: () => setState(() => findAll())),
        body: cards());
  }

  Row cards() => Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        dataCard(listName: "X", list: parallelToX),
        dataCard(listName: "Y", list: parallelToY),
      ]);

  Card dataCard({required String listName, required List<Line> list}) => Card(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Parallel To $listName\n(${list.length})", textAlign: TextAlign.center)),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  children: List.generate(
                      list.length,
                      (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(list[index].rawValue())))))
        ],
      ));
}
