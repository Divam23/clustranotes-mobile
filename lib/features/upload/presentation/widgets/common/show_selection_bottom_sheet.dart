import 'package:clustranotes_mobile/core/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:clustranotes_mobile/app/theme/theme.dart';

class ShowSelectionBottomSheet<T> extends StatefulWidget {
  final String title;
  final List<T> items;
  final T? selectedItem;

  final String Function(T) labelBuilder;

  final bool allowClear;
  final String? hintText;
  const ShowSelectionBottomSheet({
    required this.title,
    required this.items,
    required this.labelBuilder,
    this.selectedItem,
    this.allowClear = false,
    this.hintText,
    super.key,
  });

  @override
  State<ShowSelectionBottomSheet<T>> createState() =>
      _ShowSelectionBottomSheetState<T>();
}

class _ShowSelectionBottomSheetState<T>
    extends State<ShowSelectionBottomSheet<T>> {
  late List<T> filteredItems;
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItems = widget.items;
  }

  void _filterItems(String query) {
    final search = query.toLowerCase();

    setState(() {
      filteredItems = widget.items.where((item) {
        return widget.labelBuilder(item).toLowerCase().contains(search);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: isLandscape ? 0.80 : 0.70,
      minChildSize: isLandscape ? 0.80 : 0.40,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Column(
          children: [
            const SizedBox(height: AppSpacing.lg),
            Center(
              child: Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Text(
                widget.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
              child: AppSearchBar(
                hintText: widget.hintText ?? "Search here...",
                controller: controller,
                onChanged: _filterItems,
                autoFocus: false,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            if (widget.allowClear)
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 0.5),
                  ),
                ),
                child: InkWell(
                  enableFeedback: true,
                  onTap: () {
                    Navigator.pop(context, null);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.lg,
                      vertical: AppSpacing.md,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        "None",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: filteredItems.length,
                itemBuilder: (_, index) {
                  final item = filteredItems[index];

                  return Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 0.5),
                      ),
                    ),
                    child: InkWell(
                      enableFeedback: true,
                      onTap: () {
                        Navigator.pop(context, item);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.lg,
                          vertical: AppSpacing.md,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Text(
                                widget.labelBuilder(item),
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                            ),
                            if (widget.selectedItem == item) ...[
                              Icon(AppIcons.tickMark),
                            ],
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
