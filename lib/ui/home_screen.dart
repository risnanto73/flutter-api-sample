import 'package:api_test/model/users.dart';
import 'package:api_test/service/api_service.dart';
import 'package:api_test/ui/detail_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Future<List<Users>?> futureUsers = ApiService().getUsers();  // Inisialisasi langsung

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: FutureBuilder<List<Users>?>(
        future: futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No users found'));
          } else {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(users[index].name ?? 'No name'),
                  subtitle: Text(users[index].email ?? 'No email'),
                  onTap: () {
                    // Navigasi ke halaman detail dengan data pengguna yang dipilih
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(user: users[index]),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}