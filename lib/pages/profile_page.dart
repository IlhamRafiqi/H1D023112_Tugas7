import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

/// Halaman Profile
/// Menampilkan informasi user yang sedang login
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final userData = authProvider.userData;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
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
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // Avatar
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.teal,
                      width: 3,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.teal.shade100,
                    child: Text(
                      userData?['fullName']?.toString().substring(0, 1).toUpperCase() ?? 'U',
                      style: TextStyle(
                        fontSize: 48,
                        color: Colors.teal.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                
                // Card dengan info user
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        _buildInfoRow(
                          icon: Icons.person,
                          label: 'Nama Lengkap',
                          value: userData?['fullName']?.toString() ?? '-',
                        ),
                        const Divider(height: 32),
                        _buildInfoRow(
                          icon: Icons.account_circle,
                          label: 'Username',
                          value: userData?['username']?.toString() ?? '-',
                        ),
                        const Divider(height: 32),
                        _buildInfoRow(
                          icon: Icons.email,
                          label: 'Email',
                          value: userData?['email']?.toString() ?? '-',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                
                // Info card
                Card(
                  color: Colors.teal.shade50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.teal.shade700,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Data ini disimpan secara lokal menggunakan SharedPreferences',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.teal.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.teal.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: Colors.teal.shade700,
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
