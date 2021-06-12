class PatientModel {
 late String name;
 late String email;
  late int photoUrl;
  late String numTel;
 late String uid;
 late  String dateNais;
  


  PatientModel(
    {
      required this.uid,
      required this.name,
      required this.dateNais,
      required this.numTel,
      required this.email,
      required this.photoUrl,
     
      
      
    }
  );

  factory PatientModel.fromJson(Map<String, dynamic> json){
    return PatientModel(
      uid: json['UID'].toString(),
      name: json['Name'].toString(),
      dateNais: json['DateNais'].toString(),
      numTel: json['NumTel'].toString(),
      email: json['Email'].toString(),
      photoUrl: json['PhotoUrl'] as int,
    );
  }
}