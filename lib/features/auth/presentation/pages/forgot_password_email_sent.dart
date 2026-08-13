import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/widgets/button/multi_utility_button.dart';
import 'package:clustranotes_mobile/features/auth/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPasswordEmailSent extends StatelessWidget {
  const ForgotPasswordEmailSent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.screenPadding,
                      vertical: AppSpacing.md,
                    ),
                    child: Column(
                      spacing: AppSpacing.lg,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/animations/undraw_mail_sent.svg",
                          width: 240,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Check your email ✅",
                              style: theme.textTheme.headlineLarge?.copyWith(
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            Text(
                              "If an account exists for your specified email, we've sent a password reset link.",
                              textAlign: TextAlign.center,
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: theme.colorScheme.onSecondary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.xl,),
                        Row(
                          children: [
                            Expanded(
                              child: MultiUtilityButton(
                                elevation: 1,
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context)=> const LoginScreen())
                                  );
                                },
                                text: "",
                                borderColor: AppColors.transparent,
                                borderRadius: AppRadius.searchBarRounded,
                                buttonColor: theme.colorScheme.primary,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: AppSpacing.md,
                                    horizontal: AppSpacing.lg,
                                  ),
                                  child: Text(
                                    "Back to Login",
                                    textAlign: TextAlign.center,
                                    style: theme.textTheme.bodyMedium?.copyWith(
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
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
