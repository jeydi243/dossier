class Reunion {
  late int reunion_id;
  late String objet_reunion;
  late int type_reunion_id;
  late int exercice_id;
  late DateTime date_tenue;
  late String statut_reunion;
  late DateTime created;
  late String created_by;
  late DateTime updated;
  late String updated_by;
  late int contrat_id;

  Reunion({
    required this.reunion_id,
    required this.objet_reunion,
    required this.type_reunion_id,
    required this.exercice_id,
    required this.date_tenue,
    required this.statut_reunion,
    required this.created,
    required this.created_by,
    required this.updated,
    required this.updated_by,
    required this.contrat_id,
  });
  //write a function to return map of all field

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reunion_id'] = reunion_id;
    data['objet_reunion'] = objet_reunion;
    data['type_reunion_id'] = type_reunion_id;
    data['exercice_id'] = exercice_id;
    data['date_tenue'] = date_tenue;
    data['statut_reunion'] = statut_reunion;

    data['created'] = created;
    data['created_by'] = created_by;
    data['updated'] = updated;
    data['updated_by'] = updated_by;
    data['contrat_id'] = contrat_id;

    return data;
  }
}
