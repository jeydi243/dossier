class Zone {
  late int zone_id;
  late int row_key;
  late String zone_code_name;
  late String zone_description;
  late String zone_long_description;
  late DateTime zone_start_date;
  late DateTime zone_close_date;
  late int template_id;
  late String logo_blob;
  late String logo_name;
  late String logo_mimetype;
  late String logo_charset;
  late DateTime logo_lastupd;
  late String zone_approval_status;
  late String zone_status;
  late int groupe_id;
  late int localisation_id;
  late DateTime created;
  late String created_by;
  late DateTime updated;
  late String updated_by;
  late String couverture;

  Zone(
      {required this.zone_id,
      required this.row_key,
      required this.zone_code_name,
      required this.zone_description,
      required this.zone_long_description,
      required this.zone_start_date,
      required this.zone_close_date,
      required this.template_id,
      required this.logo_blob,
      required this.logo_name,
      required this.logo_mimetype,
      required this.logo_charset,
      required this.logo_lastupd,
      required this.zone_approval_status,
      required this.zone_status,
      required this.groupe_id,
      required this.localisation_id,
      required this.created,
      required this.created_by,
      required this.updated,
      required this.updated_by,
      required this.couverture});

  //write a function to return all field to json

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['zone_id'] = zone_id;
    data['row_key'] = row_key;
    data['zone_code_name'] = zone_code_name;
    data['zone_description'] = zone_description;
    data['zone_long_description'] = zone_long_description;
    data['zone_start_date'] = zone_start_date;
    data['zone_close_date'] = zone_close_date;
    data['template_id'] = template_id;
    data['logo_blob'] = logo_blob;
    data['logo_name'] = logo_name;
    data['logo_mimetype'] = logo_mimetype;
    data['logo_charset'] = logo_charset;
    data['logo_lastupd'] = logo_lastupd;
    data['zone_approval_status'] = zone_approval_status;
    data['zone_status'] = zone_status;
    data['groupe_id'] = groupe_id;
    data['localisation_id'] = localisation_id;
    data['created'] = created;
    data['created_by'] = created_by;
    data['updated'] = updated;
    data['updated_by'] = updated_by;
    data['couverture'] = couverture;

    return data;
  }
}
