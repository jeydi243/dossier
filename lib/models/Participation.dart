class Participation {
  late int actionnaire_id;
  late int part;
  late int pourcentage_part;
  late DateTime created;
  late String created_by;
  late DateTime updated;
  late String updated_by;
  late int contrat_id;
  late int partenaire_id;
  late int part_fp;
  late String devise;

  Participation(
      {required this.actionnaire_id,
      required this.part,
      required this.pourcentage_part,
      required this.created,
      required this.created_by,
      required this.updated,
      required this.updated_by,
      required this.contrat_id,
      required this.partenaire_id,
      required this.part_fp,
      required this.devise});

  //write a function to return map of all field, make the function smart

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['actionnaire_id'] = actionnaire_id;
    data['part'] = part;
    data['pourcentage_part'] = pourcentage_part;
    data['created'] = created;
    data['created_by'] = created_by;
    data['updated'] = updated;
    data['updated_by'] = updated_by;
    data['contrat_id'] = contrat_id;
    data['partenaire_id'] = partenaire_id;

    data['part_fp'] = part_fp;
    data['devise'] = devise;

    return data;
  }
}
