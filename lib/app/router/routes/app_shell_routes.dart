import 'package:clustranotes_mobile/app/router/app_route_names.dart';
import 'package:clustranotes_mobile/app/router/app_route_paths.dart';
import 'package:clustranotes_mobile/core/navigation/app_navigation_shell.dart';
import 'package:clustranotes_mobile/features/explore/presentation/pages/explore_screen.dart';
import 'package:clustranotes_mobile/features/home/presentation/pages/home_screen.dart';
import 'package:clustranotes_mobile/features/library/presentation/pages/library_screen.dart';
import 'package:clustranotes_mobile/features/profile/presentation/pages/profile_screen.dart';
import 'package:clustranotes_mobile/features/upload/presentation/pages/upload_dashboard_screen.dart';
import 'package:go_router/go_router.dart';

final StatefulShellBranch homeBranch = StatefulShellBranch(
  routes: [
    GoRoute(
      path: AppRoutePaths.home,
      name: AppRouteNames.home,
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
  ],
);

final StatefulShellBranch exploreBranch = StatefulShellBranch(
  routes: [
    GoRoute(
      path: AppRoutePaths.explore,
      name: AppRouteNames.explore,
      builder: (context, state) {
        return const ExploreScreen();
      },
    ),
  ],
);

final StatefulShellBranch uploadBranch = StatefulShellBranch(
  routes: [
    GoRoute(
      path: AppRoutePaths.upload,
      name: AppRouteNames.upload,
      builder: (context, state) {
        return const UploadDashboardScreen();
      },
    ),
  ],
);

final StatefulShellBranch libraryBranch = StatefulShellBranch(
  routes: [
    GoRoute(
      path: AppRoutePaths.library,
      name: AppRouteNames.library,
      builder: (context, state) {
        return const LibraryScreen();
      },
    ),
  ],
);

final StatefulShellBranch profileBranch = StatefulShellBranch(
  routes: [
    GoRoute(
      path: AppRoutePaths.profile,
      name: AppRouteNames.profile,
      builder: (context, state) {
        return const ProfileScreen();
      },
    ),
  ],
);

final List<RouteBase> homeRoutes = [
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return AppNavigationShell(
        navigationShell: navigationShell,
      );
    },
    branches: [
      homeBranch,
      exploreBranch,
      uploadBranch,
      libraryBranch,
      profileBranch,
    ],
  ),
];
