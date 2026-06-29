import 'package:clustranotes_mobile/app/theme/app_spacing.dart';
import 'package:flutter/material.dart';

class _GuidelineTile extends StatelessWidget {
  final String title;
  final List<String> subtitle;

  const _GuidelineTile({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: AppSpacing.lg,),
          
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: subtitle.map((single) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: AppSpacing.xs,
                        left: AppSpacing.sm
                      ),
                      child: Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          const Text('• '),
                          Expanded(
                            child: Text(
                              single,
                              style: theme.textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                )
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UploadGuidelinesSheet extends StatelessWidget {
  const UploadGuidelinesSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upload Guidelines',
                style: theme.textTheme.titleLarge,
              ),
        
              const SizedBox(height: 20),
        
              _GuidelineTile(
                title: 'Clear & readable notes',
                subtitle: [
                  'Avoid blurry, cropped, or tilted pages.',
                  'Ensure text is readable at normal zoom levels.',
                  'Upload complete pages without missing sections.',
                  'Use good lighting when scanning handwritten notes.',
                ],
                
              ),
        
              _GuidelineTile(
                title: 'Select correct subject',
                subtitle: [
                  'Choose the appropriate subject and semester.',
                  'Use the correct note category.',
                  'Add a clear and descriptive title.',
                  'Include relevant tags to improve discoverability.',
                ],
              ),
        
              _GuidelineTile(
                title: 'Verification',
                subtitle: [
                  'Complete and accurate notes get verified.',
                  'Accurate academic content improves approval chances.',
                  'Organized formatting helps moderators review faster.',
                  'High-quality notes may receive a verified badge.',
                ],
              ),
        
              _GuidelineTile(
                title: 'Avoid duplicates',
                subtitle: [
                  'Do not upload the same notes multiple times.',
                  'Check existing uploads before submitting.',
                  'Duplicate content may be rejected.',
                  'Repeated violations can affect contribution quality.',
                ],
              ),

              _GuidelineTile(
                title: 'Supported files',
                subtitle: [
                  'PDF files are recommended for best compatibility.',
                  'DOCX and PPTX files are also supported.',
                  'Ensure files open correctly before uploading.',
                  'Large files may take longer to process.',
                ],
              ),

              _GuidelineTile(
                title: 'Content policy',
                subtitle: [
                  'Upload only educational and academic material.',
                  'Avoid copyrighted books or paid study materials.',
                  'Do not upload irrelevant or misleading content.',
                  'Respect your institution and community guidelines.',
                ],
              ),
        
              const SizedBox(height: 24),
        
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Got it',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
