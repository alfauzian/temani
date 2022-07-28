class GiziModel{
  int? id;
  String karbohidrat;
  String protein;
  String lemak;

  GiziModel({this.id, required this.karbohidrat, required this.protein, required this.lemak});

  Map<String,dynamic> toMap() {
    return {
      'id':id,
      'karbohidrat': karbohidrat,
      'protein' : protein,
      'lemak' : lemak
    };
  }

  @override
  String toString() {
    return 'GiziModel(karbohidrat: $karbohidrat protein: $protein, lemak: $lemak)';
  }
}