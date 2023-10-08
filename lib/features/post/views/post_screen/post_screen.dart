import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:moodtree/common/widgets/custom_alert_dialog.dart';
import 'package:moodtree/utils.dart';
import 'package:moodtree/theme.dart';
import 'package:moodtree/constants/sizes.dart';
import 'package:moodtree/constants/gaps.dart';
import 'package:moodtree/features/post/data/emoji_list.dart';
import 'package:moodtree/features/post/models/emoji_model.dart';
import 'package:moodtree/features/post/models/post_model.dart';
import 'package:moodtree/features/post/view_models/post_view_model.dart';
import 'package:moodtree/features/post/views/post_screen/widgets/date_select_button.dart';
import 'package:moodtree/features/post/views/post_screen/widgets/today_rating_section.dart';
import 'package:moodtree/features/post/views/post_screen/widgets/emoji_select_section.dart';
import 'package:moodtree/features/post/views/post_screen/widgets/photo_section.dart';
import 'package:moodtree/features/post/views/post_screen/widgets/write_section.dart';

class PostScreen extends ConsumerStatefulWidget {
  final String? postId;
  final PostModel? post;

  const PostScreen({
    super.key,
    this.postId,
    this.post,
  });

  @override
  ConsumerState<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<PostScreen> {
  late DateTime _date;
  late int _todayRatingIndex;
  late Map<String, List<EmojiModel>> _selectedEmojiList;
  late List<String> _photoUrlList;
  late String _diary;

  @override
  void initState() {
    super.initState();

    _date = widget.post?.date ?? DateTime.now();
    _todayRatingIndex = widget.post?.todayRatingIndex ?? -1;
    _selectedEmojiList = {
      "feelings": widget.post?.feelings ?? [],
      "weather": widget.post?.weather ?? [],
      "meals": widget.post?.meals ?? [],
      "food": widget.post?.food ?? [],
      "people": widget.post?.people ?? [],
      "outing": widget.post?.outing ?? [],
      "activities": widget.post?.activities ?? [],
      "health": widget.post?.health ?? [],
    };
    _photoUrlList = widget.post?.photoUrlList ?? [];
    _diary = widget.post?.diary ?? "";
  }

  void _changeDate(DateTime date) {
    setState(() {
      _date = date;
    });
  }

  void _changeTodayRatingIndex(int index) {
    setState(() {
      _todayRatingIndex = index;
    });
  }

  void _toggleEmoji(String sectionName, EmojiModel toggledEmoji) {
    bool isSelected = _selectedEmojiList[sectionName]!
        .map((emoji) => emoji.label == toggledEmoji.label)
        .contains(true);

    if (isSelected) {
      // Remove emoji from list
      _selectedEmojiList[sectionName] = [
        for (final emoji in _selectedEmojiList[sectionName]!)
          if (emoji.label != toggledEmoji.label) emoji
      ];
    } else {
      // Add emoji to list
      _selectedEmojiList[sectionName] = [
        ..._selectedEmojiList[sectionName]!,
        toggledEmoji
      ];
    }

    setState(() {});
  }

  void _addPhotos(List<String> photoPaths) {
    _photoUrlList = [
      ..._photoUrlList,
      for (final photoPath in photoPaths) photoPath
    ];

    setState(() {});
  }

  void _removePhoto(String photoPathToBeRemoved) {
    _photoUrlList = [
      for (final photoUrl in _photoUrlList)
        if (photoUrl != photoPathToBeRemoved) photoUrl
    ];

    setState(() {});
  }

  void _changeDiary(String diary) {
    setState(() {
      _diary = diary;
    });
  }

  void _submitPost() async {
    if (_todayRatingIndex == -1) {
      showDialog(
        context: context,
        builder: (context) => const CustomAlertDialog(
          text: "오늘 하루 만족도를 선택해주세요.",
        ),
      );
      return;
    }

    final success = await ref.read(postProvider.notifier).submitPost(
          id: widget.postId,
          date: _date,
          todayRatingIndex: _todayRatingIndex,
          feelings: _selectedEmojiList["feelings"]!,
          weather: _selectedEmojiList["weather"]!,
          meals: _selectedEmojiList["meals"]!,
          food: _selectedEmojiList["food"]!,
          people: _selectedEmojiList["people"]!,
          outing: _selectedEmojiList["outing"]!,
          activities: _selectedEmojiList["activities"]!,
          health: _selectedEmojiList["health"]!,
          photoUrlList: _photoUrlList,
          diary: _diary,
        );

    if (success && mounted) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(postProvider);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: DateSelectButton(
            date: _date,
            disabled: widget.postId != null,
            changeDate: _changeDate,
            context: context,
          ),
          leading: IconButton(
            onPressed: () => context.pop(),
            splashRadius: Sizes.size20,
            icon: const FaIcon(
              FontAwesomeIcons.xmark,
              size: Sizes.size16,
              color: ColorThemes.darkgray,
            ),
          ),
        ),
        body: GestureDetector(
          onTap: () => clsoeKeyboard(context),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(
                left: Sizes.size16,
                right: Sizes.size16,
                bottom: Sizes.size16 + Sizes.size48,
              ),
              child: Column(
                children: [
                  TodayRatingSection(
                    title: "오늘 하루 어땠나요?",
                    todayRatingIndex: _todayRatingIndex,
                    changeTodayRatingIndex: _changeTodayRatingIndex,
                  ),
                  Gaps.v10,
                  EmojiSelectSection(
                    title: "감정",
                    sectionName: "feelings",
                    emojiList: feelings,
                    selectedEmojiList: _selectedEmojiList["feelings"]!,
                    toggleEmoji: _toggleEmoji,
                  ),
                  Gaps.v10,
                  EmojiSelectSection(
                    title: "날씨",
                    sectionName: "weather",
                    emojiList: weather,
                    selectedEmojiList: _selectedEmojiList["weather"]!,
                    toggleEmoji: _toggleEmoji,
                  ),
                  Gaps.v10,
                  EmojiSelectSection(
                    title: "식사",
                    sectionName: "meals",
                    emojiList: meals,
                    selectedEmojiList: _selectedEmojiList["meals"]!,
                    toggleEmoji: _toggleEmoji,
                  ),
                  Gaps.v10,
                  EmojiSelectSection(
                    title: "식습관",
                    sectionName: "food",
                    emojiList: food,
                    selectedEmojiList: _selectedEmojiList["food"]!,
                    toggleEmoji: _toggleEmoji,
                  ),
                  Gaps.v10,
                  EmojiSelectSection(
                    title: "사람",
                    sectionName: "people",
                    emojiList: people,
                    selectedEmojiList: _selectedEmojiList["people"]!,
                    toggleEmoji: _toggleEmoji,
                  ),
                  Gaps.v10,
                  EmojiSelectSection(
                    title: "외출",
                    sectionName: "outing",
                    emojiList: outing,
                    selectedEmojiList: _selectedEmojiList["outing"]!,
                    toggleEmoji: _toggleEmoji,
                  ),
                  Gaps.v10,
                  EmojiSelectSection(
                    title: "활동",
                    sectionName: "activities",
                    emojiList: activities,
                    selectedEmojiList: _selectedEmojiList["activities"]!,
                    toggleEmoji: _toggleEmoji,
                  ),
                  Gaps.v10,
                  EmojiSelectSection(
                    title: "신체",
                    sectionName: "health",
                    emojiList: health,
                    selectedEmojiList: _selectedEmojiList["health"]!,
                    toggleEmoji: _toggleEmoji,
                  ),
                  Gaps.v10,
                  PhotoSection(
                    title: "오늘의 사진",
                    photoUrlList: _photoUrlList,
                    addPhotos: _addPhotos,
                    removePhoto: _removePhoto,
                  ),
                  Gaps.v10,
                  WriteSection(
                    title: "오늘의 일기",
                    diary: _diary,
                    changeDiary: _changeDiary,
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: Container(
          width: double.infinity,
          height: Sizes.size48,
          color: ColorThemes.primary,
          child: GestureDetector(
            onTap: state.isLoading ? null : _submitPost,
            behavior: HitTestBehavior.translucent,
            child: Center(
              child: state.isLoading
                  ? const Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: Sizes.size16,
                          height: Sizes.size16,
                          child: CircularProgressIndicator(
                            color: ColorThemes.white,
                            strokeWidth: Sizes.size2,
                          ),
                        ),
                        Gaps.h10,
                        Text(
                          "처리중",
                          style: TextStyle(
                            fontSize: Sizes.size16,
                            color: ColorThemes.white,
                          ),
                        )
                      ],
                    )
                  : Text(
                      widget.post == null ? "등록" : "수정",
                      style: const TextStyle(
                        fontSize: Sizes.size16,
                        color: ColorThemes.white,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
