class GiziList {
  static String table = 'giziList';

  String karbohidrat;
  String protein;
  String lemak;
  int? id;

  GiziList(
      {required this.karbohidrat,
      required this.protein,
      required this.lemak,
      this.id});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id':id,
      'karbohidrat': karbohidrat,
      'protein': protein,
      'lemak': lemak
    };
    return map;
  }

  static GiziList fromMap(Map<String, dynamic> map) {
    return GiziList(
        karbohidrat: map['karbohidrat'],
        protein: map['protein'],
        lemak: map['lemak'],
        id: map['id']);
  }
}
