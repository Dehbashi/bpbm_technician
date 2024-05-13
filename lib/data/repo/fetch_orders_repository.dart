import 'package:bpbm_technician/data/models/orders/detail_order.dart';
import 'package:bpbm_technician/data/models/orders/order_model.dart';
import 'package:bpbm_technician/data/source/fetch_orders_data_source.dart';

final fetchOrdersRepository =
    FetchOrdersRespository(dataSource: FetchOrdersRemoteDataSource());

abstract class IFetchOrdersRepository {
  Future<List<Order>> fetchOrders();
  Future<OrderDetails> fetchOrderDetails({required int id});
}

class FetchOrdersRespository implements IFetchOrdersRepository {
  final IFetchOrdersDataSource dataSource;

  const FetchOrdersRespository({required this.dataSource});

  @override
  Future<List<Order>> fetchOrders() async {
    return dataSource.fetchOrders();
  }

  @override
  Future<OrderDetails> fetchOrderDetails({required int id}) async {
    return dataSource.fetchOrderDetails(id: id);
  }
}
