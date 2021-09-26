
class Actphy{

  String date;
  String e_pat;
  int nb_pas;

  Actphy({
      required this.date, required this.e_pat, required this.nb_pas,
  });

factory Actphy.fromJson(Map<String, dynamic> json){
    return Actphy(
      
      date: json['date'],
      nb_pas: json['nb_pas'],
      e_pat: json['e_pat'],
      
     
       
    );
  }

Map<String,dynamic>toMap(){
    return {
     "date" :date,
     "e_pat":e_pat,
     "nb_pas":nb_pas,
    };
  }


}