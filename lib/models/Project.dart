class Project {
  late int project_id;
  late int row_key;
  late String project_code_name;
  late String project_description;
  late String project_long_description;
  late String project_customer;
  late DateTime project_start_date;
  late DateTime project_close_date;
  late int template_id;
  late String logo_blob;
  late String logo_name;
  late String logo_mimetype;
  late String logo_charset;
  late DateTime logo_lastupd;
  late String project_approval_status;
  late int project_status;
  late DateTime created;
  late String created_by;
  late DateTime updated;
  late String updated_by;
  late int groupe_id;
  late int localisation_id;
  late DateTime project_completion_date;
  late int project_category;

  Project(
      {required this.project_id,
      required this.row_key,
      required this.project_code_name,
      required this.project_description,
      required this.project_long_description,
      required this.project_customer,
      required this.project_start_date,
      required this.project_close_date,
      required this.template_id,
      required this.logo_blob,
      required this.logo_name,
      required this.logo_mimetype,
      required this.logo_charset,
      required this.logo_lastupd,
      required this.project_approval_status,
      required this.project_status,
      required this.created,
      required this.created_by,
      required this.updated,
      required this.updated_by,
      required this.groupe_id,
      required this.localisation_id,
      required this.project_completion_date,
      required this.project_category});

  //write a function to return all field to json

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['project_id'] = project_id;
    data['row_key'] = row_key;
    data['project_code_name'] = project_code_name;
    data['project_description'] = project_description;
    data['project_long_description'] = project_long_description;
    data['project_customer'] = project_customer;
    data['project_start_date'] = project_start_date;
    data['project_close_date'] = project_close_date;
    data['template_id'] = template_id;
    data['logo_blob'] = logo_blob;
    data['logo_name'] = logo_name;
    data['logo_mimetype'] = logo_mimetype;
    data['logo_charset'] = logo_charset;
    data['logo_lastupd'] = logo_lastupd;

    data['project_approval_status'] = project_approval_status;
    data['project_status'] = project_status;
    data['created'] = created;
    data['created_by'] = created_by;
    data['updated'] = updated;
    data['updated_by'] = updated_by;
    return data;
  }
}
