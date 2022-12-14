
import 'package:campus_team_up/ui/login_sign_up_page/loginSignUpPage.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/observers/route_observer.dart';
import 'package:campus_team_up/ui/root/root.dart';

class RouteManager {
  final routes = [
    GetPage(name: '/home', page: () => LoginSignUpPage()),
    GetPage(name: '/login', page: () => LoginSignUpPage()),
    GetPage(name: '/signUp', page: () => LoginSignUpPage()),

    //keep this in the end
    GetPage(name: '/', page: () => const Root()),
  ];
  String get initialRoute => '/';
  GetPage get unknownRoute => routes.first;

  void routingCallback(Routing? routing) {}
}
