import 'package:flutter/material.dart';
import 'massa.dart';
import 'sabah.dart';
import 'postprayer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'أدعية المسلم',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 10,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.teal.shade50, Colors.white],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DuaCard(
                title: 'أذكار الصباح',
                page: SabahPage(),
                icon: Icons.wb_sunny,
                color: Colors.orange,
              ),
              DuaCard(
                title: 'أذكار المساء',
                page: MassaScreen(),
                icon: Icons.nightlight_round,
                color: Colors.indigo,
              ),
              DuaCard(
                title: 'أدعية بعد الصلاة',
                page: PostPrayerPage(),
                icon: Icons.access_time_filled,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DuaCard extends StatelessWidget {
  final String title;
  final Widget page;
  final IconData icon;
  final Color color;

  DuaCard({
    required this.title,
    required this.page,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      elevation: 5, // إضافة ظل للبطاقة
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // زوايا مدورة
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => page));
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 40,
                color: color,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}