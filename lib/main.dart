import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_final/firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_final/router.dart';
import 'package:flutter_final/theme.dart';
import 'package:flutter_final/constants/sizes.dart';

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
      routerConfig: ref.watch(routerProvider),
      title: "App",
      theme: ThemeData(
        scaffoldBackgroundColor: ColorThemes.appBackground,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: ColorThemes.gray,
          selectionColor: ColorThemes.primary,
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
              color: ColorThemes.primarygray,
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
