import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:moodtree/features/post/models/post_model.dart';
import 'package:moodtree/features/post/repos/posts_repository.dart';
import 'package:moodtree/theme.dart';
import 'package:moodtree/constants/sizes.dart';
import 'package:moodtree/constants/gaps.dart';
import 'package:moodtree/features/post/views/home_screen/widgets/no_post.dart';
import 'package:moodtree/features/post/views/home_screen/widgets/post_count.dart';
import 'package:moodtree/features/post/views/home_screen/widgets/post_item.dart';
import 'package:moodtree/common/widgets/appbar_title.dart';
import 'package:moodtree/common/widgets/loading_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DateTime _now = DateTime.now();

  late final List<DateTime> _monthsFilter = [
    DateTime(_now.year, _now.month - 2),
    DateTime(_now.year, _now.month - 1),
    DateTime(_now.year, _now.month),
  ];

  late DateTime _selectedMonth = _monthsFilter.last;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AppBarTitle(),
            DropdownButton(
              underline: const SizedBox(),
              elevation: 1,
              value: _selectedMonth,
              items: _monthsFilter.map((month) {
                return DropdownMenuItem(
                  alignment: Alignment.center,
                  value: month,
                  child: Text(
                    DateFormat("yyyy년 M월").format(month),
                    style: const TextStyle(
                      fontSize: Sizes.size12,
                      color: ColorThemes.darkgray,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (month) {
                setState(() {
                  _selectedMonth = month!;
                });
              },
            ),
          ],
        ),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final postsStream = ref.watch(postsStreamProvider);
          return postsStream.when(
            skipLoadingOnReload: true,
            loading: () => const Center(
              child: LoadingIndicator(),
            ),
            error: (error, stackTrace) => Center(
                child: Text(
              "$error",
              textAlign: TextAlign.center,
            )),
            data: (data) {
              final List<PostModel> filteredData = data
                  .where((item) =>
                      item.date.year == _selectedMonth.year &&
                      item.date.month == _selectedMonth.month)
                  .toList();
              if (filteredData.isEmpty) {
                return const NoPost();
              }
              return Padding(
                padding: const EdgeInsets.only(
                  left: Sizes.size16,
                  right: Sizes.size16,
                  bottom: Sizes.size24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PostCount(count: filteredData.length),
                    Expanded(
                      child: ListView.separated(
                        itemCount: filteredData.length,
                        itemBuilder: (context, idx) {
                          return PostItem(
                            key: Key('post-${filteredData[idx].updatedAt}}'),
                            post: filteredData[idx],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Gaps.v10;
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
