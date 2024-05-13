class ProfileModel {
  final int userId;
  final String firstName;
  final String lastName;
  final String img;
  final String jobTitle;
  final String name;

  const ProfileModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.img,
    required this.jobTitle,
    required this.name,
  });

  ProfileModel.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        firstName = json['firstname'],
        lastName = json['lastname'],
        img = json['img'],
        jobTitle = json['jobtitle'],
        name = json['name'];
}
