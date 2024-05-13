import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:bpbm_technician/data/models/orders/detail_order.dart';
import 'package:bpbm_technician/data/models/orders/order_model.dart';

abstract class IFetchOrdersDataSource {
  Future<List<Order>> fetchOrders();
  Future<OrderDetails> fetchOrderDetails({required int id});
}

class FetchOrdersRemoteDataSource implements IFetchOrdersDataSource {
  @override
  Future<List<Order>> fetchOrders() async {
    final url =
        Uri.parse('https://s1.lianerp.com/api/public/provider/order/list');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final _token = prefs.getString('token');
    final _ip = prefs.getString('ip');
    final _cellNumber = prefs.getString('cellNumber');
    final _userAgent = prefs.getString('userAgent');
    final headers = {
      'Tokenpublic': 'bpbm',
      'Authorization': 'Bearer $_token',
      'Content-Type': 'application/json',
    };
    final response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> data = jsonData['data']['data'];

      final List<Order> orders = data
          .map((item) => Order.fromJson(item as Map<String, dynamic>))
          .toList();

      return orders;
    } else {
      throw Exception(response.statusCode);
    }
  }

  @override
  Future<OrderDetails> fetchOrderDetails({required int id}) async {
    final url = Uri.parse(
        'https://s1.lianerp.com/api/public/provider/order/show?id=$id');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final _token = prefs.getString('token');
    final _ip = prefs.getString('ip');
    final _cellNumber = prefs.getString('cellNumber');
    final _userAgent = prefs.getString('userAgent');
    final headers = {
      'Tokenpublic': 'bpbm',
      'Authorization': 'Bearer $_token',
      'Content-Type': 'application/json',
    };
    final response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final dynamic data = jsonData['data']['order'];

      final OrderDetails orderDetails =
          OrderDetails.fromJson(data as Map<String, dynamic>);

      return orderDetails;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
