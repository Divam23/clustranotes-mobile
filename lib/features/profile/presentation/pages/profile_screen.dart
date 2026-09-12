import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:clustranotes_mobile/features/auth/presentation/pages/main_auth_screen.dart';
import 'package:clustranotes_mobile/features/auth/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends ConsumerWidget{
  const ProfileScreen({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref){
    final state = ref.watch(authNotifierProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (state.firebaseUser != null)
              Column(
                spacing: AppSpacing.lg,
                children: [
                  Text(
                    'Signed in as ${state.firebaseUser!.displayName}',
                  ),
                  Text("Email: ${state.firebaseUser!.email}")
                ],
              ),
              Column(
                spacing: AppSpacing.lg,
                children: [
                  Text(
                    'ClustraNotes username: ${state.user?.userName ?? 'Not loaded'}',
                  ),
                  Text(
                    'Email: ${state.user?.email ?? 'Not loaded'}',
                  ),
                ],
              ),

            if (state.error != null)
              Text(state.error!),

            if (state.firebaseUser != null)...[
              TextButton(
                onPressed: () {
                  ref
                      .read(authNotifierProvider.notifier)
                      .signOut();
                },
                child: const Text('Sign out'),
              ),
            ],
            
            TextButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> const MainAuthScreen())
                );
              }, 
              child: Text("Go to signup screen")
            ),
              
          ],
        ),
      ),
    );
  }
}
