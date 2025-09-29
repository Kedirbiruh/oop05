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
  ) => Triangle._internal(
    system.toMm(_ensurePositive(width)),
    system.toMm(_ensurePositive(height)),
    system,
  );

  // area in mm2
  double get areaInMm2 => 0.5 * _widthInMm * _heightInMm;

  // Fläche in beliebige Einheit

  double areaIn(MeasurementSystem ms) {
    final f = ms.mmPerUnit;
    return areaInMm2 / (f * f);
  }

  // -------- Neues: getHeight(ms) und setHeight(ms, int value) --------
  double getHeight(MeasurementSystem ms) => ms.fromMm(_heightInMm);

  void setHeight(MeasurementSystem ms, int value) {
    final validated = _ensurePositive(value.toDouble());
    _heightInMm = ms.toMm(validated);
  }

  // (Analog: optional) getWidth/setWidth methods if desired
  double getWidth(MeasurementSystem ms) => ms.fromMm(_widthInMm);
  void setWidth(MeasurementSystem ms, int value) {
    final validated = _ensurePositive(value.toDouble());
    _widthInMm = ms.toMm(validated);
  }

  double get area => areaIn(createdWith);

  String get areaWithUnit => '${area.toStringAsFixed(4)} ${createdWith.name}²';

  @override
  String toString() {
    return 'Triangle(width: ${_widthInMm.toStringAsFixed(2)} mm, '
        'height: ${_heightInMm.toStringAsFixed(2)} mm, '
        'createdWith: ${createdWith.name}, area: ${areaInMm2.toStringAsFixed(2)} mm²)';
  }
}
