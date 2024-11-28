import 'package:flutter/material.dart';
import 'package:map_data/auth/signup_screen.dart';
import 'package:map_data/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Spacer(flex: 1),
              const Text(
                "Login",
                style: TextStyle(fontSize: 32),
              ),
              const Spacer(flex: 2),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  label: const Text("username"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  label: const Text("Password"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () {
                  if (_usernameController.text == 'admin' &&
                      _passwordController.text == 'admin') {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                        (Route<dynamic> route) => false);
                  } else {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text("Invalid Credentials"),
                        backgroundColor: Colors.red.shade800,
                      ),
                    );
                    _usernameController.clear();
                    _passwordController.clear();
                  }
                },
                child: const Text("Login"),
              ),
              const SizedBox(height: 32),
              TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen())),
                child: const Text("don't have account!\nCreate account",
                    textAlign: TextAlign.center),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
