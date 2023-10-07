class EmojiModel {
  final String emoji;
  final String label;

  EmojiModel({
    required this.emoji,
    required this.label,
  });

  EmojiModel.fromJson(Map<String, dynamic> json)
      : emoji = json['emoji'] as String,
        label = json['label'] as String;

  Map<String, dynamic> toJson() {
    return {
      "emoji": emoji,
      "label": label,
    };
  }
}
