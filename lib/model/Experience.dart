class Experience {
  final String title;
  final String companyName;
  final String icon;
  final String iconBg;
  final String date;
  final List<String> points;

  Experience({
    required this.title,
    required this.companyName,
    required this.icon,
    required this.iconBg,
    required this.date,
    required this.points,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      title: json['title'],
      companyName: json['company_name'],
      icon: json['icon'],
      iconBg: json['iconBg'],
      date: json['date'],
      points: List<String>.from(json['points']),
    );
  }
}