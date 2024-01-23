class Reserve {
  late int reserve_id;
  late int titre_id;
  late String description;
  late DateTime created;
  late String created_by;
  late DateTime date;
  late String updated_by;
  late int type_reserve;
  late int article_id;
  late int qte;
  late int type_qte_reserve;
  late String uom;

  Reserve(
      {required this.reserve_id,
      required this.titre_id,
      required this.description,
      required this.created,
      required this.created_by,
      required this.date,
      required this.updated_by,
      required this.type_reserve,
      required this.article_id,
      required this.qte,
      required this.type_qte_reserve,
      required this.uom});

  //write a function to return map of all field

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reserve_id'] = reserve_id;
    data['titre_id'] = titre_id;
    data['description'] = description;
    data['created'] = created;
    data['created_by'] = created_by;
    data['date'] = date;
    data['updated_by'] = updated_by;
    data['type_reserve'] = type_reserve;
    data['article_id'] = article_id;
    data['qte'] = qte;
    data['type_qte_reserve'] = type_qte_reserve;
    data['uom'] = uom;
    return data;
  }
}
