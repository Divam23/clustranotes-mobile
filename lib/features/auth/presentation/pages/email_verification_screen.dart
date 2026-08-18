import 'package:clustranotes_mobile/core/utils/formatters/formatter.dart';
import 'package:clustranotes_mobile/core/widgets/button/app_back_button.dart';
import 'package:clustranotes_mobile/core/widgets/button/multi_utility_button.dart';
import 'package:clustranotes_mobile/features/auth/domain/enum/auth_action_enum.dart';
import 'package:clustranotes_mobile/features/auth/providers/auth_providers.dart';
import 'package:clustranotes_mobile/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class EmailVerificationScreen extends ConsumerWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final authProvider = ref.watch(authNotifierProvider);
    final authNotifier = ref.read(authNotifierProvider.notifier);
    final isResending = authProvider.isLoading && authProvider.loadingAction == AuthAction.resendVerification;
    final timer = authProvider.verificationResendCooldown;
    final canResend = timer == 0 && !authProvider.isLoading;
    final email = authProvider.user?.email ?? "your email.";
    return Scaffold(
      appBar: AppBar(leading: const AppBackButton()),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.screenPadding,
                    vertical: AppSpacing.md,
                  ),
                  child: Column(
                    spacing: AppSpacing.lg,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/animations/undraw_email_verification_link.svg",
                        width: 240,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Verify your email",
                            textAlign: TextAlign.center,
                            style: theme.textTheme.headlineLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          const SizedBox(height: AppSpacing.sm),

                          Text(
                            "We've sent a verification link to",
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),

                          const SizedBox(height: AppSpacing.xs),

                          Text(
                            email,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: theme.colorScheme.primary,
                            ),
                          ),

                          const SizedBox(height: AppSpacing.md),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.md,
                            ),
                            child: Text(
                              "Please check your inbox and click the link to verify your email address.",
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Card(
                        elevation: 0,
                        color: theme.colorScheme.primary.withValues(
                          alpha: 0.12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: AppRadius.card,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(AppSpacing.md),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: AppSpacing.md,
                            children: [
                              Icon(
                                AppIcons.info,
                                color: AppColors.primarySky,
                                size: 24,
                              ),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: AppSpacing.xs,
                                  children: [
                                    Text(
                                      "Didn't receive the email?",
                                      style: theme.textTheme.labelLarge,
                                    ),
                                    Text(
                                      "Check your spam folder or resend the verification email.",
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                            color: theme
                                                .colorScheme
                                                .onSurfaceVariant,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        spacing: AppSpacing.md,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: MultiUtilityButton(
                                  elevation: 1,
                                  onPressed: canResend
                                      ? () async {
                                          await authNotifier
                                              .resendEmailVerificationLink();
                                        }
                                      : null,
                                  text: "",
                                  borderColor: AppColors.transparent,
                                  borderRadius: AppRadius.searchBarRounded,
                                  buttonColor: theme.colorScheme.primary,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: AppSpacing.lg,
                                      horizontal: AppSpacing.lg,
                                    ),
                                    child: isResending
                                        ? Row(
                                            spacing: AppSpacing.md,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const SizedBox(
                                                width: 16,
                                                height: 16,
                                                child:
                                                    CircularProgressIndicator(
                                                      strokeWidth: 2,
                                                    ),
                                              ),
                                              Text(
                                                "Sending",
                                                textAlign: TextAlign.center,
                                                style: theme
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                      color: theme
                                                          .colorScheme
                                                          .onPrimary,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                            ],
                                          )
                                        : timer > 0
                                        ? Text(
                                            "Resend in ${NumberFormatter.labelWithCount(count: timer, singularLabel: "second", pluralLabel: "seconds")}",
                                            textAlign: TextAlign.center,
                                            style: theme.textTheme.bodyMedium
                                                ?.copyWith(
                                                  color: theme
                                                      .colorScheme
                                                      .onPrimary,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            spacing: AppSpacing.xs,
                                            children: [
                                              Icon(
                                                AppIcons.refresh,
                                                color:
                                                    theme.colorScheme.onPrimary,
                                                size: 20,
                                              ),
                                              Text(
                                                "Resend Email",
                                                textAlign: TextAlign.center,
                                                style: theme
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                      color: theme
                                                          .colorScheme
                                                          .onPrimary,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                            ],
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: MultiUtilityButton(
                                  elevation: 1,
                                  onPressed:
                                      authProvider.isLoading &&
                                          authProvider.loadingAction ==
                                              AuthAction.checkVerification
                                      ? null
                                      : () async {
                                          final verified = await authNotifier
                                              .checkEmailVerification();
                                          if (context.mounted && verified) {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const HomeScreen(),
                                              ),
                                            );
                                          }
                                        },
                                  text: "",
                                  borderColor: theme.disabledColor.withValues(
                                    alpha: 0.1,
                                  ),
                                  borderRadius: AppRadius.searchBarRounded,
                                  buttonColor: theme.colorScheme.onPrimary,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: AppSpacing.lg,
                                      horizontal: AppSpacing.lg,
                                    ),
                                    child: Text(
                                      "I've Verified, Continue",
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.bodyMedium
                                          ?.copyWith(
                                            color: theme.colorScheme.scrim,
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
                    ],
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
