import 'package:flutter/material.dart';
import 'package:kehadiran_siswa/models/kehadiran.dart';
import 'package:kehadiran_siswa/models/siswa.dart';

class AttendanceProvider with ChangeNotifier {
  List<Student> students = [
    Student(name: 'dani'),
    Student(name: 'dapi'),
    Student(name: 'dari'),
    Student(name: 'daki'),
    Student(name: 'dasi'),
    Student(name: 'dabi'),
    Student(name: 'isma'),
    Student(name: 'opet'),
  ];

  List<AttendanceRecord> attendanceHistory = [];

  void toggleAttendance(int index) {
    students[index].isPresent = !students[index].isPresent;
    notifyListeners();
  }

  void saveAttendance() {
    int presentCount = students.where((student) => student.isPresent).length;
    int absentCount = students.length - presentCount;

    attendanceHistory.insert(
        0,
        AttendanceRecord(
          date: DateTime.now(),
          presentCount: presentCount,
          absentCount: absentCount,
        ));

    // Reset attendance
    for (var student in students) {
      student.isPresent = false;
    }

    notifyListeners();
  }
}
