import 'package:flutter/foundation.dart';
import '../services/storage_service.dart';

/// Provider untuk mengelola autentikasi
class AuthProvider extends ChangeNotifier {
  final StorageService _storage = StorageService();
  
  String? _currentUser;
  Map<String, dynamic>? _userData;
  
  // Getters
  String? get currentUser => _currentUser;
  Map<String, dynamic>? get userData => _userData;
  bool get isLoggedIn => _currentUser != null;
  
  /// Constructor - load session jika ada
  AuthProvider() {
    _loadSession();
  }
  
  /// Load session dari storage
  void _loadSession() {
    _currentUser = _storage.getCurrentUser();
    if (_currentUser != null) {
      _userData = _storage.getUserData(_currentUser!);
    }
    notifyListeners();
  }
  
  /// Register user baru
  Future<Map<String, dynamic>> register({
    required String username,
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      // Validasi input
      if (username.isEmpty || email.isEmpty || password.isEmpty || fullName.isEmpty) {
        return {'success': false, 'message': 'Semua field harus diisi'};
      }
      
      if (password.length < 6) {
        return {'success': false, 'message': 'Password minimal 6 karakter'};
      }
      
      // Register ke storage
      bool success = await _storage.registerUser(
        username: username,
        email: email,
        password: password,
        fullName: fullName,
      );
      
      if (success) {
        return {'success': true, 'message': 'Registrasi berhasil! Silakan login.'};
      } else {
        return {'success': false, 'message': 'Username sudah terdaftar'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Terjadi kesalahan: $e'};
    }
  }
  
  /// Login dengan validasi
  Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  }) async {
    try {
      // Validasi input
      if (username.isEmpty || password.isEmpty) {
        return {'success': false, 'message': 'Username dan password harus diisi'};
      }
      
      // Validasi credentials
      bool isValid = _storage.validateLogin(username, password);
      
      if (isValid) {
        // Simpan session
        await _storage.saveSession(username);
        
        // Load user data
        _currentUser = username;
        _userData = _storage.getUserData(username);
        
        notifyListeners();
        return {'success': true, 'message': 'Login berhasil!'};
      } else {
        return {'success': false, 'message': 'Username atau password salah'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Terjadi kesalahan: $e'};
    }
  }
  
  /// Logout
  Future<void> logout() async {
    await _storage.clearSession();
    _currentUser = null;
    _userData = null;
    notifyListeners();
  }
  
  /// Check apakah ada session aktif
  Future<bool> checkSession() async {
    _currentUser = _storage.getCurrentUser();
    if (_currentUser != null) {
      _userData = _storage.getUserData(_currentUser!);
      notifyListeners();
      return true;
    }
    return false;
  }
}
