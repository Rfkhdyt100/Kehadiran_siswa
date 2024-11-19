import 'package:flutter/material.dart';
import 'package:kehadiran_siswa/views/attend_screen.dart';
import 'package:provider/provider.dart';
import '../attend_provider.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Kehadiran'),
      ),
      body: Consumer<AttendanceProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.attendanceHistory.length,
            itemBuilder: (context, index) {
              final record = provider.attendanceHistory[index];
              return ListTile(
                title: Text(
                    '${record.date.day} ${record.date.month} ${record.date.year}'),
                subtitle: Text(
                    'Hadir: ${record.presentCount}, Tidak Hadir: ${record.absentCount}'),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Pencatatan'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AttendanceScreen()));
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HistoryScreen()));
          }
        },
      ),
    );
  }
}
