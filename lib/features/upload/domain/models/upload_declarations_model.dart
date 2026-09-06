class UploadDeclarations {
  final bool ownership;
  final bool copyright;
  final bool guidelines;
  final bool consequences;

  const UploadDeclarations({
    this.ownership = false,
    this.consequences = false,
    this.copyright = false,
    this.guidelines = false,
  });

  bool get allAccepted => ownership && consequences && copyright && guidelines;

  UploadDeclarations copyWith({
    bool? ownership,
    bool? copyright,
    bool? guidelines,
    bool? consequences,
  }) {
    return UploadDeclarations(
      ownership: ownership ?? this.ownership,
      copyright: copyright ?? this.copyright,
      guidelines: guidelines ?? this.guidelines,
      consequences: consequences ?? this.consequences,
    );
  }
}
