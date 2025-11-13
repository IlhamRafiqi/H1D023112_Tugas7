import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/storage_service.dart';
import 'providers/auth_provider.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';

/// Entry point aplikasi
void main() async {
  // Pastikan Flutter binding terinisialisasi
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inisialisasi Storage Service
  await StorageService().init();
  
  // Jalankan aplikasi
  runApp(const MyApp());
}

/// Widget utama aplikasi
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          return MaterialApp(
            title: 'Flutter Sederhana',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.teal,
              useMaterial3: true,
            ),
            // Check apakah user sudah login
            home: authProvider.isLoggedIn ? const HomePage() : const LoginPage(),
          );
        },
      ),
    );
  }
}
