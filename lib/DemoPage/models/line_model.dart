import 'package:demo1/DemoPage/models/coordinate_model.dart';

class Line {
  late final Coordinate A;
  late final Coordinate B;

  Line(this.A, this.B);
}

extension LineExtensions on Line {
  String rawValue() {
    return "A(${A.x},${A.y})  B(${B.x},${B.y})";
  }
}
