import 'package:flutter/material.dart';
import '../../screens/azkar_page.dart';

class MainAzkarRow extends StatelessWidget {
  const MainAzkarRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _AzkarCard(
          title: 'أذكار الصباح',
          icon: Icons.wb_sunny_outlined,
          color: Colors.orange,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AzkarPage(
                  title: 'أذكار الصباح',
                  jsonPath: 'assets/sabah.json',
                ),
              ),
            );
          },
        ),
        const SizedBox(width: 16),
        _AzkarCard(
          title: 'أذكار المساء',
          icon: Icons.nightlight_round,
          color: Colors.indigo,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AzkarPage(
                  title: 'أذكار المساء',
                  jsonPath: 'assets/massa.json',
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _AzkarCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _AzkarCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 140,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(28),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
