import 'package:flutter/material.dart';

import 'jobs_screen.dart';
import 'product_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Is Bulma Projesi - Ana Sayfa')),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEAF3FF), Color(0xFFC8E1FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xFFD6E8FF),
                    child: Icon(Icons.storefront_outlined),
                  ),
                  title: const Text('Mini Katalog'),
                  subtitle: const Text('GridView ile urun listeleme'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () => Navigator.pushNamed(
                    context,
                    ProductListScreen.routeName,
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xFFD6E8FF),
                    child: Icon(Icons.work_outline),
                  ),
                  title: const Text('Is Ilanlari (API)'),
                  subtitle: const Text('Canli API verisi ile listeleme'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () =>
                      Navigator.pushNamed(context, JobsScreen.routeName),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.86),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Text(
                  'Egitim Ciktilari:\n'
                  '- Navigator ve route arguments\n'
                  '- GridView kart tasarimi\n'
                  '- Basit state guncelleme (sepet)\n'
                  '- JSON asset yonetimi',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
