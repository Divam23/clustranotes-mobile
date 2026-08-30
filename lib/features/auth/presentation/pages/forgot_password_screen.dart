import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/utils/validators/form_validators.dart';
import 'package:clustranotes_mobile/core/widgets/button/app_back_button.dart';
import 'package:clustranotes_mobile/core/widgets/button/multi_utility_button.dart';
import 'package:clustranotes_mobile/features/auth/presentation/widgets/auth_textfield.dart';
import 'package:clustranotes_mobile/features/auth/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  Future<bool> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return false;
    }
    try {
      await ref
          .read(authNotifierProvider.notifier)
          .forgotPassword(email: _emailController.text.trim());
      return true;
    } catch (error) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authState = ref.watch(authNotifierProvider);
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
              Center(
                child: SvgPicture.asset(
                  "assets/animations/forgot_password.svg",
                  width: 350,
                ),
              ),
              Column(
                spacing: AppSpacing.sm,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Forgot Password?",
                    style: theme.textTheme.displayLarge?.copyWith(fontSize: 25),
                  ),
                  Text(
                    "No worries! Enter your email and we'll send you a link to reset your password.",
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSecondary,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),

              Form(
                key: _formKey,
                child: Column(
                  spacing: AppSpacing.md,
                  children: [
                    AuthTextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      label: "Email",
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) => _submit(),
                      prefixIcon: Icon(
                        AppIcons.email,
                        color: theme.colorScheme.primary,
                      ),
                      hintText: "Enter your email",
                      required: true,
                      enabled: true,
                      validator: (value) => FormValidators.validateEmail(value),
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: MultiUtilityButton(
                            elevation: 1,
                            onPressed:
                              authState.isLoading
                                  ? null
                                  : () async {
                                      final success = await _submit();
                                      if (!context.mounted) return;
                                      if (success) {
                                        context.pushReplacement("/mail-sent");
                                      }
                            },
                            text: "",
                            borderColor: AppColors.transparent,
                            borderRadius: AppRadius.searchBarRounded,
                            buttonColor: authState.isLoading
                                ? AppColors.transparent
                                : theme.colorScheme.primary,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: AppSpacing.lg,
                                horizontal: AppSpacing.lg,
                              ),
                              child: authState.isLoading
                                  ? Row(
                                      spacing: AppSpacing.md,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Sending",
                                          textAlign: TextAlign.center,
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                                color:
                                                    theme.colorScheme.onPrimary,
                                                fontWeight: FontWeight.w600,
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
                                      "Send Reset Link",
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.bodyMedium
                                          ?.copyWith(
                                            color: theme.colorScheme.onPrimary,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                            ),
                          ),
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
    );
  }
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
