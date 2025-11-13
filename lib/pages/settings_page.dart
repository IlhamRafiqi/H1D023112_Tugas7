import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

/// Halaman Settings
/// Pengaturan aplikasi dan akun user
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  double _fontSize = 14.0;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final userData = authProvider.userData;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.teal.shade50,
              Colors.white,
            ],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // Account Section
            _buildSectionHeader('Akun'),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.teal.shade100,
                      child: Text(
                        userData?['fullName']?.toString().substring(0, 1).toUpperCase() ?? 'U',
                        style: TextStyle(
                          color: Colors.teal.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      userData?['fullName']?.toString() ?? 'User',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(userData?['email']?.toString() ?? ''),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      // Navigate to edit profile (future feature)
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Fitur edit profile akan segera hadir!'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // App Settings Section
            _buildSectionHeader('Pengaturan Aplikasi'),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  SwitchListTile(
                    secondary: Icon(
                      Icons.notifications,
                      color: Colors.teal.shade700,
                    ),
                    title: const Text('Notifikasi'),
                    subtitle: const Text('Aktifkan notifikasi push'),
                    value: _notificationsEnabled,
                    activeColor: Colors.teal,
                    onChanged: (value) {
                      setState(() {
                        _notificationsEnabled = value;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            value
                                ? 'Notifikasi diaktifkan'
                                : 'Notifikasi dinonaktifkan',
                          ),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                  ),
                  const Divider(height: 1),
                  SwitchListTile(
                    secondary: Icon(
                      Icons.dark_mode,
                      color: Colors.teal.shade700,
                    ),
                    title: const Text('Dark Mode'),
                    subtitle: const Text('Tema gelap untuk aplikasi'),
                    value: _darkModeEnabled,
                    activeColor: Colors.teal,
                    onChanged: (value) {
                      setState(() {
                        _darkModeEnabled = value;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            value
                                ? 'Dark mode diaktifkan (Demo)'
                                : 'Dark mode dinonaktifkan',
                          ),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: Icon(
                      Icons.text_fields,
                      color: Colors.teal.shade700,
                    ),
                    title: const Text('Ukuran Font'),
                    subtitle: Text('${_fontSize.toInt()} pt'),
                    trailing: SizedBox(
                      width: 150,
                      child: Slider(
                        value: _fontSize,
                        min: 12.0,
                        max: 20.0,
                        divisions: 8,
                        activeColor: Colors.teal,
                        label: '${_fontSize.toInt()}',
                        onChanged: (value) {
                          setState(() {
                            _fontSize = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Privacy & Security Section
            _buildSectionHeader('Privasi & Keamanan'),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.lock,
                      color: Colors.teal.shade700,
                    ),
                    title: const Text('Ubah Password'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      _showChangePasswordDialog();
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: Icon(
                      Icons.privacy_tip,
                      color: Colors.teal.shade700,
                    ),
                    title: const Text('Kebijakan Privasi'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Membuka kebijakan privasi...'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Data Section
            _buildSectionHeader('Data'),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.cached,
                      color: Colors.teal.shade700,
                    ),
                    title: const Text('Bersihkan Cache'),
                    subtitle: const Text('Hapus data sementara'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      _showClearCacheDialog();
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(
                      Icons.delete_forever,
                      color: Colors.red,
                    ),
                    title: const Text(
                      'Hapus Akun',
                      style: TextStyle(color: Colors.red),
                    ),
                    subtitle: const Text('Hapus akun secara permanen'),
                    trailing: const Icon(Icons.chevron_right, color: Colors.red),
                    onTap: () {
                      _showDeleteAccountDialog();
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // App Info
            Center(
              child: Column(
                children: [
                  Text(
                    'Flutter Sederhana',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Version 1.0.0',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8, top: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade700,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  void _showChangePasswordDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ubah Password'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password Lama',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password Baru',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Konfirmasi Password',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Password berhasil diubah! (Demo)'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
            ),
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }

  void _showClearCacheDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Bersihkan Cache'),
        content: const Text('Apakah Anda yakin ingin menghapus semua cache?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Cache berhasil dibersihkan!'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
            ),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
  }

  void _showDeleteAccountDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Akun'),
        content: const Text(
          'Apakah Anda yakin ingin menghapus akun ini? '
          'Tindakan ini tidak dapat dibatalkan!',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Fitur ini belum tersedia!'),
                  backgroundColor: Colors.orange,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Hapus Akun'),
          ),
        ],
      ),
    );
  }
}
