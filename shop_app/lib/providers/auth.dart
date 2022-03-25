import 'dart:convert';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shop_app/models/httpException.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiry;
  String _userId;
  Timer _authTimer;

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_token != null && _expiry != null && _expiry.isAfter(DateTime.now())) {
      return _token;
    } else
      return null;
  }

  String get userId {
    return _userId;
  }

  void _setLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = json.encode({
      'token': _token,
      'userId': _userId,
      'expiry': _expiry.toIso8601String(),
    });
    prefs.setString('userData', userData);
  }

  Future<void> signup(String email, String password) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDczOECXBeboDVEtdFe00-j1KFwVAWaRY0');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );

      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }

      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiry = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      autoLogout();
      notifyListeners();
      await _setLocalStorage();
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> signin(String email, String password) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDczOECXBeboDVEtdFe00-j1KFwVAWaRY0');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );

      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }

      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiry = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      autoLogout();
      notifyListeners();
      await _setLocalStorage();
    } catch (e) {
      print(e);
    }
  }

  Future<bool> tryAutoLogin() async {
    print("AUTO LOGIN CALLED!");

    try {
      final prefs = await SharedPreferences.getInstance();
      if (!prefs.containsKey('userData')) {
        print("USER DATA NOT FOUNT IN LOCAL STORAGE");
        return false;
      }
      final extractedUserData =
          json.decode(prefs.getString('userData')) as Map<String, Object>;

      final expiryDate = DateTime.parse(extractedUserData['expiry']);

      if (expiryDate.isBefore(DateTime.now())) {
        print("TOKEN EXPIRED");
        prefs.clear();
        return false;
      }

      _token = extractedUserData['token'];
      _userId = extractedUserData['userId'];
      _expiry = expiryDate;

      notifyListeners();
      print("LOGING USER IN!");
      autoLogout();
      return true;
    } catch (e) {
      print(e);
    }
  }

  void logout() async {
    _token = null;
    _userId = null;
    _expiry = null;
    if (_authTimer != null) {
      _authTimer.cancel();
      _authTimer = null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    // prefs.remove('userData');
    prefs.clear();
  }

  void autoLogout() {
    if (_authTimer != null) {
      _authTimer.cancel();
    }
    final timeRemaining = _expiry.difference(DateTime.now()).inSeconds;
    Timer(Duration(seconds: timeRemaining), logout);
    notifyListeners();
  }
}
