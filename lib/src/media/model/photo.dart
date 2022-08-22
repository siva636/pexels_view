class Photo {
  final int id;
  final String mediumUrl;
  final String alt;

  const Photo({required this.id, required this.mediumUrl, required this.alt});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      mediumUrl: json['src']['medium'],
      alt: json['alt'],
    );
  }
}
