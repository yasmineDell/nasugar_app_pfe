class PatientModel {
 late String name;
 late String email;
  late int photoUrl;
  late String numTel;
 late String uid;
 late  String dateNais;  
 static late  PatientModel currentUser;


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

  factory PatientModel.fromJson(Map<String, dynamic> json, {Reference}){
    return PatientModel(
      uid: json['UID'],
      name: json['Name'],
      dateNais: json['DateNais'],
      numTel: json['NumTel'],
      email: json['Email'],
      photoUrl: json['PhotoUrl'],
    );
  }

  Map<String,dynamic> tomap()=> {
    "uid": uid,
    "name" : name,
    "dateNais": dateNais,
    "numTel" : numTel,
    "email" : email,
    "photoUrl": photoUrl,
  };
}