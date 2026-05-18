import 'package:flutter/material.dart';

import 'models/product.dart';
import 'screens/home_screen.dart';
import 'screens/jobs_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/product_list_screen.dart';

void main() {
  runApp(const JobCatalogApp());
}

class JobCatalogApp extends StatelessWidget {
  const JobCatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    const baseBlue = Color(0xFF1565C0);
    return MaterialApp(
      title: 'Is Bulma Mini Katalog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: baseBlue,
          primary: baseBlue,
          secondary: const Color(0xFF42A5F5),
          surface: const Color(0xFFEFF5FF),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFEAF3FF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1565C0),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
        cardTheme: const CardThemeData(
          margin: EdgeInsets.all(8),
          elevation: 3,
          surfaceTintColor: Color(0xFF90CAF9),
          shadowColor: Color(0x334285F4),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFF1E88E5),
            foregroundColor: Colors.white,
          ),
        ),
        chipTheme: ChipThemeData(
          backgroundColor: const Color(0xFFD6E8FF),
          selectedColor: const Color(0xFF90CAF9),
          labelStyle: const TextStyle(
            color: Color(0xFF0B3C75),
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        ProductListScreen.routeName: (context) => const ProductListScreen(),
        JobsScreen.routeName: (context) => const JobsScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == ProductDetailScreen.routeName) {
          final product = settings.arguments as Product;
          return MaterialPageRoute<void>(
            builder: (context) => ProductDetailScreen(product: product),
          );
        }
        return null;
      },
    );
  }
}
