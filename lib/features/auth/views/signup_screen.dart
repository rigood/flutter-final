import 'package:flutter/material.dart';
import 'package:flutter_final/features/auth/views/widgets/auth_link.dart';
import 'package:flutter_final/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_final/features/auth/view_models/signup_view_model.dart';
import 'package:flutter_final/utils.dart';
import 'package:flutter_final/features/auth/views/signin_screen.dart';
import 'package:flutter_final/constants/gaps.dart';
import 'package:flutter_final/constants/sizes.dart';
import 'package:flutter_final/common/widgets/expanded_text.dart';
import 'package:flutter_final/common/widgets/input_suffix.dart';
import 'package:flutter_final/features/auth/views/widgets/auth_submit_button.dart';
import 'package:flutter_final/features/auth/views/widgets/auth_error_message.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static const routeURL = "/";
  static const routeName = "signUp";

  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _email = "";
  String _password = "";

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();

    super.dispose();
  }

  String? _validateEmail(email) {
    if (email.isEmpty) {
      return "이메일 주소를 입력해주세요.";
    }

    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (!regExp.hasMatch(email)) {
      return "올바른 이메일 주소를 입력해주세요.";
    }

    return null;
  }

  String? _validatePassword(password) {
    if (password.isEmpty) {
      return "비밀번호를 입력해주세요.";
    }

    if (password.length < 6) {
      return "비밀번호를 6자 이상 입력해주세요.";
    }

    return null;
  }

  bool _isFormValid() {
    return _validateEmail(_email) == null &&
        _validatePassword(_password) == null;
  }

  void _onSubmit() async {
    if (!_isFormValid()) return;

    await ref.read(signUpProvider.notifier).signUp(_email, _password);

    if (!ref.read(signUpProvider).hasError && context.mounted) {
      context.goNamed(SignInScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => clsoeKeyboard(context),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: Sizes.size96 + Sizes.size80,
                  left: Sizes.size32,
                  right: Sizes.size32,
                ),
                child: Column(
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ExpandedText(
                          text: "가입하기",
                          textStyle: TextThemes.authTitle,
                        ),
                      ],
                    ),
                    Gaps.v4,
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                            focusNode: _emailFocusNode,
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: "이메일",
                              suffixIcon: _email.isNotEmpty &&
                                      _emailFocusNode.hasFocus
                                  ? InputSuffix(
                                      icon: FontAwesomeIcons.solidCircleXmark,
                                      onTap: _emailController.clear,
                                    )
                                  : null,
                            ),
                            validator: _validateEmail,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                          TextFormField(
                            focusNode: _passwordFocusNode,
                            controller: _passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) => _onSubmit(),
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "비밀번호",
                              suffixIcon: _password.isNotEmpty &&
                                      _passwordFocusNode.hasFocus
                                  ? InputSuffix(
                                      icon: FontAwesomeIcons.solidCircleXmark,
                                      onTap: _passwordController.clear,
                                    )
                                  : null,
                            ),
                            validator: _validatePassword,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                          Gaps.v20,
                          AuthSubmitButton(
                            text: "가입",
                            onTap: _onSubmit,
                            isActive: _isFormValid() &&
                                !ref.watch(signUpProvider).isLoading,
                          ),
                        ],
                      ),
                    ),
                    if (ref.watch(signUpProvider).hasError)
                      AuthErrorMessage(
                        error: ref.watch(signUpProvider).error,
                      ),
                  ],
                ),
              ),
              const Positioned(
                bottom: -20,
                right: -30,
                child: Image(
                  image: AssetImage(
                    "assets/images/bee.png",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
