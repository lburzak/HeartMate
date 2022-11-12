class Range {
  final num from;
  final num to;

  const Range({
    required this.from,
    required this.to,
  });

  @override
  String toString() {
    return 'Range{from: $from, to: $to}';
  }

  bool includesInclusively(num value) {
    return value >= from && value <= to;
  }
}
