import 'package:clustranotes_mobile/app/router/app_route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:go_router/go_router.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.section),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/animations/404_storyset.svg', width: 240),
                
                const SizedBox(height: AppSpacing.section),
                Text(
                  '404',
                  style: theme.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Page not found',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  "The page you're looking for doesn't exist or may have been moved.",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: AppSpacing.section),
                FilledButton(
                  onPressed: () => context.go(AppRoutePaths.home),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSpacing.xxl, vertical: AppSpacing.xs),
                    child: Text('Go home'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
