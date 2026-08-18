import 'package:clustranotes_mobile/features/auth/presentation/pages/login_screen.dart';
import 'package:clustranotes_mobile/features/auth/presentation/widgets/email_signin_button.dart';
import 'package:clustranotes_mobile/features/auth/presentation/widgets/google_signin_button.dart';
import 'package:clustranotes_mobile/features/auth/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MainAuthScreen extends ConsumerWidget{
  const MainAuthScreen({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref){
    final authNotifier = ref.read(authNotifierProvider.notifier);
    final authProvider = ref.watch(authNotifierProvider);
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints){
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.screenPadding,
                      vertical: AppSpacing.md
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          spacing: AppSpacing.md,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    "ClustraNotes",
                                    style: theme.textTheme.displayLarge,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              spacing: AppSpacing.xs,
                              children: [
                                Text(
                                  "Your study companion.",
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                      color: theme.disabledColor,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2
                                  ),
                                ),

                                Text(
                                  "Organise. Learn. Succeed.",
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                      color: theme.disabledColor,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: AppSpacing.lg,),
                        Image.asset(
                          "assets/animations/main_auth_storyset.gif",
                          width: 350,
                        ),
                        const SizedBox(height: AppSpacing.xl,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            GoogleSignInButton(
                              isLoading: authProvider.isLoading,
                              onPressed: () async{
                                await ref.read(authNotifierProvider.notifier).signInWithGoogle();
                                
                                if(context.mounted){
                                  context.go('/home');
                                }
                              }, 
                            ),
                            const SizedBox(height: AppSpacing.md),
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(color: theme.disabledColor,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                                  child: Text(
                                    "Or",
                                    style: theme.textTheme.labelMedium?.copyWith(
                                      color: theme.disabledColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(color: theme.disabledColor,),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppSpacing.md),
                            EmailSignInButton(
                              onPressed: () {
                                context.push('/login');
                              },
                            ),
                          ],
                        )
                        
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
