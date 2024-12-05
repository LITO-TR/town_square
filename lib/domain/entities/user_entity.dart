class UserEntity {
  final String name;
  final String status;
  final int numberOrganized;
  final int numberAssisted;
  final String description;
  final String location;
  final String occupation;
  final List<String> interests;

  UserEntity({
    required this.name,
    required this.status,
    required this.numberOrganized,
    required this.numberAssisted,
    required this.description,
    required this.location,
    required this.occupation,
    required this.interests,
  });
}
