import "dart:core";
import 'package:get/get.dart';

class Contrat implements Comparable<Contrat> {
  String name;
  late int contrat_id;
  late String version_type;
  late String? contract_number;
  late int contract_type_id;
  late String currency_code_varchar2;
  late DateTime start_date;
  late DateTime? end_date;
  int? estimated_amount;
  late DateTime? date_approved;
  late DateTime? datetime_canceled;
  late DateTime? date_signed;
  DateTime? date_terminated;
  String? statut;
  int? periode_reconduction_jours;
  int? contrat_parent_id;
  late String comments_varchar2;
  DateTime created;
  late String created_by;
  DateTime? updated;
  late String? updated_by;
  late int? project_id;
  late String description;
  String? description_long;
  late int type_partenariat_id;

  Contrat(
      {required this.name,
      required this.contrat_id,
      required this.version_type,
      this.contract_number,
      required this.contract_type_id,
      required this.currency_code_varchar2,
      required this.start_date,
      this.end_date,
      this.estimated_amount,
      this.date_approved,
      this.datetime_canceled,
      this.date_signed,
      this.date_terminated,
      this.statut,
      this.periode_reconduction_jours,
      this.contrat_parent_id,
      required this.comments_varchar2,
      required this.created,
      required this.created_by,
      this.updated,
      this.updated_by,
      this.project_id,
      required this.description,
      this.description_long,
      required this.type_partenariat_id});

  @override
  int compareTo(Contrat other) {
    throw UnimplementedError();
  }

  //write a function to return map of all field
  Map<String, dynamic> toJson() => {
        "contrat_id": contrat_id,
      };
  static List<String> toStatic() => [
        // {name: "name", type: 'int'}
      ];
}
