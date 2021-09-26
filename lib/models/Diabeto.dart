class Diabeto{

late String mId, 
fullname, adress , phoneNumber , emailadrs ;  //password
static late  Diabeto currentUser;




  Diabeto(
    {
     // required this.mId,
      required this.fullname,
      required this.phoneNumber,
      required this.emailadrs,
      required this.adress,
    
    }
  );

  factory Diabeto.fromJson(Map<String, dynamic> json, {Reference}){
    return Diabeto(
      //mId: json['UID'],
      fullname: json['Nom'],
      
      phoneNumber: json['NumTel'],
      emailadrs: json['Email'],
       adress: json['Adresse'],
      
    );
  }

  Map<String,dynamic> tomap()=> {
    //"uid": mId,
    "Nom" : fullname,
  
    "NumTel" : phoneNumber,
    "email" : emailadrs,
    "Adresse": adress,
  };





}




