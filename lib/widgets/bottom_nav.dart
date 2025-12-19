import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFEAEAEA)),
        ),
      ),
      child: Row(
        children: [
          _NavSection(
            index: 0,
            currentIndex: currentIndex,
            icon: Icons.home,
            label: 'الرئيسية',
            onTap: onTap,
          ),
          _NavSection(
            index: 1,
            currentIndex: currentIndex,
            icon: Icons.tag,
            label: 'السبحة',
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}

class _NavSection extends StatelessWidget {
  final int index;
  final int currentIndex;
  final IconData icon;
  final String label;
  final Function(int) onTap;

  const _NavSection({
    required this.index,
    required this.currentIndex,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = index == currentIndex;
    const Color activeColor = Color(0xFF4DB6AC);

    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        splashColor: activeColor.withOpacity(0.08),
        highlightColor: activeColor.withOpacity(0.05),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 26,
                color: isActive ? activeColor : Colors.grey.shade400,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: isActive ? activeColor : Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
