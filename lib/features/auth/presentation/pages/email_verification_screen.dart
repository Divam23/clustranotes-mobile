import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/utils/formatters/formatter.dart';
import 'package:clustranotes_mobile/core/widgets/button/app_back_button.dart';
import 'package:clustranotes_mobile/core/widgets/button/multi_utility_button.dart';
import 'package:clustranotes_mobile/features/auth/domain/enum/auth_action_enum.dart';
import 'package:clustranotes_mobile/features/auth/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class EmailVerificationScreen extends ConsumerWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final authProvider = ref.watch(authNotifierProvider);
    final authNotifier = ref.read(authNotifierProvider.notifier);

    final isResending =
        authProvider.isLoading &&
        authProvider.loadingAction == AuthAction.resendVerification;
    final isVerifying =
        authProvider.isLoading &&
        authProvider.loadingAction == AuthAction.checkVerification;
    final isSigningOut =
        authProvider.isLoading &&
        authProvider.loadingAction == AuthAction.signOut;

    final timer = authProvider.verificationResendCooldown;
    final canResend = timer <= 0 && !authProvider.isLoading;
    final email = authProvider.firebaseUser?.email ?? "your email address";

    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenPadding,
                vertical: AppSpacing.md,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - (AppSpacing.md * 2),
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: AppSpacing.sm),

                      Center(
                        child: SvgPicture.asset(
                          "assets/animations/undraw_email_verification_link.svg",
                          width: 200,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xl),

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
                      const SizedBox(height: AppSpacing.lg),
                      const Spacer(),
                      const SizedBox(height: AppSpacing.xl),

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
                            children: [
                              Icon(
                                AppIcons.info,
                                color: theme.colorScheme.primary,
                                size: 24,
                              ),
                              const SizedBox(width: AppSpacing.md),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Didn't receive the email?",
                                      style: theme.textTheme.labelLarge,
                                    ),
                                    const SizedBox(height: 2),
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

                      const SizedBox(height: AppSpacing.md),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          MultiUtilityButton(
                            elevation: 0,
                            onPressed: authProvider.isLoading
                                ? null
                                : () async {
                                    await authNotifier.checkEmailVerification();
                                  },
                            text: "",
                            borderColor: AppColors.transparent,
                            borderRadius: AppRadius.searchBarRounded,
                            buttonColor: theme.colorScheme.primary,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: AppSpacing.md + 2,
                              ),
                              child: isVerifying
                                  ? _ButtonLoadingContent(
                                      label: "Verifying...",
                                      textColor: theme.colorScheme.onPrimary,
                                    )
                                  : Text(
                                      "I've Verified, Continue",
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.bodyMedium
                                          ?.copyWith(
                                            color: theme.colorScheme.onPrimary,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                            ),
                          ),
                          const SizedBox(height: AppSpacing.sm),

                          MultiUtilityButton(
                            elevation: 0,
                            onPressed: canResend
                                ? () async {
                                    await authNotifier
                                        .resendEmailVerificationLink();
                                  }
                                : null,
                            text: "",
                            borderColor: theme.colorScheme.outlineVariant
                                .withValues(alpha: 0.5),
                            borderRadius: AppRadius.searchBarRounded,
                            buttonColor: theme
                                .colorScheme
                                .surfaceContainerHighest
                                .withValues(alpha: 0.5),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: AppSpacing.md + 2,
                              ),
                              child: isResending
                                  ? _ButtonLoadingContent(
                                      label: "Sending...",
                                      textColor: theme.colorScheme.primary,
                                    )
                                  : timer > 0
                                  ? Text(
                                      "Resend in ${NumberFormatter.labelWithCount(count: timer, singularLabel: "second", pluralLabel: "seconds")}",
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.bodyMedium
                                          ?.copyWith(
                                            color: theme
                                                .colorScheme
                                                .onSurfaceVariant,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          AppIcons.refresh,
                                          color: theme.colorScheme.primary,
                                          size: 18,
                                        ),
                                        const SizedBox(width: AppSpacing.xs),
                                        Text(
                                          "Resend Email",
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                                color:
                                                    theme.colorScheme.primary,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                          const SizedBox(height: AppSpacing.xs),

                          TextButton(
                            onPressed: authProvider.isLoading
                                ? null
                                : () async {
                                    await authNotifier.signOut();
                                  },
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                vertical: AppSpacing.sm,
                              ),
                            ),
                            child: isSigningOut
                                ? _ButtonLoadingContent(
                                    label: "Signing out...",
                                    textColor: theme.colorScheme.error,
                                  )
                                : Text(
                                    "Use another account",
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: theme.colorScheme.onSurfaceVariant,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
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

class _ButtonLoadingContent extends StatelessWidget {
  final String label;
  final Color textColor;

  const _ButtonLoadingContent({required this.label, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(textColor),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
