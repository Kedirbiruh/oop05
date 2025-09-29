enum MeasurementSystem {
  mm(1.0),
  cm(10.0),
  dm(100.0),
  m(1000.0),
  inch(25.4),
  feet(304.8);

  final double mmPerUnit;
  const MeasurementSystem(this.mmPerUnit);

  double toMm(double value) => value * mmPerUnit;
  double fromMm(double mm) => mm / mmPerUnit;
}

class Triangle {
  double _widthInMm;
  double _heightInMm;
  final MeasurementSystem createdWith;

  Triangle._internal(this._widthInMm, this._heightInMm, this.createdWith);

  static double _ensurePositive(double v) {
    if (v <= 0) throw ArgumentError('Value must be > 0 (got $v).');
    return v;
  }


  factory Triangle.mm(double width, double height) => Triangle._internal(
    MeasurementSystem.mm.toMm(_ensurePositive(height)),
    MeasurementSystem.mm.toMm(_ensurePositive(width)),
    MeasurementSystem.mm,
  );

  factory Triangle.cm(double width, double height) => Triangle._internal(
    MeasurementSystem.cm.toMm(_ensurePositive(width)),
    MeasurementSystem.cm.toMm(_ensurePositive(height)),
    MeasurementSystem.cm,
  );

  factory Triangle.dm(double width, double height) => Triangle._internal(
    MeasurementSystem.dm.toMm(_ensurePositive(width)),
    MeasurementSystem.dm.toMm(_ensurePositive(height)),
    MeasurementSystem.dm,
  );

  factory Triangle.m(double width, double height) => Triangle._internal(
    MeasurementSystem.m.toMm(_ensurePositive(width)),
    MeasurementSystem.m.toMm(_ensurePositive(height)),
    MeasurementSystem.m,
  );

  factory Triangle.inch(double width, double height) => Triangle._internal(
    MeasurementSystem.inch.toMm(_ensurePositive(width)),
    MeasurementSystem.inch.toMm(_ensurePositive(height)),
    MeasurementSystem.inch,
  );

  factory Triangle.feet(double width, double height) => Triangle._internal(
    MeasurementSystem.feet.toMm(_ensurePositive(width)),
    MeasurementSystem.feet.toMm(_ensurePositive(height)),
    MeasurementSystem.feet,
  );



  factory Triangle.from(
    double width,
    double height,
    MeasurementSystem system,
  ) => Triangle._internal(system.toMm(_ensurePositive(width)), system.toMm(_ensurePositive(height)), system);



  // area in mm2
  double get areaInMm2 => 0.5 * _widthInMm * _heightInMm;

  double areaIn(MeasurementSystem ms) {
    final ms.mmPerUnit;
      return areaInMm2/(f * f);
  }








  double _validate(double value) {
    if (value <= 0) {
      throw ArgumentError('Wert darf nicht negativ sein: $value');
    }
    return value;
  }

  // ---- Getter und Setter für Breite -----

  double get widthInMm => _widthInMm;
  set widthInMm(double mm) => _widthInMm = _validate(mm);

  double get widthInCm => MeasurementSystem.cm.fromMm(_widthInMm);
  set widthInCm(double v) =>
      _widthInMm = MeasurementSystem.cm.toMm(_validate(v));

  double get widthInDm => MeasurementSystem.dm.fromMm(_widthInMm);
  set widthInDm(double v) =>
      _widthInMm = MeasurementSystem.dm.toMm(_validate(v));

  double get widthInMeters => MeasurementSystem.m.fromMm(_widthInMm);
  set widthInMeters(double v) =>
      _widthInMm = MeasurementSystem.m.toMm(_validate(v));

  double get widthInch => MeasurementSystem.inch.fromMm(_widthInMm);
  set widthInch(double v) =>
      _widthInMm = MeasurementSystem.inch.toMm(_validate(v));
  double get widthInfeet => MeasurementSystem.feet.fromMm(_widthInMm);
  set widthInFeet(double v) =>
      _widthInMm = MeasurementSystem.feet.toMm(_validate(v));

  // ---- Getter und Setter für Höhe

  double get heightInMm => _heightInMm;
  set heightInMm(double mm) => _heightInMm = _validate(mm);

  double get heightInCm => MeasurementSystem.cm.fromMm(_heightInMm);
  set heightInCm(double v) =>
      _heightInMm = MeasurementSystem.cm.toMm(_validate(v));

  double get heightInDm => MeasurementSystem.dm.fromMm(_heightInMm);
  set heightIndm(double v) =>
      _heightInMm = MeasurementSystem.dm.toMm(_validate(v));

  double get heightInMeters => MeasurementSystem.m.fromMm(_heightInMm);
  set heightInMeters(double v) =>
      _heightInMm = MeasurementSystem.m.toMm(_validate(v));

  double get heightInInch => MeasurementSystem.inch.fromMm(_heightInMm);
  set heightInInch(double v) =>
      _heightInMm = MeasurementSystem.inch.toMm(_validate(v));

  double get heightInfeet => MeasurementSystem.feet.fromMm(_heightInMm);
  set heightInfeet(double v) =>
      _heightInMm = MeasurementSystem.feet.toMm(_validate(v));

  @override
  String toString() {
    return 'Triangle(width: ${_widthInMm.toStringAsFixed(2)} mm, height: ${_heightInMm.toStringAsFixed(2)} mm,'
        'createdWith: $createdWith, area: ${areaInMm2.toStringAsFixed(2)} mm²)';
  }
}
