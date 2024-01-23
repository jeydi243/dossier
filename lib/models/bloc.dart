class Bloc {
  late int bloc_id;
  late String bloc_code;
  late int doc_id;
  late int titre_id;
  late int nombre_sommet;
  late String tag_availability;
  late String bloc_statut;
  late DateTime created;
  late String created_by;
  late DateTime updated;
  late String updated_by;
  late int nombre_carre;
  late int contrat_id;

  Bloc(
      {required this.bloc_id,
      required this.bloc_code,
      required this.doc_id,
      required this.titre_id,
      required this.nombre_sommet,
      required this.tag_availability,
      required this.bloc_statut,
      required this.created,
      required this.created_by,
      required this.updated,
      required this.updated_by,
      required this.nombre_carre,
      required this.contrat_id});

  Map<String, dynamic> toJson() => {
        'bloc_id': bloc_id,
        'bloc_code': bloc_code,
        'doc_id': doc_id,
        'titre_id': titre_id,
        'nombre_sommet': nombre_sommet,
        'tag_availability': tag_availability,
        'bloc_statut': bloc_statut,
        'created': created,
        'created_by': created_by,
        'updated': updated,
        'updated_by': updated_by,
        'nombre_carre': nombre_carre,
        'contrat_id': contrat_id
      };
}
