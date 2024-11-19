import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kehadiran_siswa/views/history_screen.dart';
import '../attend_provider.dart';

class AttendanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Presensi Siswa'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<AttendanceProvider>(
              builder: (context, provider, child) {
                return ListView.builder(
                  itemCount: provider.students.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(provider.students[index].name),
                      trailing: Checkbox(
                        value: provider.students[index].isPresent,
                        onChanged: (bool? value) {
                          provider.toggleAttendance(index);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                context.read<AttendanceProvider>().saveAttendance();
              },
              child: Text('Simpan Kehadiran'),
            ),
          ),
        ],
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
