import 'package:clustranotes_mobile/app/router/app_route_names.dart';
import 'package:clustranotes_mobile/app/router/app_route_paths.dart';
import 'package:clustranotes_mobile/app/router/auth_router_notifier.dart';
import 'package:clustranotes_mobile/app/router/routes/app_routes.dart';
import 'package:clustranotes_mobile/app/router/routes/auth_routes.dart';
import 'package:clustranotes_mobile/app/router/routes/app_shell_routes.dart';
import 'package:clustranotes_mobile/core/widgets/button/app_back_button.dart';
import 'package:clustranotes_mobile/features/auth/domain/enum/auth_status_enum.dart';
import 'package:clustranotes_mobile/features/auth/notifier/auth_state.dart';
import 'package:clustranotes_mobile/features/auth/providers/auth_providers.dart';
import 'package:clustranotes_mobile/features/error/presentation/screen/not_found_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

String _buildAuthRedirect({required String path, required String? redirect}) {
  if (redirect == null || redirect.isEmpty) {
    return path;
  }
  return Uri(path: path, queryParameters: {'redirect': redirect}).toString();
}

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
        'ROUTER: ${state.uri} '
        '| AUTH: ${authRouterNotifier.authState.status} '
        '| LOCATION: ${state.matchedLocation} '
        '| USER: ${authRouterNotifier.authState.user?.email}',
      );
      final authState = authRouterNotifier.authState;

      final location = state.matchedLocation;
      final redirect = state.uri.queryParameters['redirect'];

      debugPrint(
        'ROUTER REDIRECT DATA: '
            'uri=${state.uri} '
            'location=$location '
            'redirect=$redirect',
      );

      if (authState.status == AuthStatus.initializing) {
        return location == AppRoutePaths.splash ? null : AppRoutePaths.splash;
      }

      final isAuthRoute =
          location == AppRoutePaths.root ||
          location == AppRoutePaths.login ||
          location == AppRoutePaths.signup ||
          location == AppRoutePaths.forgotPassword ||
          location == AppRoutePaths.forgotPasswordMail;
      

      final isVerificationRoute = location == AppRoutePaths.emailVerification;
      final backendAuthenticationFailed =
          location == AppRoutePaths.backendAuthenticationFailed;

      final isAppRoute =
          location == AppRoutePaths.home ||
          location == AppRoutePaths.explore ||
          location == AppRoutePaths.upload ||
          location == AppRoutePaths.library ||
          location == AppRoutePaths.profile;

      final isAuthenticatedRoute =
          isAppRoute ||
              location.startsWith('/notes/') ||
              location == AppRoutePaths.uploadFlow ||
              location == AppRoutePaths.uploadProgress;
      
      final isErrorRoute = state.error != null;

      switch (authState.status) {
        case AuthStatus.initializing:
          return AppRoutePaths.splash;

        case AuthStatus.unauthenticated:
          if (isAuthRoute) {
            return null;
          }
          
          if(isErrorRoute){
            return null;
          }

          if (location == AppRoutePaths.splash) {
            return AppRoutePaths.root;
          }


          return _buildAuthRedirect(
            path: AppRoutePaths.root,
            redirect: state.uri.toString(),
          );

        case AuthStatus.emailUnverified:
          if (isVerificationRoute) {
            return null;
          }

          return _buildAuthRedirect(
            path: AppRoutePaths.emailVerification,
            redirect: redirect,
          );

        case AuthStatus.backendAuthenticationFailed:
          if (backendAuthenticationFailed) {
            return null;
          }
          
          if(isErrorRoute){
            return null;
          }

          return _buildAuthRedirect(
            path: AppRoutePaths.backendAuthenticationFailed,
            redirect: redirect,
          );

        case AuthStatus.authenticated:
          if (redirect != null && redirect.isNotEmpty) {
            return redirect;
          }
          
          if(isErrorRoute){
            return null;  
          }
          
          if (isAuthenticatedRoute) {
            return null;
          }
          return _buildAuthRedirect(
            path: AppRoutePaths.home,
            redirect: redirect,
          );

        case AuthStatus.authenticatingWithBackend:
          if (isAppRoute) {
            return null;
          }
          
          if(isErrorRoute){
            return null;
          }
          
          if(isAuthenticatedRoute){
            return null;
          }

          return _buildAuthRedirect(
            path: AppRoutePaths.splash,
            redirect: redirect,
          );
      }
    },
    routes: [
      ...appRoutes,
      ...authRoutes,
      ...homeRoutes,

      GoRoute(
        path: AppRoutePaths.noteDetails,
        name: AppRouteNames.noteDetails,
        builder: (context, state) {
          final noteId = state.pathParameters['noteId']!;

          return Scaffold(
            appBar: AppBar(leading: const AppBackButton(), title: const Text('Note Details')),
            body: Center(child: Text('Note ID: $noteId')),
          );
        },
      ),
      
    ],
    errorBuilder: (_,_){
      return const NotFoundScreen();
    }
  );
});
