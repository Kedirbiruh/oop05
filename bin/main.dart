import '../lib/triangle.dart';

void main() {
  final t1 = Triangle.cm(40, 20);
  final t2 = Triangle.inch(5, 10);
  final t3 = Triangle.from(2.5, 3, MeasurementSystem.m);

  print(t1);
  print(t2);
  print(t3);

  print('t1 Breite in m: ${t1.widthInMeters}');
  print('t2 Höhe in cm: ${t2.heightInCm}');
  print('t3 Fläche in m²: ${t3.areaIn(MeasurementSystem.m)}');

  // Setzen neuer Werte über Setter
  t1.widthInMeters = 0.5; // intern 500 mm
  t2.heightInInch = 12; // intern 304.8 mm

  print('Nach Setzen:');
  print(t1);
  print(t2);
}
