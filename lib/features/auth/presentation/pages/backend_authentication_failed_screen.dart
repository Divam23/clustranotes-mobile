import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/widgets/button/multi_utility_button.dart';
import 'package:clustranotes_mobile/features/auth/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BackendAuthenticationFailedScreen extends ConsumerWidget {
  const BackendAuthenticationFailedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final authNotifier = ref.read(authNotifierProvider.notifier);
    final authProvider = ref.read(authNotifierProvider);
    final isTrying =  authProvider.isLoading == true;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 32,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 420,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 88,
                    height: 88,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.errorContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      AppIcons.cloud,
                      size: 42,
                      color: theme.colorScheme.onErrorContainer,
                    ),
                  ),

                  const SizedBox(height: AppSpacing.xxl),

                  Text(
                    'Something went wrong',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: AppSpacing.md),

                  Text(
                    'We couldn’t connect to ClustraNotes right now. '
                        'Please check your internet connection and try again.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: AppSpacing.section),

                  SizedBox(
                    width: double.infinity,
                    child: MultiUtilityButton(
                      text: "",
                      borderColor: AppColors.transparent,
                      borderRadius: AppRadius.searchBarRounded,
                      buttonColor: authProvider.isLoading
                          ? AppColors.transparent
                          : theme.colorScheme.primary,
                      child: isTrying ? Center(
                        child: const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ),
                      ) : Text(
                          "Try Again",
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onPrimary,
                              fontWeight: FontWeight.bold
                          )
                      ),
                      onPressed: () async{
                        isTrying ? null :
                        await authNotifier.retryBackendAuthentication();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
