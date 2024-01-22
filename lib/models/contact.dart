class Contact {
  int contact_id;
  late String nom_complet;
  late String? email;
  late String? fonction;
  late DateTime? created;
  late String? created_by;
  late DateTime? date;
  late String? updated_by;
  late int? partenaire_id;
  late String? telephone1;
  late String? telephone2;
  late String? email2;
  
  Contact({
    required this.contact_id,
    required this.nom_complet,
     this.email,
     this.fonction,
     this.created,
     this.created_by,
     this.date,
     this.updated_by,
     this.partenaire_id,
     this.telephone1,
     this.telephone2,
     this.email2,
  });


}
