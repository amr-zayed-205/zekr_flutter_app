class Zekr {
  final String text;
  final int repeat;
  final String bless;
  int current;

  Zekr({
    required this.text,
    required this.repeat,
    required this.bless,
    this.current = 0,
  });

  /// إنشاء ذكر من JSON (من ملف assets)
  factory Zekr.fromJson(
    Map<String, dynamic> json, {
    int current = 0,
  }) {
    return Zekr(
      text: json['zekr'] as String,
      repeat: json['repeat'] as int,
      bless: json['bless'] ?? '',
      current: current,
    );
  }

  /// نسخة جديدة مع تعديل بعض القيم (مفيد مستقبلاً)
  Zekr copyWith({
    String? text,
    int? repeat,
    String? bless,
    int? current,
  }) {
    return Zekr(
      text: text ?? this.text,
      repeat: repeat ?? this.repeat,
      bless: bless ?? this.bless,
      current: current ?? this.current,
    );
  }

  /// هل الذكر اكتمل
  bool get isDone => current >= repeat;

  /// المتبقي
  int get remaining => (repeat - current).clamp(0, repeat);
}
