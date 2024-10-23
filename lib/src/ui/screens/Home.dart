// lib/src/ui/screens/home_screen.dart
import 'package:apir_front/src/providers/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${userProvider.user.name}'),
            Text('Age: ${userProvider.user.age}'),
            ElevatedButton(
              onPressed: () {
                userProvider.updateUser('Jane Doe', 25);
              },
              child: Text('Update User'),
            ),
          ],
        ),
      ),
    );
  }
}