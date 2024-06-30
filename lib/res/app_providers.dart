import 'package:provider/provider.dart';

import '../view_model/controller/buy_ticket_controller.dart';
import '../view_model/controller/gallary_controller.dart';
import '../view_model/controller/home_controller.dart';
import '../view_model/controller/register_team_controller.dart';
import '../view_model/controller/robowar_controller.dart';
class AppProviders{
  static List<ChangeNotifierProvider> providers= [
    ChangeNotifierProvider(
      create: (context) => HomeController(),
    ),
    ChangeNotifierProvider(
      create: (context) => GalleryController(),
    ),
    ChangeNotifierProvider(
      create: (context) => BuyTicketController(),
    ),
    ChangeNotifierProvider(
      create: (context) => RegisterTeamController(),
    ),
    ChangeNotifierProvider(
      create: (context) => RoboWarController(),
    ),
  ];
}