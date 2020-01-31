import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:veggly_redesign/models/userInfo.dart';

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
  String location;
  int distance;
  String firstName;
  String lastName;
  int age;
  Gender gender;
  Gender interestedIn;
  Diet diet;
  String imgUrl;

  String occupation;
  String company;

  String bio;

  User(
      {this.firstName,
      this.lastName,
      this.age,
      this.diet,
      this.imgUrl,
      this.location,
      this.distance,
      this.gender,
      this.interestedIn,
      this.occupation,
      this.company,
      this.bio});

  String getDiet() {
    String dietValue =
        diet.toString().substring(diet.toString().indexOf('.') + 1);
    return '${dietValue[0].toUpperCase()}${dietValue.substring(1)}';
  }

  String getGender() {
    String genderValue =
        gender.toString().substring(gender.toString().indexOf('.') + 1);
    return '${genderValue[0].toUpperCase()}${genderValue.substring(1)}';
  }

  String getInterestedInValue() {
    String interestedValue =
        interestedIn.toString().substring(interestedIn.toString().indexOf('.') + 1);
    return '${interestedValue[0].toUpperCase()}${interestedValue.substring(1)}';
  }

  String getFullName() {
    return '$firstName $lastName';
  }

  String getDistance() {
    return '${distance.toString()} km from you';
  }

  String getCompany() {
    return 'at $company';
  }

  String getInterestedIn() {
    return 'looking for ${getInterestedInValue()}';
  }

  List<UserInfo> getUserInfoList() {
    return [
      UserInfo(Icons.location_on, location, getDistance()),
      UserInfo(Icons.work, occupation, company),
      UserInfo(Icons.group, getGender(), getInterestedIn()),
      UserInfo(Icons.account_circle, bio, ''),
    ];
  }
}
