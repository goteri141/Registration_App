import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    Future<UserCredential> register(String email, String password) {
        return _auth.createUserWithEmailAndPassword(
            email: email,
            password: password,
        );
    }

    Future<UserCredential> signIn(String email, String password) {
        return _auth.signInWithEmailAndPassword(
            email: email,
            password: password,
        );
    }

    Future<void> signOut() {
        return _auth.signOut();
    }

    Future<void> changePassword(String newPassword) async {
        final user = _auth.currentUser;
        if (user != null) {
            await user.updatePassword(newPassword);
        }
    }

    User? get currentUser => _auth.currentUser;
}

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Email is required';
                if (!value.contains('@')) return 'Enter a valid email like test@gsu.com';
                return null;
              }
            ),

            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) {
                if (value == null || value.length < 6) return 'Password must be at least 6 characters';
                return null;
              }
            )
          ],
        ),
      ),
    );
  }
}
