class Medicine {
  final String name;
  final int quantity;
  final DateTime expiry;

  const Medicine({
    required this.name,
    required this.quantity,
    required this.expiry,
  });
  bool get isExpired => expiry.isBefore(DateTime.now());
}