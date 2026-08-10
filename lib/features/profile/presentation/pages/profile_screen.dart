import 'package:clustranotes_mobile/features/auth/presentation/pages/signup_screen.dart';
import 'package:clustranotes_mobile/features/auth/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
            if (state.user != null)
              Text(
                'Signed in as ${state.user!.email}',
              ),

            if (state.error != null)
              Text(state.error!),

            ElevatedButton(
              onPressed: state.isLoading
                  ? null
                  : () {
                ref
                    .read(authNotifierProvider.notifier)
                    .signInWithGoogle();
              },
              child: state.isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Continue with Google'),
            ),

            if (state.user != null)...[
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
                  MaterialPageRoute(builder: (context)=> const SignupScreen())
                );
              }, 
              child: Text("Go to signup screen")
            )
              
          ],
        ),
      ),
    );
  }
}
