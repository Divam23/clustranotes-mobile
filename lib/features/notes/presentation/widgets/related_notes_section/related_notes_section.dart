import 'package:clustranotes_mobile/features/notes/models/note_details.dart';
import 'package:clustranotes_mobile/features/notes/presentation/widgets/related_notes_section/related_note_card.dart';
import 'package:flutter/material.dart';
import 'package:clustranotes_mobile/app/theme/theme.dart';


class RelatedNotesSection extends StatelessWidget{
  final List<NoteDetails> notes;
  const RelatedNotesSection({
    required this.notes,
    super.key
  });
  
  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding, vertical: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppSpacing.md,
        children: [
          Text(
            'RELATED NOTES',
            style: theme.textTheme.titleSmall?.copyWith(
                color: theme.colorScheme.onSecondary
            ),
          ),
          SizedBox(
            height: 230,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: notes.length,
              separatorBuilder: (_, __) =>
              const SizedBox(width: AppSpacing.md),
              itemBuilder: (context, index) {
                return RelatedNoteCard(
                  note: notes[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
