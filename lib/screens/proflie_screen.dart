import 'package:flutter/material.dart';
import 'package:registration_app/screens/authentication_screen.dart';


class ProfileScreen extends StatefulWidget{
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _authenticate = AuthService();
  final _changePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children:[
            // Display the user's email
            Text('User Email: ${_authenticate.currentUser?.email}'),

            const SizedBox(height: 30),

            // Change User's password
            TextFormField(
              controller: _changePasswordController,
              decoration: const InputDecoration(labelText: 'New Password'),
              obscureText: true,
              validator: (value) {
                if (value == null || value.length < 6) return 'Password must be at least 6 characters';
                return null;
              }
            ),

            const SizedBox(height: 30),

            // Update Password Button
            ElevatedButton(
              onPressed: () {
              },
              child: Text('Update Password')),

            const SizedBox(height: 60),

            // Sign Out Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder:(_) => AuthenticationScreen())
                );
              },
              child: Text('Sign Out'))
          ])));}}