class Photo {
  final int id;
  final String mediumUrl;
  final String large2xUrl;
  final String alt;

  const Photo({
    required this.id,
    required this.mediumUrl,
    required this.large2xUrl,
    required this.alt,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      mediumUrl: json['src']['medium'],
      large2xUrl: json['src']['large2x'],
      alt: json['alt'],
    );
  }
}
