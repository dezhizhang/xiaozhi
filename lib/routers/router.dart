/*
 * @Author: dezhizhang
 * @Date: 2020-10-25 17:33:26
 * :date last edited: 2021-06-13 21:41:53
 * :last editor: 张德志
 * @Description: 路由页面
 * :name: /xiaozhi/lib/routers/router.dart
 */
import 'package:flutter/material.dart';
import '../pages/tabs/tabs.dart';
import '../pages/product/product.dart';
import '../pages/order/order.dart';
import '../pages/address/address.dart';
import '../pages/address/addressAdd.dart';
import '../pages/information/information.dart';
import '../pages/setting/setting.dart';
import '../pages/system/system.dart';
import '../pages/coupons/coupons.dart';
import '../pages/login/login.dart';
import '../pages/search/search.dart';
import '../pages/integral/integral.dart';
import '../pages/detail/detail.dart';
import '../pages/goods/goods.dart';
import '../pages/advice/advice.dart';
import '../pages/sale/sale.dart';
import '../pages/chat/chat.dart';
import '../pages/test/test.dart';
import '../pages/video/video.dart';
import '../pages/network/network.dart';
import '../pages/scan/scan.dart';
import '../pages/webview/webview.dart';

final routes = {
  '/': (context) => Tabs(),
  '/product': (context, {arguments}) => Product(
        arguments: arguments,
      ),
  '/order': (context) => Order(),
  '/login': (context) => Login(),
  '/address': (context) => Address(),
  '/system': (context) => System(),
  '/serch': (context) => Search(),
  '/coupons': (context) => Coupons(),
  "/setting": (context) => Setting(),
  '/integral': (context) => Integral(),
  '/information': (context) => Information(),
  '/addressAdd': (context) => AddressAdd(),
  '/detail': (context) => Detal(),
  '/goods': (context, {arguments}) => Goods(arguments: arguments),
  '/advice': (context) => Advice(),
  '/sale': (context) => Sale(),
  '/chat': (context) => Chat(),
  '/test': (context) => Test(),
  '/video': (context) => Video(),
  '/network': (context) => Network(),
  '/scan': (context) => Scan(),
  '/webview': (context) => WebView(),
};

var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
