class PatientModel {
  String name;
  String email;
  int photoUrl;
  String numTel;
  String uid;
 String dateNais;
  


  PatientModel(
    {
      this.uid,
      this.name,
      this.dateNais,
      this.numTel,
      this.email,
      this.photoUrl,
     
      
      
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