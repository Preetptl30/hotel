import 'package:flutter/material.dart';

void main() {
  runApp(HotelManagementApp());
}

class HotelManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Management',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/home': (context) => HomeScreen(),
        '/bookings': (context) => BookingsScreen(),
        '/rooms': (context) => RoomsScreen(),
        '/guests': (context) => GuestsScreen(),
      },
    );
  }
}

// Mock "database" for user auth
class AuthService {
  static final Map<String, String> _users = {};

  static bool login(String email, String password) {
    return _users[email] == password;
  }

  static bool signup(String email, String password) {
    if (_users.containsKey(email)) return false;
    _users[email] = password;
    return true;
  }
}

// LOGIN SCREEN
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _error;

  void _login() {
    final email = _emailController.text;
    final password = _passwordController.text;
    if (AuthService.login(email, password)) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() => _error = 'Invalid credentials');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_error != null) Text(_error!, style: TextStyle(color: Colors.red)),
            TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: Text('Login')),
            TextButton(onPressed: () => Navigator.pushNamed(context, '/signup'), child: Text('Create an account')),
          ],
        ),
      ),
    );
  }
}

// SIGNUP SCREEN
class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _error;

  void _signup() {
    final email = _emailController.text;
    final password = _passwordController.text;
    if (AuthService.signup(email, password)) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() => _error = 'Account already exists');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_error != null) Text(_error!, style: TextStyle(color: Colors.red)),
            TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _signup, child: Text('Sign Up')),
          ],
        ),
      ),
    );
  }
}
