import 'package:clustranotes_mobile/app/router/app_route_names.dart';
import 'package:clustranotes_mobile/app/router/app_route_paths.dart';
import 'package:clustranotes_mobile/app/router/routes/upload_routes.dart';
import 'package:clustranotes_mobile/features/auth/presentation/pages/auth_splash_screen.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> appRoutes = [
  GoRoute(
    path: AppRoutePaths.splash,
    name: AppRouteNames.splash,
    builder: (context, state) {
      return const AuthSplashScreen();
    },
  ),
  ...uploadRoutes,
  
];
