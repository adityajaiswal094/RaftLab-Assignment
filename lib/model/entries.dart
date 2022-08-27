class Entries {
  String api;
  String desc;
  String? auth;
  bool https;
  String cors;
  String link;
  String category;

  Entries({
    required this.api,
    required this.desc,
    this.auth,
    required this.https,
    required this.cors,
    required this.link,
    required this.category,
  });

  factory Entries.fromJson(Map<String, dynamic> json) {
    return Entries(
      api: json['API'],
      desc: json['Description'],
      auth: json['Auth'],
      https: json['HTTPS'],
      cors: json['Cors'],
      link: json['Link'],
      category: json['Category'],
    );
  }
}
