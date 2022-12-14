import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:campus_team_up/ui/root/rootLogic.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  void initState() {
    super.initState();
    final logic = Get.put(RootLogic());
    logic.checkPermission();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.offAndToNamed('/home');
    });
  }



  @override
  Widget build(BuildContext context) {
    
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
