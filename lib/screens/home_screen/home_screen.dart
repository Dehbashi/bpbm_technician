import 'package:bpbm_technician/screens/home_screen/widgets/home_screen_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bpbm_technician/blocs/order_bloc/order_bloc.dart';
import 'package:bpbm_technician/screens/home_screen/widgets/orders_container.dart';
import 'package:bpbm_technician/screens/home_screen/widgets/user_name_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserNameWidget(),
        BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            if (state is OrderLoading) {
              return CupertinoActivityIndicator();
            } else if (state is OrderEmpty) {
              return Text('سفارشی وجود ندارد');
            } else if (state is OrderFailed) {
              return Expanded(
                child: Center(
                  child: Text(
                    state.message,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red[800],
                        fontSize: 20),
                  ),
                ),
              );
            } else if (state is OrderSuccess) {
              final orders = state.orders;
              return Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      final indexFromLast = orders.length - index - 1;
                      final order = orders[indexFromLast];

                      return OrdersContainer(
                        order: order,
                      );
                    },
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
        SizedBox(
          height: 20,
        ),
        HomeScreenButtons(),
      ],
    );
  }
}
