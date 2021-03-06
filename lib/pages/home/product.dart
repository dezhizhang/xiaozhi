/*
 * :file description: 
 * :name: /xiaozhi/lib/pages/home/product.dart
 * :author: 张德志
 * :copyright: (c) 2021, Tungee
 * :date created: 2021-05-28 17:52:05
 * :last editor: 张德志
 * :date last edited: 2021-06-13 21:32:49
 */
import 'dart:ui';
import 'package:flutter/material.dart';
import '../../services/service.dart';
import '../../utils/utils.dart';
import '../../model/product.dart';

class ProductWidget extends StatefulWidget {
  _ProductWidget createState() => _ProductWidget();
}

class _ProductWidget extends State<ProductWidget> {
  List<ProductModelItem> list = [];
  @override
  void initState() {
    super.initState();
    this.getProductList();
  }

  getProductList() async {
    var res = await Service().getProductInfo({"page": 1});
    var proudct = ProductModel.fromJson(res.data);
    if (proudct.code == 200) {
      var list = proudct.data;
      setState(() {
        this.list = list;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Padding(
      padding: EdgeInsets.all(
        ScreenAdapter.width(20),
      ),
      child: Wrap(
        runSpacing: 10,
        spacing: 10,
        children: list.map((item) => ProductItem(item)).toList(),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  var item;
  ProductItem(ProductModelItem this.item) : super();
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Container(
      width: (ScreenAdapter.screenWidth() - ScreenAdapter.width(60)) / 2,
      padding: EdgeInsets.all(ScreenAdapter.height(10)),
      decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(233, 233, 233, 0.9),
            width: ScreenAdapter.width(1),
          ),
          color: Colors.white),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/detail');
        },
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                width: double.infinity,
                // height: ScreenAdapter.height(360),
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image.network(
                    this.item.url,
                    fit: BoxFit.cover,
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(top: ScreenAdapter.height(10)),
              child: Text(
                this.item.title,
                textAlign: TextAlign.left,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: ScreenAdapter.height(10)),
              child: Text(
                this.item.subTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black54,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: ScreenAdapter.height(10)),
              child: Stack(
                children: <Widget>[
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: ScreenAdapter.width(20)),
                        child: Text(
                          "￥${this.item.price}",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                          ),
                        ),
                      )),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: ScreenAdapter.width(20)),
                      child: Text(
                        "￥${this.item.oldPrice}",
                        style: TextStyle(
                            color: Colors.black54,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
