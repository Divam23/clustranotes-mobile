import 'package:clustranotes_mobile/app/router/app_route_paths.dart';
import 'package:clustranotes_mobile/app/router/auth_router_notifier.dart';
import 'package:clustranotes_mobile/app/router/routes/auth_routes.dart';
import 'package:clustranotes_mobile/app/router/routes/app_shell_routes.dart';
import 'package:clustranotes_mobile/features/auth/domain/enum/auth_status_enum.dart';
import 'package:clustranotes_mobile/features/auth/notifier/auth_state.dart';
import 'package:clustranotes_mobile/features/auth/providers/auth_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final authRouterNotifierProvider = Provider<AuthRouterNotifier>((ref) {
  final notifier = AuthRouterNotifier(ref.read(authNotifierProvider));

  ref.listen<AuthState>(authNotifierProvider, (_, next) {
    notifier.update(next);
  });

  ref.onDispose(notifier.dispose);

  return notifier;
});

final appRouterProvider = Provider<GoRouter>((ref) {
  final authRouterNotifier = ref.read(authRouterNotifierProvider);

  return GoRouter(
    initialLocation: AppRoutePaths.splash,
    refreshListenable: authRouterNotifier,
    redirect: (context, state) {
      debugPrint(
        'ROUTER: ${state.matchedLocation} '
            '| AUTH: ${authRouterNotifier.authState.status} '
            '| LOCATION: ${state.matchedLocation} '
            '| USER: ${authRouterNotifier.authState.user?.email}',
      );
      final authState = authRouterNotifier.authState;

      final location = state.matchedLocation;
      if (authState.status == AuthStatus.initializing) {
        return location == AppRoutePaths.splash
            ? null
            : AppRoutePaths.splash;
      }

      final isAuthRoute =
          location == AppRoutePaths.root ||
          location == AppRoutePaths.login ||
          location == AppRoutePaths.signup ||
          location == AppRoutePaths.forgotPassword;
      
      final isVerificationRoute = location == AppRoutePaths.emailVerification;
      final backendAuthenticationFailed = location == AppRoutePaths.backendAuthenticationFailed;

      final isAppRoute =
          location == AppRoutePaths.home ||
              location == AppRoutePaths.explore ||
              location == AppRoutePaths.upload ||
              location == AppRoutePaths.library ||
              location == AppRoutePaths.profile;

      switch (authState.status) {
        case AuthStatus.initializing:
          return AppRoutePaths.splash;

        case AuthStatus.unauthenticated:
          if (isAuthRoute) {
            return null;
          }

          return AppRoutePaths.root;

        case AuthStatus.emailUnverified:
          if (isVerificationRoute) {
            return null;
          }

          return AppRoutePaths.emailVerification;
          
        case AuthStatus.backendAuthenticationFailed:
          if(backendAuthenticationFailed) {
            return null;
          }

          return AppRoutePaths.backendAuthenticationFailed;

        case AuthStatus.authenticated:
          if (isAppRoute) {
            return null;
          }
          return AppRoutePaths.home;
          
        case AuthStatus.authenticatingWithBackend:
          if(isAppRoute){
            return null;
          }
          return AppRoutePaths.splash;
      }
    },
    routes: [
      ...authRoutes,
      ...homeRoutes
    ],
  );
});
