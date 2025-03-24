import 'package:flutter/material.dart';

void main() {
  runApp(const SignupValidationApp());
}

class SignupValidationApp extends StatelessWidget {
  const SignupValidationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Signup Validation',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Signup Page'),
        ),
        body: const SignupForm(),
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) => value == null || value.isEmpty ? 'Name is required' : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) => value == null || value.isEmpty ? 'Email is required' : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Date of Birth'),
              validator: (value) => value == null || value.isEmpty ? 'Date of birth is required' : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) => value == null || value.isEmpty ? 'Password is required' : null,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('All good! Processing...')),
                  );
                }
              },
              child: const Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
