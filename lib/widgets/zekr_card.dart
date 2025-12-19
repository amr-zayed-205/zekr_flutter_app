import 'package:flutter/material.dart';
import '../models/zekr_model.dart';
import '../core/app_colors.dart';

class ZekrCard extends StatelessWidget {
  final Zekr zekr;
  final VoidCallback onTap;

  const ZekrCard({
    super.key,
    required this.zekr,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final completed = zekr.current >= zekr.repeat;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: completed ? 0.9 : 1.0, // 👈 اختفاء 10% فقط
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: completed
                  ? AppColors.primary.withOpacity(0.6)
                  : Colors.transparent,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 12,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // نص الذكر
              Text(
                zekr.text,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 18,
                  height: 1.8,
                ),
              ),

              // الفضل / الثواب
              if (zekr.bless.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(
                  zekr.bless,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: AppColors.primary.withOpacity(0.85),
                    fontSize: 14,
                  ),
                ),
              ],

              const SizedBox(height: 16),

              // العداد + الأيقونة
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    completed ? Icons.check_circle : Icons.touch_app,
                    color: completed
                        ? AppColors.primary
                        : Colors.grey.shade400,
                  ),
                  Text(
                    '${zekr.remaining} / ${zekr.repeat}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
