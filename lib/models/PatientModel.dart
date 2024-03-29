class PatientModel {
 late String name;
 late String email;
  late String numTel;
 late String uid;
 late  String dateNais;
  late String typeDiab;
 late  String poids;

  static late  PatientModel currentUser;


  PatientModel(
    {
      required this.uid,
      required this.name,
      required this.dateNais,
      required this.numTel,
      required this.email,
      required this.typeDiab,
      required this.poids,



    }
  );

  factory PatientModel.fromJson(Map<String, dynamic> json, {Reference}){
    return PatientModel(
      uid: json['UID'],
      name: json['Name'],
      dateNais: json['DateNais'],
      numTel: json['NumTel'],
      email: json['Email'],
      typeDiab: json['TypeD'],
      poids: json['Poids'],
    );
  }

  Map<String,dynamic> tomap()=> {
    "uid": uid,
    "name" : name,
    "dateNais": dateNais,
    "numTel" : numTel,
    "email" : email,
    "typeDiab" : typeDiab,
    "poids": poids,
  };
}
