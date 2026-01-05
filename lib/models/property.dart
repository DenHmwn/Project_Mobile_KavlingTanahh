class Property {
  final String id;
  final String name;
  final String type;
  final String location;
  final String imageAsset;
  final double rating;
  final List<String> availableSlots;

  Property({
    required this.id,
    required this.name,
    required this.type,
    required this.location,
    required this.imageAsset,
    required this.rating,
    required this.availableSlots,
  });

  static List<Property> getDummyData() {
    return [
      Property(
        id: '1',
        name: 'Kavling 1',
        type: 'Standard',
        location: 'Kota Bumi',
        imageAsset: 'assets/images/Kavling.jpg',
        rating: 4.7,
        availableSlots: ['09:00 - 10:30', '11:00 - 12:30', '13:00 - 14:30'],
      ),
      Property(
        id: '2',
        name: 'Kavling 2',
        type: 'Corner',
        location: 'Metro',
        imageAsset: 'assets/images/Kavling2.png',
        rating: 4.8,
        availableSlots: ['09:00 - 10:30', '11:00 - 12:30', '13:00 - 14:30'],
      ),
      Property(
        id: '3',
        name: 'Kavling 3',
        type: 'Standard',
        location: 'Bandar Lampung',
        imageAsset: 'assets/images/Kavling3.jpg',
        rating: 4.8,
        availableSlots: ['09:00 - 10:30', '11:00 - 12:30', '13:00 - 14:30'],
      ),
      Property(
        id: '4',
        name: 'Kavling 4',
        type: 'Flute',
        location: 'Sidomulyo',
        imageAsset: 'assets/images/Kavling4.jpg',
        rating: 4.9,
        availableSlots: ['09:00 - 10:30', '11:00 - 12:30', '13:00 - 14:30'],
      ),
    ];
  }
}
