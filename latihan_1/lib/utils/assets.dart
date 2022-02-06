import 'package:flutter/material.dart';
import 'package:latihan_1/model/course.dart';

class Assets {
  static final imageAvatar = 'assets/avatar.png';

  static final menuCourse = [
    {
      'title': 'Backend',
      'image': 'assets/backend.jpg',
      'modul': 4,
    },
    {
      'title': 'Frontend',
      'image': 'assets/frontend.jpg',
      'modul': 8,
    }
  ];

  static final profesors = [
    'assets/prof1.png',
    'assets/prof2.png',
    'assets/prof3.png',
    'assets/prof4.png',
  ];

  static final List<Course> courses = [
    Course(
      color: Colors.cyan.shade200,
      duration: '8 Hour 2 Min',
      image: 'assets/logo_flutter.png',
      modul: 17,
      name: 'Flutter',
      type: ['Frontend'],
    ),
    Course(
      color: Colors.green.shade200,
      duration: '8 Hour 2 Min',
      image: 'assets/logo_androidstudio.png',
      modul: 17,
      name: 'Android Studio',
      type: ['Frontend'],
    ),
    Course(
      color: Colors.blue.shade200,
      duration: '8 Hour 2 Min',
      image: 'assets/logo_dart.png',
      modul: 17,
      name: 'Dart',
      type: ['Frontend'],
    ),
    Course(
      color: Colors.red.shade200,
      duration: '8 Hour 2 Min',
      image: 'assets/logo_java.png',
      modul: 17,
      name: 'Java',
      type: ['Frontend', 'Backend'],
    ),
    Course(
      color: Colors.orange.shade200,
      duration: '8 Hour 2 Min',
      image: 'assets/logo_kotlin.png',
      modul: 17,
      name: 'Kotlin',
      type: ['Frontend', 'Backend'],
    ),
    Course(
      color: Colors.indigo.shade200,
      duration: '8 Hour 2 Min',
      image: 'assets/logo_php.png',
      modul: 17,
      name: 'Php',
      type: ['Backend'],
    ),
  ];
}