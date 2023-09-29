class EmojiModel {
  final String emoji;
  final String label;

  EmojiModel({
    required this.emoji,
    required this.label,
  });

  EmojiModel.fromJson(Map<String, dynamic> json)
      : emoji = json['emoji'],
        label = json['label'];

  Map<String, dynamic> toJson() {
    return {
      "emoji": emoji,
      "label": label,
    };
  }
}
