class Reservation {
  final String id;
  final String propertyId;
  final String propertyName;
  final String location;
  final DateTime date;
  final String timeSlot;
  final String imageAsset;

  Reservation({
    required this.id,
    required this.propertyId,
    required this.propertyName,
    required this.location,
    required this.date,
    required this.timeSlot,
    required this.imageAsset,
  });

  String get formattedDate {
    final months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }
}
