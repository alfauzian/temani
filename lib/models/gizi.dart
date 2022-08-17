import 'package:get/get.dart';

class GiziModel {
  final karbohidrat = RxInt(0);
  final protein = RxInt(0);
  final lemak = RxInt(0);
}

class GiziModelToDB {
  int? id;
  int? karbohidrat;
  int? protein;
  int? lemak;

  GiziModelToDB({this.karbohidrat, this.lemak, this.protein, this.id});

  GiziModelToDB copy({
    int? id,
  }) =>
      GiziModelToDB(
          id: id ?? this.id,
          karbohidrat: karbohidrat ?? this.karbohidrat,
          protein: protein ?? this.protein,
          lemak: lemak ?? this.lemak);

  static GiziModelToDB fromJson(Map<String, Object?> json) => GiziModelToDB(
    id: json[GiziModelFields.id] as int,
    karbohidrat: json[GiziModelFields.karbohidrat] as int,
    protein: json[GiziModelFields.protein] as int,
    lemak:  json[GiziModelFields.lemak] as int
  );

  Map<String, Object?> toJson() => {
        GiziModelFields.id: id,
        GiziModelFields.karbohidrat: karbohidrat,
        GiziModelFields.protein: protein,
        GiziModelFields.lemak: lemak
      };
}

final String tableGizi = 'gizitable';

class GiziModelFields {
  static final List<String> values = [id, karbohidrat, protein, lemak];

  static final String id = '_id';
  static final String karbohidrat = 'karbohidrat';
  static final String protein = 'protein';
  static final String lemak = 'lemak';
}
