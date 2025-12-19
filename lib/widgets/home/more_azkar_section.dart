import 'package:flutter/material.dart';
import '../../screens/azkar_page.dart';

class MoreAzkarSection extends StatelessWidget {
  const MoreAzkarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'المزيد من الأدعية',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3E50),
          ),
        ),
        const SizedBox(height: 16),

        _MoreItem(
          title: 'أدعية بعد الصلاة',
          icon: Icons.access_time,
          color: Colors.green,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AzkarPage(
                  title: 'أدعية بعد الصلاة',
                  jsonPath: 'assets/postprayer.json',
                ),
              ),
            );
          },
        ),

        _MoreItem(
          title: 'أذكار النوم',
          icon: Icons.bedtime_outlined,
          color: Colors.purple,
          onTap: () {
            // جاهز لملف JSON جديد 👌
          },
        ),
      ],
    );
  }
}

class _MoreItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _MoreItem({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 30),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
