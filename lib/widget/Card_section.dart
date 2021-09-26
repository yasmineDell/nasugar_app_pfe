import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const copy.dart';
import 'custom_cliper.dart';

class CardSection extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final String time;
  final ImageProvider image;
  final bool isDone;

  CardSection(
      {Key? key,
      required this.title,
      required this.value,
      required this.unit,
      required this.time,
      required this.image,
      required this.isDone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Align(
        alignment: Alignment.topLeft,
        child: Container(
            margin: const EdgeInsets.only(right: 10.0),
            width: 230,

            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(35.0)),//17
              shape: BoxShape.rectangle,
              color: Colors.white,
             border: Border.all(
      color: Color(0x5B3576AA).withOpacity(0.1),
      width: 1,
    ),
                   // boxShadow: Color(0x802196F3),
              boxShadow: [
      BoxShadow(
        color: Color(0x5B3576AA).withOpacity(0.1),
        spreadRadius: 1,
       //blurRadius: 7,
       // offset: Offset(1, 0), // changes position of shadow
      ),
    ],

            ),
            child: Stack(
              overflow: Overflow.clip,
              children: <Widget>[
                // Positioned(
                //     child: ClipPath(
                //         clipper: MyCustomClipper(clipType: ClipType.semiCircle),
                //         child: Container(
                //           decoration: new BoxDecoration(
                //             borderRadius: BorderRadius.all(Radius.circular(10.0)),
                //             color:Color.fromRGBO(11,44,135,1).withOpacity(0.1)// Constants.lightBlue.withOpacity(0.1),
                //           ),
                //           height: 90,
                //           width: 90,
                //         ),
                //     ),
                // ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                      
                          Text(
                              time,
                              style: TextStyle(
                                  fontSize: 15,
                                 color: Colors.black54
                                 // color: Constants.textPrimary
                              ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                              Image(
                            image: image,
                            width: 45,
                            height: 45,
                            //color: Theme.of(context).accentColor,
                          ),
                          SizedBox(width:10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(title,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 20,
                                       // fontWeight: FontWeight,
                                        color: Color.fromRGBO(11,44,135,0.8)
                                    ),
                                ),
                                SizedBox(height: 5),
                                Text('$value $unit',
                                    style: TextStyle(
                                        fontSize: 13.5,
                                        color: Colors.black54
                                    ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          // InkWell(
                          //   child: Container(
                          //     decoration: new BoxDecoration(
                          //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          //       shape: BoxShape.rectangle,
                          //       color: isDone ? Theme.of(context).accentColor : Color(0xFFF0F4F8),
                          //     ),
                          //     width: 44,
                          //     height: 44,
                          //     child: Center(
                          //       child: Icon(
                          //         Icons.check,
                          //         color: isDone ? Colors.white : Theme.of(context).accentColor,
                          //       ),
                          //     ),
                          //   ),
                          //   onTap: () {
                          //     debugPrint("Button clicked. Handle button setState");
                          //   },
                          // )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
        ),
    );
  }
}