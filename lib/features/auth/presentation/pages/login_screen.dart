import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/utils/validators/form_validators.dart';
import 'package:clustranotes_mobile/core/widgets/button/app_back_button.dart';
import 'package:clustranotes_mobile/core/widgets/button/multi_utility_button.dart';
import 'package:clustranotes_mobile/features/auth/presentation/pages/forgot_password_screen.dart';
import 'package:clustranotes_mobile/features/auth/presentation/pages/signup_screen.dart';
import 'package:clustranotes_mobile/features/auth/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clustranotes_mobile/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  

  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }


  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    ref
        .read(authNotifierProvider.notifier)
        .signIn(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authNotifierProvider, (previous, next) {
      if (next.error != null && next.error != previous?.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error!)),
          snackBarAnimationStyle: AnimationStyle(
            duration: const Duration(milliseconds: 500),
          ),
        );
      }
    });
    final authState = ref.watch(authNotifierProvider);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(leading: const AppBackButton()),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenPadding,
            vertical: AppSpacing.md,
          ),
          child: Column(
            spacing: AppSpacing.xxl,
            children: [
              Column(
                spacing: AppSpacing.xs,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Welcome back, 👋🏼",
                    style: theme.textTheme.displayLarge?.copyWith(fontSize: 25),
                  ),
                  Text(
                    "Login to continue to ClustraNotes.",
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.onSecondary,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(
                "assets/animations/login_storyset.svg",
                width: 240,
              ),
              Form(
                key: _formKey,
                child: Column(
                  spacing: AppSpacing.lg,
                  children: [
                    Column(
                      spacing: AppSpacing.md,
                      children: [
                        AuthTextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          label: "Email",
                          textInputAction: TextInputAction.next,
                          prefixIcon: Icon(
                            AppIcons.email,
                            color: theme.colorScheme.primary,
                          ),
                          hintText: "batman@gothamcity.com",
                          required: true,
                          enabled: true,
                          validator: (value) =>
                              FormValidators.validateEmail(value),
                        ),

                        Column(
                          spacing: AppSpacing.sm,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            AuthTextField(
                              keyboardType: TextInputType.visiblePassword,
                              controller: _passwordController,
                              label: "Password",
                              textInputAction: TextInputAction.done,
                              onSubmitted: (_) => _submit(),
                              prefixIcon: Icon(
                                AppIcons.lock,
                                color: theme.colorScheme.primary,
                              ),
                              obscureText: _obscurePassword,
                              suffixIcon: IconButton(
                                onPressed: _togglePasswordVisibility,
                                icon: _obscurePassword
                                    ? Icon(AppIcons.visible)
                                    : Icon(AppIcons.notVisible),
                              ),
                              hintText: "iambatman@2747___",
                              required: true,
                              enabled: true,
                              validator: (value) =>
                                  FormValidators.validatePassword(value),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)=> const ForgotPasswordScreen())
                                );
                              },
                              child: Text("Forgot password?"),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.screenPadding,
          vertical: AppSpacing.xl,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: AppSpacing.md,
          children: [
            Row(
              children: [
                Expanded(
                  child: MultiUtilityButton(
                    elevation: 1,
                    onPressed: () {
                      authState.isLoading ? null : _submit();
                    },
                    text: "",
                    borderColor: AppColors.transparent,
                    borderRadius: AppRadius.searchBarRounded,
                    buttonColor: authState.isLoading
                        ? AppColors.transparent
                        : theme.colorScheme.primary,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSpacing.md,
                        horizontal: AppSpacing.lg,
                      ),
                      child: authState.isLoading
                          ? Row(
                        spacing: AppSpacing.md,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Signing In",
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onPrimary,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          ),
                        ],
                      )
                          : Text(
                        "Sign In",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onPrimary,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  spacing: AppSpacing.sm,
                  children: [
                    Text(
                      "New to ClustraNotes?",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: theme.disabledColor
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Start Here",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: theme.colorScheme.primary
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
