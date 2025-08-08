// import 'package:evently_c15/ui/screens/add_event/add_event.dart';
// import 'package:evently_c15/ui/screens/home/home.dart';
// import 'package:evently_c15/ui/screens/login/login.dart';
// import 'package:evently_c15/ui/screens/register/register.dart';
import 'package:evently_task/screens/events/editEvent.dart';
import 'package:evently_task/screens/events/eventDetails.dart';
import 'package:evently_task/screens/onboarding/onboardingScreen.dart';
import 'package:flutter/material.dart';

import '../login/login.dart';
import '../register/register.dart';
import '../screens/events/add_event.dart';

abstract final class AppRoutes {
  static Route get login {
    return MaterialPageRoute(builder: (_) => const Login());
  }
  static Route get register {
    return MaterialPageRoute(builder: (_) => const Register());
  }

  static Route get addEvent {
    return MaterialPageRoute(builder: (_) => const AddEvent());
  }
static Route get eventDetails{
    return MaterialPageRoute(builder: (_) => const EventDetails());
  }
  static Route get editDetails{
    return MaterialPageRoute(builder: (_) => const EditEvent());
  }

}
