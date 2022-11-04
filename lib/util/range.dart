class Range {
  final double from;
  final double to;

  const Range({
    required this.from,
    required this.to,
  });

  @override
  String toString() {
    return 'Range{from: $from, to: $to}';
  }
}
