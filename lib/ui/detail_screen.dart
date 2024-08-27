import 'package:api_test/model/users.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Users user;

  const DetailScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name ?? 'Detail User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${user.name}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Username: ${user.username}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Email: ${user.email}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Phone: ${user.phone}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Website: ${user.website}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            if (user.address != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Address:', style: TextStyle(fontSize: 18)),
                  Text('Street: ${user.address?.street}', style: TextStyle(fontSize: 18)),
                  Text('Suite: ${user.address?.suite}', style: TextStyle(fontSize: 18)),
                  Text('City: ${user.address?.city}', style: TextStyle(fontSize: 18)),
                  Text('Zipcode: ${user.address?.zipcode}', style: TextStyle(fontSize: 18)),
                ],
              ),
            SizedBox(height: 8),
            if (user.company != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Company:', style: TextStyle(fontSize: 18)),
                  Text('Name: ${user.company?.name}', style: TextStyle(fontSize: 18)),
                  Text('Catch Phrase: ${user.company?.catchPhrase}', style: TextStyle(fontSize: 18)),
                  Text('BS: ${user.company?.bs}', style: TextStyle(fontSize: 18)),
                ],
              ),
          ],
        ),
      ),
    );
  }
}