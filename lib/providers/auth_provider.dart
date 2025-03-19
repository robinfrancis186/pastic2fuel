import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;
  String _userId = '';
  String _username = 'User';
  String _email = '';
  String _token = '';

  bool get isAuthenticated => _isAuthenticated;
  String get userId => _userId;
  String get username => _username;
  String get email => _email;
  String get token => _token;

  // Initialize auth state from shared preferences
  Future<void> initAuth() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token') ?? '';
    _userId = prefs.getString('userId') ?? '';
    _username = prefs.getString('username') ?? '';
    _email = prefs.getString('email') ?? '';
    _isAuthenticated = _token.isNotEmpty;
    notifyListeners();
  }

  // Login user
  Future<bool> login(String email, String password) async {
    // In a real app, this would make an API call to authenticate
    // For demo purposes, we'll simulate a successful login
    await Future.delayed(const Duration(seconds: 2));
    
    if (email.isNotEmpty && password.isNotEmpty) {
      _isAuthenticated = true;
      _userId = 'user123';
      _username = email.split('@')[0];
      _email = email;
      _token = 'demo_token_${DateTime.now().millisecondsSinceEpoch}';
      
      // Save to shared preferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', _token);
      prefs.setString('userId', _userId);
      prefs.setString('username', _username);
      prefs.setString('email', _email);
      
      notifyListeners();
      return true;
    }
    return false;
  }

  // Register user
  Future<bool> register(String username, String email, String password) async {
    // In a real app, this would make an API call to register
    // For demo purposes, we'll simulate a successful registration
    await Future.delayed(const Duration(seconds: 2));
    
    if (username.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      _isAuthenticated = true;
      _userId = 'user123';
      _username = username;
      _email = email;
      _token = 'demo_token_${DateTime.now().millisecondsSinceEpoch}';
      
      // Save to shared preferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', _token);
      prefs.setString('userId', _userId);
      prefs.setString('username', _username);
      prefs.setString('email', _email);
      
      notifyListeners();
      return true;
    }
    return false;
  }

  // Logout user
  Future<void> logout() async {
    _isAuthenticated = false;
    _userId = '';
    _username = '';
    _email = '';
    _token = '';
    
    // Clear shared preferences
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    prefs.remove('userId');
    prefs.remove('username');
    prefs.remove('email');
    
    notifyListeners();
  }
} 