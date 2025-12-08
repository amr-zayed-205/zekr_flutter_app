import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class MassaScreen extends StatefulWidget {
  @override
  _MassaScreenState createState() => _MassaScreenState();
}

class _MassaScreenState extends State<MassaScreen> {
  List<dynamic> _azkar = [];
  int _currentIndex = 0;
  int _currentRepeat = 1;

  @override
  void initState() {
    super.initState();
    _loadAzkar();
  }

  Future<void> _loadAzkar() async {
    String jsonString = await rootBundle.loadString('assets/massa.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    setState(() {
      _azkar = jsonData['content'];
      _currentRepeat = _azkar.isNotEmpty ? _azkar[0]['repeat'] : 1;
    });
  }

  void _nextZekr() {
    if (_currentIndex < _azkar.length - 1) {
      setState(() {
        _currentIndex++;
        _currentRepeat = _azkar[_currentIndex]['repeat'];
      });
    }
  }

  void _prevZekr() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _currentRepeat = _azkar[_currentIndex]['repeat'];
      });
    }
  }

  void _decreaseCounter() {
    if (_currentRepeat > 0) {
      setState(() {
        _currentRepeat--;
        if (_currentRepeat == 0 && _currentIndex < _azkar.length - 1) {
          _nextZekr();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_azkar.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('أذكار المساء'),
          backgroundColor: Colors.indigo,
          elevation: 10,
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'أذكار المساء',
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
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.teal.shade50, Colors.white],
              ),
            ),
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _azkar[_currentIndex]['zekr'],
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal.shade900,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                          Text(
                            _azkar[_currentIndex]['bless'],
                            style: TextStyle(
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                              color: Colors.teal.shade700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: _currentRepeat > 0 ? _decreaseCounter : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              '$_currentRepeat',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.white.withOpacity(0.8),
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentIndex > 0)
                    IconButton(
                      icon: Icon(Icons.arrow_back, size: 32, color: Colors.teal),
                      onPressed: _prevZekr,
                    ),
                  if (_currentIndex < _azkar.length - 1)
                    IconButton(
                      icon: Icon(Icons.arrow_forward, size: 32, color: Colors.teal),
                      onPressed: _nextZekr,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}