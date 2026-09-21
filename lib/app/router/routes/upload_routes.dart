import 'package:clustranotes_mobile/app/router/app_route_names.dart';
import 'package:clustranotes_mobile/app/router/app_route_paths.dart';
import 'package:clustranotes_mobile/features/upload/presentation/pages/upload_note_screen/upload_note_screen.dart';
import 'package:clustranotes_mobile/features/upload/presentation/pages/upload_note_screen/upload_progress_screen.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> uploadRoutes = [
  GoRoute(
    path: AppRoutePaths.uploadProgress,
    name: AppRouteNames.uploadProgress,
    builder: (context, state) {
      return const UploadProgressScreen();
    },
  ),

  GoRoute(
    path: AppRoutePaths.uploadFlow,
    name: AppRouteNames.uploadFlow,
    builder: (context, state){
      return const UploadNoteScreen();
    }
  )
];
