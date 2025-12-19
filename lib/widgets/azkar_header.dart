import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class AzkarHeader extends StatelessWidget {
  final String title;
  final double progress;
  final VoidCallback onReset;

  const AzkarHeader({
    super.key,
    required this.title,
    required this.progress,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          // ===== Header Row =====
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () => Navigator.pop(context),
              ),
              const Spacer(),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.refresh),
                color: AppColors.primary,
                onPressed: onReset,
              ),
            ],
          ),

          const SizedBox(height: 14),

          // ===== Smooth Progress Bar =====
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: progress),
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            builder: (context, value, _) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: value,
                  backgroundColor: Colors.grey.shade200,
                  color: AppColors.primary,
                  minHeight: 6,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
