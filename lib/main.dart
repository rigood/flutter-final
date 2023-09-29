import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:moodtree/firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:moodtree/router.dart';
import 'package:moodtree/theme.dart';
import 'package:moodtree/constants/sizes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: "Mood Tree",
      routerConfig: ref.watch(routerProvider),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko', 'KR'),
      ],
      locale: const Locale('ko'),
      theme: ThemeData(
        fontFamily: "seed",
        scaffoldBackgroundColor: ColorThemes.appBackground,
        appBarTheme: const AppBarTheme(
            elevation: 0,
            centerTitle: true,
            backgroundColor: ColorThemes.appBackground,
            titleTextStyle: TextStyle(
              fontFamily: "seed",
              fontSize: Sizes.size14,
              color: ColorThemes.darkgray,
            )),
        textTheme: const TextTheme().apply(
          bodyColor: ColorThemes.black,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: ColorThemes.gray,
          selectionColor: ColorThemes.lightgray,
          selectionHandleColor: ColorThemes.primary,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
            fontSize: Sizes.size14,
            color: ColorThemes.gray,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorThemes.lightgray,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorThemes.lightgray,
            ),
          ),
          suffixIconColor: ColorThemes.gray,
          errorStyle: TextStyle(
            color: ColorThemes.primary,
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorThemes.primary,
            ),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorThemes.primary,
            ),
          ),
        ),
      ),
    );
  }
}
