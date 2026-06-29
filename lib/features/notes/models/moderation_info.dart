class ModerationInfo {
  final int reportCount;
  final List<String> moderationFlags;

  const ModerationInfo({
    required this.reportCount,
    required this.moderationFlags,
  });

  factory ModerationInfo.fromJson(Map<String, dynamic>? json) {
    final j = json ?? {};
    return ModerationInfo(
      reportCount: (j['reportCount'] as num?)?.toInt() ?? 0,
      moderationFlags: (j['moderationFlags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
          const [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reportCount': reportCount,
      'moderationFlags': moderationFlags,
    };
  }
}
