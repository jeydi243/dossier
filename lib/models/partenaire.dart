// ignore_for_file: non_constant_identifier_names

import 'dart:core';

class Partenaire {
  int id;
  String name;
  late String designation;
  late int? entreprise_id;
  late DateTime? created;
  late String? created_by;
  late DateTime? updated;
  late String? updated_by;
  late String? description;
  late String? forme_juridique;
  late String? code_partenaire;
  late String? est_partenariat;
  late String? statut;
  late int? localisation_id;
  late String? identification_nat;
  late String? rccm;
  late String? num_impot;
  late int? contrat_id;
  late String? comment;
  late int? capital_social_usd;
  late int? capital_social_cdf;
  late int? fond_propre_usd;
  late int? fond_propre_cdf;

  Partenaire(
      {required this.id,
      required this.name,
      required this.designation,
      this.entreprise_id,
      this.created,
      this.created_by,
      this.updated,
      this.updated_by,
      this.description,
      this.forme_juridique,
      this.code_partenaire,
      this.est_partenariat,
      this.statut,
      this.localisation_id,
      this.identification_nat,
      this.rccm,
      this.num_impot,
      this.contrat_id,
      this.comment,
      this.capital_social_usd,
      this.capital_social_cdf,
      this.fond_propre_usd,
      this.fond_propre_cdf});

  //to json

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'designation': designation,
        'entreprise_id': entreprise_id,
        'created': created,
        'created_by': created_by,
        'updated': updated,
        'updated_by': updated_by,
        'description': description,
        'forme_juridique': forme_juridique,
        'code_partenaire': code_partenaire,
        'est_partenariat': est_partenariat
      };
}
