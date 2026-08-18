import 'package:clustranotes_mobile/app/router/auth_router_notifier.dart';
import 'package:clustranotes_mobile/core/navigation/app_navigation_shell.dart';
import 'package:clustranotes_mobile/features/auth/domain/enum/auth_status_enum.dart';
import 'package:clustranotes_mobile/features/auth/notifier/auth_state.dart';
import 'package:clustranotes_mobile/features/auth/presentation/pages/auth_splash_screen.dart';
import 'package:clustranotes_mobile/features/auth/presentation/pages/email_verification_screen.dart';
import 'package:clustranotes_mobile/features/auth/presentation/pages/forgot_password_screen.dart';
import 'package:clustranotes_mobile/features/auth/presentation/pages/login_screen.dart';
import 'package:clustranotes_mobile/features/auth/presentation/pages/main_auth_screen.dart';
import 'package:clustranotes_mobile/features/auth/presentation/pages/signup_screen.dart';
import 'package:clustranotes_mobile/features/auth/providers/auth_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final appRouterNotifierProvider = Provider<AuthRouterNotifier>((ref){
  final notifier = AuthRouterNotifier(
    ref.read(authNotifierProvider)
  );
  
  ref.listen<AuthState>(
    authNotifierProvider,
      (_, next){
      notifier.update(next);
      }
  );
  
  ref.onDispose(notifier.dispose);
  
  return notifier;
});


final appRouterProvider = Provider<GoRouter>((ref){
  final authRouterNotifier = ref.read(appRouterNotifierProvider);
  
  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: authRouterNotifier,
    redirect: (context, state){
      final authState = authRouterNotifier.authState;
      
      final location = state.matchedLocation;
      if (authState.status == AuthStatus.initializing) {
        if (location == '/splash') {
          return null;
        }

        return '/splash';
      }
      
      final isAuthRoute = location == '/' || location == '/login' || location == '/signup' || location == '/forgot-password';
      final isVerificationRoute = location == "/email-verification";
      final isAppRoute = location.startsWith("/home");
      
      switch(authState.status){
        case AuthStatus.initializing:
          return '/splash';
          
        case AuthStatus.unauthenticated:
          if(isAuthRoute){
            return null;
          }
          
          return '/';
          
        case AuthStatus.emailUnverified:
          if(isVerificationRoute){
            return null;
          }
          
          return '/email-verification';
        
        case AuthStatus.authenticated:
          if(isAppRoute){
            return null;
          }
          return '/home';
      }
    },
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const MainAuthScreen()
      ),
      
      GoRoute(
        path: "/splash",
        builder: (context, state) => const AuthSplashScreen()
      ),
      
      GoRoute(
        path: "/login",
        builder: (context, state) => const LoginScreen(),
      ),
      
      GoRoute(
        path: "/signup",
        builder: (context, state) => const SignupScreen(),
      ),

      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),

      GoRoute(
        path: '/email-verification',
        builder: (context, state) => const EmailVerificationScreen(),
      ),

      GoRoute(
        path: '/home',
        builder: (context, state) => const AppNavigationShell(),
      ),
    ],
  );
});
