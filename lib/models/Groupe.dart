class Group {
  late int groupe_id;
  late DateTime created;
  late String created_by;
  late DateTime updated;
  late String updated_by;
  late String description;

  Group(
      {required this.groupe_id,
      required this.created,
      required this.created_by,
      required this.updated,
      required this.updated_by,
      required this.description});

  //function to json

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groupe_id'] = groupe_id;
    data['created'] = created;
    data['created_by'] = created_by;
    data['updated'] = updated;
    data['updated_by'] = updated_by;
    data['description'] = description;
    return data;
  }
}
