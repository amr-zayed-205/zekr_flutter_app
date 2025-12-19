import 'package:flutter/material.dart';
import '../models/zekr_model.dart';
import '../services/azkar_service.dart';
import '../widgets/zekr_card.dart';
import '../widgets/azkar_header.dart';

class AzkarPage extends StatefulWidget {
  final String title;
  final String jsonPath;

  const AzkarPage({
    super.key,
    required this.title,
    required this.jsonPath,
  });

  @override
  State<AzkarPage> createState() => _AzkarPageState();
}

class _AzkarPageState extends State<AzkarPage> {
  List<Zekr> azkar = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAzkar();
  }

  Future<void> _loadAzkar() async {
    final result = await AzkarService.loadAzkar(widget.jsonPath);
    setState(() {
      azkar = result;
      isLoading = false;
    });
  }

  Future<void> _onZekrTap(int index) async {
    final zekr = azkar[index];

    if (zekr.current < zekr.repeat) {
      setState(() {
        zekr.current++;
      });

      // حفظ آخر حالة
      await AzkarService.saveZekr(
        widget.jsonPath,
        index,
        zekr.current,
      );
    }
  }

  Future<void> _reset() async {
    await AzkarService.reset(widget.jsonPath, azkar.length);

    setState(() {
      for (var z in azkar) {
        z.current = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final completed =
        azkar.where((z) => z.current >= z.repeat).length;

    final progress =
        azkar.isEmpty ? 0.0 : completed / azkar.length;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AzkarHeader(
              title: widget.title,
              progress: progress,
              onReset: _reset,
            ),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      padding: const EdgeInsets.all(20),
                      itemCount: azkar.length,
                      itemBuilder: (context, index) {
                        return ZekrCard(
                          zekr: azkar[index],
                          onTap: () => _onZekrTap(index),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
