final String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [
    /// Add all fields
    id, name, karbohidrat, protein, lemak
  ];

  static final String id = '_id';
  static final String name = 'name';
  static final String karbohidrat = 'karbohidrat';
  static final String protein = 'protein';
  static final String lemak = 'lemak';
}

class Note {
  final int? id;
  final String name;
  final int karbohidrat;
  final int protein;
  final int lemak;

  const Note({
    this.id,
    required this.name,
    required this.karbohidrat,
    required this.protein,
    required this.lemak,
  });

  Note copy({
    int? id,
    String? name,
    int? karbohidrat,
    int? protein,
    int? lemak,
  }) =>
      Note(
        id: id ?? this.id,
        name: name ?? this.name,
        karbohidrat: karbohidrat ?? this.karbohidrat,
        protein: protein ?? this.protein,
        lemak: lemak ?? this.lemak,
      );

  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[NoteFields.id] as int?,
        name: json[NoteFields.name] as String,
        karbohidrat: json[NoteFields.karbohidrat] as int,
        protein: json[NoteFields.protein] as int,
        lemak: json[NoteFields.lemak] as int,
      );

  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.name: name,
        NoteFields.karbohidrat: karbohidrat,
        NoteFields.protein: protein,
        NoteFields.lemak: lemak,
      };
}
