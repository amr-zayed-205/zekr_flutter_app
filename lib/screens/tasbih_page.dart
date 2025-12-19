import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/app_colors.dart';

class TasbihPage extends StatefulWidget {
  const TasbihPage({super.key});

  @override
  State<TasbihPage> createState() => _TasbihPageState();
}

class _TasbihPageState extends State<TasbihPage> {
  int tasbihCount = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTasbih();
  }

  Future<void> _loadTasbih() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      tasbihCount = prefs.getInt('tasbih_count') ?? 0;
      isLoading = false;
    });
  }

  Future<void> _increment() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      tasbihCount++;
    });
    await prefs.setInt('tasbih_count', tasbihCount);
  }

  Future<void> _reset() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      tasbihCount = 0;
    });
    await prefs.remove('tasbih_count');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        const Spacer(),
                        const Text(
                          'السبحة الإلكترونية',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.refresh),
                          color: AppColors.primary,
                          onPressed: _reset,
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  // Counter Circle
                  Container(
                    width: 220,
                    height: 220,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primary.withOpacity(0.2),
                        width: 12,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      tasbihCount.toString(),
                      style: const TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Tap Button
                  GestureDetector(
                    onTap: _increment,
                    child: Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            AppColors.primary,
                            AppColors.primary.withOpacity(0.85),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.3),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'اضغط',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const Spacer(flex: 2),
                ],
              ),
      ),
    );
  }
}
