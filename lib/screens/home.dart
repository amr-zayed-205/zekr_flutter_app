import 'package:flutter/material.dart';
import '../widgets/home/greeting_section.dart';
import '../widgets/home/prayer_card.dart';
import '../widgets/home/main_azkar_row.dart';
import '../widgets/home/more_azkar_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              GreetingSection(),
              SizedBox(height: 20),
              PrayerCard(),
              SizedBox(height: 30),
              MainAzkarRow(),
              SizedBox(height: 30),
              MoreAzkarSection(),
            ],
          ),
        ),
      ),
    );
  }
}
