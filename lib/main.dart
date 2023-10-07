import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:moodtree/firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:moodtree/riverpod_provider_observer.dart';
import 'package:moodtree/router.dart';
import 'package:moodtree/theme.dart';
import 'package:moodtree/constants/sizes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ProviderScope(
      observers: [Logger()],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: "Mood Tree",
      debugShowCheckedModeBanner: false,
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
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: "seed",
              bodyColor: ColorThemes.black,
            ),
        scaffoldBackgroundColor: ColorThemes.appBackground,
        appBarTheme: const AppBarTheme(
            elevation: 0,
            centerTitle: true,
            backgroundColor: ColorThemes.appBackground,
            titleTextStyle: TextStyle(
              fontFamily: "seed",
              color: ColorThemes.darkgray,
            )),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          foregroundColor: ColorThemes.primary,
        )),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: ColorThemes.primary,
          selectionColor: ColorThemes.lightgray,
          selectionHandleColor: ColorThemes.primary,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
            fontSize: Sizes.size14,
            color: ColorThemes.gray,
          ),
          suffixIconColor: ColorThemes.gray,
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
