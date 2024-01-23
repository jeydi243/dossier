class Acteur {
  late int acteur_id;
  late String nom_acteur;
  late String email;
  late String? tel;
  late DateTime created;
  late String? created_by;
  late DateTime? updated;
  late String? updated_by;
  late int? employe_id;
  late String? type_acteur;
  late String? genre;
  late String? observation;

  Acteur(
      {required this.acteur_id,
      required this.nom_acteur,
      required this.email,
      required this.tel,
      required this.created,
      required this.created_by,
      required this.updated,
      required this.updated_by,
      required this.employe_id,
      required this.type_acteur,
      required this.genre,
      required this.observation});
}
