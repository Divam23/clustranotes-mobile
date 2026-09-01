import 'package:clustranotes_mobile/app/router/app_route_names.dart';
import 'package:clustranotes_mobile/app/router/app_route_paths.dart';
import 'package:clustranotes_mobile/features/auth/presentation/pages/auth_splash_screen.dart';
import 'package:clustranotes_mobile/features/auth/presentation/pages/backend_authentication_failed_screen.dart';
import 'package:clustranotes_mobile/features/auth/presentation/pages/email_verification_screen.dart';
import 'package:clustranotes_mobile/features/auth/presentation/pages/forgot_password_email_sent.dart';
import 'package:clustranotes_mobile/features/auth/presentation/pages/forgot_password_screen.dart';
import 'package:clustranotes_mobile/features/auth/presentation/pages/login_screen.dart';
import 'package:clustranotes_mobile/features/auth/presentation/pages/main_auth_screen.dart';
import 'package:clustranotes_mobile/features/auth/presentation/pages/signup_screen.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> authRoutes = [
  GoRoute(
    path: AppRoutePaths.root,
    name: AppRouteNames.root,
    builder: (context, state) {
      return const MainAuthScreen();
    },
  ),

  GoRoute(
    path: AppRoutePaths.splash,
    name: AppRouteNames.splash,
    builder: (context, state) {
      return const AuthSplashScreen();
    },
  ),

  GoRoute(
    path: AppRoutePaths.login,
    name: AppRouteNames.login,
    builder: (context, state) {
      return const LoginScreen();
    },
  ),

  GoRoute(
    path: AppRoutePaths.signup,
    name: AppRouteNames.signup,
    builder: (context, state) {
      return const SignupScreen();
    },
  ),

  GoRoute(
    path: AppRoutePaths.forgotPassword,
    name: AppRouteNames.forgotPassword,
    builder: (context, state) {
      return const ForgotPasswordScreen();
    },
  ),

  GoRoute(
    path: AppRoutePaths.forgotPasswordMail,
    name: AppRouteNames.forgotPasswordMail,
    builder: (context, state) {
      return const ForgotPasswordEmailSentScreen();
    },
  ),

  GoRoute(
    path: AppRoutePaths.emailVerification,
    name: AppRouteNames.emailVerification,
    builder: (context, state) {
      return const EmailVerificationScreen();
    },
  ),
  
  GoRoute(
    path: AppRoutePaths.backendAuthenticationFailed,
    name: AppRouteNames.backendAuthenticationFailed,
    builder: (context, state){
      return const BackendAuthenticationFailedScreen();
    }
  )

];
