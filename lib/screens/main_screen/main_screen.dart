import 'package:bpbm_technician/blocs/order_bloc/order_bloc.dart';
import 'package:bpbm_technician/blocs/order_detail_bloc/order_detail_bloc.dart';
import 'package:bpbm_technician/common/constants.dart';
import 'package:bpbm_technician/common/methods/navigator_method.dart';
import 'package:bpbm_technician/screens/home_screen/home_screen.dart';
import 'package:bpbm_technician/screens/main_screen/widgets/drawer_screen.dart';
import 'package:bpbm_technician/screens/main_screen/widgets/main_screen_app_bar.dart';
import 'package:bpbm_technician/screens/order_screen/order_screen.dart';
import 'package:bpbm_technician/screens/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 1;
  final List<int> _history = [];
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<NavigatorState> _homeKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> _orderKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> _profileKey = GlobalKey<NavigatorState>();

  late final map = {
    0: _orderKey,
    1: _homeKey,
    2: _profileKey,
  };

  bool appClose = false;

  void onWillPop(bool didPop) async {
    final NavigatorState currentSelectedTabNavigatorState =
        map[currentIndex]!.currentState!;
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.closeDrawer();
    } else {
      if (currentSelectedTabNavigatorState.canPop()) {
        appClose = false;
        currentSelectedTabNavigatorState.pop();
      } else if (_history.isNotEmpty) {
        setState(() {
          currentIndex = _history.last;
          _history.removeLast();
        });
        print('$_history inside back button');
        appClose = false;
      } else {
        appClose = true;
      }
      if (appClose) {
        SystemNavigator.pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      navigatorMethod(
        key: _orderKey,
        index: 0,
        currentIndex: currentIndex,
        child: OrderScreen(),
      ),
      navigatorMethod(
        key: _homeKey,
        index: 1,
        currentIndex: currentIndex,
        child: HomeScreen(),
      ),
      navigatorMethod(
        key: _profileKey,
        index: 2,
        currentIndex: currentIndex,
        child: ProfileScreen(),
      ),
    ];
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final bloc = OrderBloc();
            bloc.add(OrderStarted());
            return bloc;
          },
        ),
        BlocProvider(create: (context) => OrderDetailBloc())
      ],
      child: PopScope(
        canPop: false,
        onPopInvoked: onWillPop,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: MainScreenAppBar(),
          drawer: DrawerScreen(),
          body: IndexedStack(
            index: currentIndex,
            children: screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            items: bottomNavBarItem,
            onTap: (index) {
              final NavigatorState currentSelectedTabNavigatorState =
                  map[currentIndex]!.currentState!;
              if (index == currentIndex) {
                if (currentSelectedTabNavigatorState.canPop()) {
                  currentSelectedTabNavigatorState.popUntil((_) {
                    return !currentSelectedTabNavigatorState.canPop();
                  });
                }
                return;
              }
              setState(() {
                _history.remove(currentIndex);
                _history.add(currentIndex);
                currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
