import 'package:clustranotes_mobile/app/theme/theme.dart';
import 'package:clustranotes_mobile/core/utils/formatters/file_size_formatter.dart';
import 'package:clustranotes_mobile/core/widgets/dot.dart';
import 'package:clustranotes_mobile/core/widgets/fallback_user_avatar.dart';
import 'package:clustranotes_mobile/core/widgets/user_avatar.dart';
import 'package:clustranotes_mobile/core/widgets/verified_tick.dart';
import 'package:clustranotes_mobile/features/notes/models/note_model.dart';
import 'package:flutter/material.dart';

class NoteInfoSection extends StatelessWidget{
  final Note note;
  const NoteInfoSection({
    required this.note,
    super.key
  });
  
  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg,horizontal: AppSpacing.screenPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppSpacing.xs,
        children: [
          Text(
            note.title,
            style: theme.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold
            ),
          ),
          Wrap(
            spacing: AppSpacing.xs,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                'Semester ${note.semester}',
                style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSecondary
                ),
              ),
              Dot(radius: 2, color: AppColors.primary),
              Text(
                note.subject,
                style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSecondary
                ),
              ),
              Dot(radius: 2, color: AppColors.primary),
              if(note.course != null) Text(
                note.course!,
                style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSecondary
                ),
              )
            ],
          ),
          Row(
            spacing: AppSpacing.xs,
            children: [
              if(note.university != null) Text(
                note.university!,
                style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSecondary
                ),
              ),
              Dot(radius: 2, color: AppColors.primary),
              Text(
                '${note.file.pageCount} page(s)',
                style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSecondary
                ),
              ),
              Dot(radius: 2, color: AppColors.primary),
              Text(
                FileSizeFormatter.format(note.file.sizeInBytes!),
                style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSecondary
                ),
              )
            ],
          ),
          const SizedBox(height: AppSpacing.md,),
          Row(
            spacing: AppSpacing.sm,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              note.uploaderAvatar != null ? 
              UserAvatar(avatar: note.uploaderAvatar!) : 
              FallbackUserAvatar(firstName: note.uploaderName),
              Text(
                note.uploaderName,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700
                ),
              ),
              VerifiedTick(),
            ],
          )
        ],
      ),
    );
  }
}
