abstract class ProgressionStrategy {
  String stringify(double progress);
  double progressCalculation(double value);
}

class PercentageProgression implements ProgressionStrategy {
  @override
  double progressCalculation(double value) {
    return value;
  }

  @override
  String stringify(double progress) {
    return "${progress * 100}%";
  }
}
