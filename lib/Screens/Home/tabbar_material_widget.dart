import 'package:appf/page/TodaysData.dart';
import 'package:flutter/material.dart';

import 'Editer.dart';

class TabBarMaterialWidget extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedTab;

  const TabBarMaterialWidget(Widget pag, {
     required this.index,
    required this.onChangedTab,
     Key? key,
  }) : super(key: key);

  @override
  _TabBarMaterialWidgetState createState() => _TabBarMaterialWidgetState();
}

class _TabBarMaterialWidgetState extends State<TabBarMaterialWidget> {
  @override
  Widget build(BuildContext context) {
    final placeholder = Opacity(
      opacity: 0,
      child: IconButton(icon: Icon(Icons.no_cell), onPressed: null),
    );

    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         
          buildTabItem(
            index: 0,
            icon: Icon(Icons.home_outlined),
          ),
          placeholder,
          IconButton(
            icon: Icon(Icons.today_outlined),
             onPressed: () {  
                  Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TodaysData()));
             },
          
          ),
        
        ],
      ),
    );
  }

  Widget buildTabItem({
    required int index,
    required Icon icon,
  }) {
    final isSelected = index == widget.index;

    return IconTheme(
      data: IconThemeData(
        color: isSelected ?           Color.fromRGBO(65, 106, 190, 1)
 : Colors.black,
      ),
      child: IconButton(
        icon: icon,
        onPressed: () => widget.onChangedTab(index),
      ),
    );
  }
}
