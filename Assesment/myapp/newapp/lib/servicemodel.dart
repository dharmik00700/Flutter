class Service {
  final String id;
  final String name;
  final String category;
  final String image;
  final double rating;
  final String phone;
  final String description;

  Service({required this.id, required this.name, required this.category, required this.image, required this.rating, required this.phone, required this.description});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? 'Unnamed',
      category: json['category'] ?? 'General',
      image: json['image'] ?? '',
      rating: (json['rating'] is num) ? (json['rating'] + 0.0) : double.tryParse(json['rating']?.toString() ?? '0') ?? 0.0,
      phone: json['phone'] ?? '+911234567890',
      description: json['description'] ?? 'Service description',
    );
  }

  static List<Service> mockList() {
    return List.generate(8, (i) => Service(
        id: '$i',
        name: ['Plumber','Salon','Tuition','Electrician','Carpenter','Painter','AC Repair','Cleaner'][i % 8],
        category: ['Home','Beauty','Education','Home','Home','Home','Home','Home'][i % 8],
        image: 'https://picsum.photos/seed/${i+10}/400/300',
        rating: 4.0 + (i % 5) * 0.1,
        phone: '+9112345678${i}0',
        description: 'Reliable ${['plumbing','salon','tuition','electrical','carpentry','painting','AC','cleaning'][i%8]} service in your city.'
    ));
  }
}

