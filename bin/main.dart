import '../lib/triangle.dart';

void main() {
  final t = Triangle.cm(40, 20); // createdWith = cm (intern 400 mm x 200 mm)
  print('height in mm: ${t.getHeight(MeasurementSystem.mm)}');   // 200
  print('height in cm: ${t.getHeight(MeasurementSystem.cm)}');   // 20
  print('area in cm² (area getter): ${t.areaWithUnit}');         // area in cm² (string)
  print('area in m²: ${t.areaIn(MeasurementSystem.m)}');         // convert to m²

  // setHeight: set 3 meters -> will convert to mm and store
  t.setHeight(MeasurementSystem.m, 3); // sets height to 3000 mm
  print('after setHeight to 3 m -> height in mm: ${t.getHeight(MeasurementSystem.mm)}');
  print('new area in createdWith units (${t.createdWith.name}²): ${t.areaWithUnit}');
}
