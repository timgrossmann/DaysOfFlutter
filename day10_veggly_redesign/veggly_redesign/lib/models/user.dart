import 'package:uuid/uuid.dart';

enum Gender {
  male,
  female,
  nonBinary,
}

enum Diet {
  vegan,
  vegetarian,
  inProgress,
}

class User {
  String uid = new Uuid().v4();
  int distance;
  String firstName;
  String lastName;
  int age;
  Gender gender;
  Diet diet;
  String imgUrl;

  User(
      {this.firstName,
      this.age,
      this.diet,
      this.imgUrl,
      this.distance,
      this.gender});

  String getDiet() {
    String dietValue =
        diet.toString().substring(diet.toString().indexOf('.') + 1);
    return '${dietValue[0].toUpperCase()}${dietValue.substring(1)}';
  }

  String getFullName() {
    return '$firstName $lastName';
  }

  String getDistance() {
    return '${distance.toString()} km away';
  }
}
