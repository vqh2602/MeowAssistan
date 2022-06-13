import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:meowassistan/screen/home/homeControlScreen.dart';

import '../../Color/colors.dart';
import '../../repository/userRepository.dart';
import 'accountScreen.dart';
import 'homeSpinWheel.dart';

class HomeScreen extends StatefulWidget{
  UserRepository userRepository;
  HomeScreen({Key? key, required this.userRepository}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return _MyHomeScreen();
  }

}
class _MyHomeScreen extends State<HomeScreen>  with TickerProviderStateMixin {
  UserRepository get userRepository => widget.userRepository;
  late TabController? _tabController;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    print('ckeck usser: ${userRepository.getUser()}');


  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar:
      Container(
        margin: const EdgeInsets.only(left: 15,right: 15,bottom: 15,top: 5),
        decoration: BoxDecoration(
          ////colorF6F6F6()
          color: colorF6F6F6(),
          borderRadius: BorderRadius.circular(50),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            margin: const EdgeInsets.all(10),
            child: DefaultTabController(
              length: 3,
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colorPinkFf758c(),
                      colorPinkFf7eb3(),
                    ],
                  ),
                  // color: Colors.green,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: colorPinkFf758c(),
                tabs:const [
                  Tab(
                    icon: Icon(Ionicons.home_outline,size: 30,),
                  ),
                  Tab(
                    icon: Icon(Icons.paid,size: 40,),
                  ),
                  Tab(
                    icon: Icon(Ionicons.person_outline,size: 30,),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        // danh sach màn hình
        children:<Widget> [
          HomeControlScreen(userRepository: widget.userRepository),
          HomeSpinWheel(userRepository: widget.userRepository),
          AccountScreen(userRepository: widget.userRepository,),
        ],
      ),
    );
  }

}