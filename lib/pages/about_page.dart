import 'package:flutter/material.dart';

/// Halaman About
/// Informasi tentang aplikasi
class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              
              // App Icon
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.teal.withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.flutter_dash,
                  size: 80,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              
              // App Name
              const Text(
                'Flutter Sederhana',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 8),
              
              // Version
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Version 1.0.0',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.teal,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              
              // Description Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: Colors.teal.shade700,
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'Tentang Aplikasi',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Aplikasi Flutter sederhana dengan fitur autentikasi dan manajemen profil pengguna. '
                        'Dibangun menggunakan Flutter framework dengan state management Provider dan '
                        'local storage menggunakan SharedPreferences.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Features Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.stars,
                            color: Colors.teal.shade700,
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'Fitur Utama',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildFeatureItem(
                        Icons.person_add,
                        'Registrasi Akun',
                        'Buat akun baru dengan mudah',
                      ),
                      _buildFeatureItem(
                        Icons.login,
                        'Login & Autentikasi',
                        'Login dengan akun yang terdaftar',
                      ),
                      _buildFeatureItem(
                        Icons.save,
                        'Local Storage',
                        'Data tersimpan di device',
                      ),
                      _buildFeatureItem(
                        Icons.person,
                        'Manajemen Profil',
                        'Lihat dan kelola profil Anda',
                      ),
                      _buildFeatureItem(
                        Icons.settings,
                        'Pengaturan',
                        'Kustomisasi aplikasi',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Tech Stack Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.code,
                            color: Colors.teal.shade700,
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'Teknologi',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildTechItem('Flutter SDK', '3.35.7'),
                      _buildTechItem('Dart', '3.9.2'),
                      _buildTechItem('Provider', '^6.1.1'),
                      _buildTechItem('SharedPreferences', '^2.2.2'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Developer Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.teal.shade100,
                        child: Icon(
                          Icons.school,
                          size: 40,
                          color: Colors.teal.shade700,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'H1D023112',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Tugas 7 - Flutter App',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        children: [
                          Chip(
                            avatar: const Icon(Icons.calendar_today, size: 16),
                            label: const Text('2025'),
                            backgroundColor: Colors.teal.shade50,
                          ),
                          Chip(
                            avatar: const Icon(Icons.location_on, size: 16),
                            label: const Text('Indonesia'),
                            backgroundColor: Colors.teal.shade50,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              
              // Copyright
              Text(
                '© 2025 Flutter Sederhana',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade500,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Made with ❤️ using Flutter',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: 20,
              color: Colors.teal.shade700,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTechItem(String name, String version) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              version,
              style: TextStyle(
                fontSize: 12,
                color: Colors.teal.shade700,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
