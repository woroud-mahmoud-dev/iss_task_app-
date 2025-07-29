class Project {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final DateTime startDate;
  final DateTime endDate;
  final int workHours;
  final String companyName;

  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.startDate,
    required this.endDate,
    required this.workHours,
    required this.companyName,
  });
}
