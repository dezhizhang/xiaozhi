import 'package:flutter/material.dart';
import '../../utils/utils.dart';

class ProductTabBar extends StatefulWidget {
  int index;
  String title;
  Color color;
  final ValueChanged<int> changeColorCallBack;
  ProductTabBar({Key key,this.title,this.index,this.changeColorCallBack,this.color}):super(key: key);
  _ProductTabBar createState() => _ProductTabBar(this.title,this.index,this.color,this.changeColorCallBack,);
}

class _ProductTabBar extends State<ProductTabBar> {
  int index;
  String title;
  int activeIndex = 0;
  Color color;
  final ValueChanged<int> changeColorCallBack;

  _ProductTabBar(this.title,this.index,this.color,this.changeColorCallBack);
  @override
  
  Widget build(BuildContext context) {
    // TODO: implement build
    print(activeIndex);
    return Expanded(
      flex: 1,
      child:InkWell(
        onTap: () {
          changeColorCallBack(index);
          setState(() {
            this.activeIndex = index;
          });
        },
        child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: this.color
            )
          )
        ),
        alignment: Alignment.center,
        height: ScreenAdapter.height(80),
        child: Text(this.title)
        ),
      ),
    );
  }
}
