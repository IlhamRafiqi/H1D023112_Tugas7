import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// Service untuk mengelola Local Storage
/// Menyimpan data user yang register
class StorageService {
  // Singleton pattern
  StorageService._privateConstructor();
  static final StorageService _instance = StorageService._privateConstructor();
  factory StorageService() => _instance;
  
  SharedPreferences? _prefs;
  
  /// Inisialisasi SharedPreferences
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }
  
  // ==================== USER REGISTRATION ====================
  
  /// Simpan data user yang register
  /// Format: {username: {email, password, fullName}}
  Future<bool> registerUser({
    required String username,
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      // Ambil data users yang sudah ada
      Map<String, dynamic> users = getAllUsers();
      
      // Check apakah username sudah ada
      if (users.containsKey(username)) {
        return false; // Username sudah terdaftar
      }
      
      // Simpan user baru
      users[username] = {
        'email': email,
        'password': password,
        'fullName': fullName,
      };
      
      // Simpan ke SharedPreferences
      String usersJson = jsonEncode(users);
      return await _prefs?.setString('users', usersJson) ?? false;
    } catch (e) {
      print('Error registering user: $e');
      return false;
    }
  }
  
  /// Ambil semua data users
  Map<String, dynamic> getAllUsers() {
    try {
      String? usersJson = _prefs?.getString('users');
      if (usersJson == null || usersJson.isEmpty) {
        return {};
      }
      return jsonDecode(usersJson) as Map<String, dynamic>;
    } catch (e) {
      print('Error getting users: $e');
      return {};
    }
  }
  
  /// Validasi login
  bool validateLogin(String username, String password) {
    Map<String, dynamic> users = getAllUsers();
    
    if (!users.containsKey(username)) {
      return false; // Username tidak ditemukan
    }
    
    Map<String, dynamic> userData = users[username];
    return userData['password'] == password;
  }
  
  /// Ambil data user berdasarkan username
  Map<String, dynamic>? getUserData(String username) {
    Map<String, dynamic> users = getAllUsers();
    if (users.containsKey(username)) {
      // Tambahkan username ke data yang di-return
      Map<String, dynamic> userData = Map<String, dynamic>.from(users[username]);
      userData['username'] = username;
      return userData;
    }
    return null;
  }
  
  // ==================== SESSION MANAGEMENT ====================
  
  /// Simpan session user yang login
  Future<bool> saveSession(String username) async {
    return await _prefs?.setString('currentUser', username) ?? false;
  }
  
  /// Ambil username user yang sedang login
  String? getCurrentUser() {
    return _prefs?.getString('currentUser');
  }
  
  /// Hapus session (logout)
  Future<bool> clearSession() async {
    return await _prefs?.remove('currentUser') ?? false;
  }
  
  /// Check apakah user sedang login
  bool isLoggedIn() {
    return getCurrentUser() != null;
  }
}
