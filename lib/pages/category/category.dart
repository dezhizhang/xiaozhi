import 'dart:ui';
import 'package:flutter/material.dart';
import '../../services/service.dart';
import '../../utils/utils.dart';
import '../../model/category.dart';

class Category extends StatefulWidget{
  _Category createState() => _Category();
}

class _Category extends State<Category>{
    List<CategoryModelItem> list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getCategoryList();
  }
  getCategoryList() async{
    var res = await Service().getCategoryInfo();
    var category = CategoryModel.fromJson(res.data);
    if(category.code == 200) {
       var list = category.data;
       setState(() {
         this.list = list;
       });
    }
  }
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Row(
      children: <Widget>[
        Container(
          color: Colors.white,
          width: ScreenAdapter.width(160),
          height: double.infinity,
          child: ListView.builder(
            itemCount: this.list.length,
            itemBuilder: (context,index) {
              return Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {

                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: ScreenAdapter.height(56),
                      child: Text(
                        this.list[index].title,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Divider(),
                ],
              );
            }
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Color.fromRGBO(240, 246, 246, 0.9),
            height: double.infinity,
            padding: EdgeInsets.fromLTRB(ScreenAdapter.width(10), 0, ScreenAdapter.width(10), 0),
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1/1.2,
                  crossAxisSpacing: ScreenAdapter.width(10),
                  mainAxisSpacing: ScreenAdapter.width(10),
                ),
                itemCount: 10,
                itemBuilder: (context,index) {
                  return Container(
                    // decoration: BoxDecoration(
                    //   border:Border.all(
                    //     color:Color.fromRGBO(240, 246, 246, 0.9),
                    //     width: ScreenAdapter.width(1)
                    //   )
                    // ),
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 1 / 1,
                          child: Image.network(
                            'http://tugua.oss-cn-hangzhou.aliyuncs.com/1600737225621499.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: ScreenAdapter.height(28),
                          child: Text('女装'),
                        )
                      ],
                    ),
                  );
                }
              ),
            ),
          ),
        )
      ],
    );
  }
}