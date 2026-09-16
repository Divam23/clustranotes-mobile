import 'package:clustranotes_mobile/core/errors/app_failure.dart';
import 'package:flutter/material.dart';

class AppErrorView extends StatelessWidget {
  const AppErrorView({
    super.key,
    required this.failure,
    this.onRetry,
  });

  final AppFailure failure;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline),
          const SizedBox(height: 12),
          Text(failure.message),
          if (failure.retryable && onRetry != null)
            TextButton(
              onPressed: onRetry,
              child: const Text('Try Again'),
            ),
        ],
      ),
    );
  }
}
