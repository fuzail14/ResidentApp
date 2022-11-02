import 'package:get/get.dart';
import 'package:userapp/Module/AddReportToGateKeeper/View/report_to_gatekeeper.dart';
import 'package:userapp/Module/ChatAvailbility/View/chat_availbility_screen.dart';
import 'package:userapp/Module/ChatScreen/View/chat_screen.dart';
import 'package:userapp/Module/Events/View/events_screen.dart';
import 'package:userapp/Module/Events/View/view_event_images_screen.dart';
import 'package:userapp/Module/GuestHistory/View/guests_history_screen.dart';
import 'package:userapp/Module/HireServiceProvider/View/hire_service_provider_screen.dart';
import 'package:userapp/Module/HireServiceProvider/View/hire_service_provider_view_profile.dart';
import 'package:userapp/Module/NoticeBoard/View/notice_board_screen.dart';

import 'package:userapp/Module/Notifications/View/notifications_screen.dart';
import 'package:userapp/Module/PanicMode/View/panic_mode_screen.dart';

import 'package:userapp/Module/ReportToGateKeeper/View/report_to_gatekeeper_screen.dart';
import 'package:userapp/Module/ReportsHistory/View/admin_reports_history_screen.dart';
import 'package:userapp/Module/ServiceProviderAttendanceHistory/View/service_providers_attendance.dart';
import 'package:userapp/Module/ServiceProviderAttendanceHistory/View/view_attendance_detail.dart';
import 'package:userapp/Module/Splash/View/splash_screen.dart';
import 'package:userapp/Routes/screen_binding.dart';
import 'package:userapp/Routes/set_routes.dart';
import 'package:userapp/Widgets/image_show.dart';

import '../Module/HomeScreen/View/home_screen.dart';
import '../Module/Login/View/login_screen.dart';
import '../Module/Report to Sub Admin/View/Admin Reports/admin_reports.dart';
import '../Module/Report to Sub Admin/View/Report to Admin/report_to_admin.dart';


class RouteManagement {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: splashscreen,
        page: () => SplashScreen(),
        binding: ScreenBindings(),
        // transition: Transition.circularReveal,
        //      transitionDuration: Duration(seconds: 1)
      ),
      GetPage(
        name: loginscreen,
        page: () => Login(),
        binding: ScreenBindings(),
        // transition: Transition.circularReveal,
        //      transitionDuration: Duration(seconds: 1)
      ),
      GetPage(
        name: homescreen,
        page: () => HomeScreen(),
        binding: ScreenBindings(),
        // transition: Transition.circularReveal,
        //      transitionDuration: Duration(seconds: 1)
      ),
      GetPage(
        name: eventsscreen,
        page: () => EventsScreen(),
        binding: ScreenBindings(),
        // transition: Transition.circularReveal,
        //      transitionDuration: Duration(seconds: 1)
      ),
      GetPage(
        name: chatscreen,
        page: () => ChatScreen(),
        binding: ScreenBindings(),
        // transition: Transition.circularReveal,
        //      transitionDuration: Duration(seconds: 1)
      ),
      GetPage(
        name: chatavailbilityscreen,
        page: () => ChatAvailbilityScreen(),
        binding: ScreenBindings(),
        // transition: Transition.circularReveal,
        //      transitionDuration: Duration(seconds: 1)
      ),
      GetPage(
        name: reporttoadmin,
        page: () => ReportToAdmin(),
        binding: ScreenBindings(),
        // transition: Transition.circularReveal,
        //      transitionDuration: Duration(seconds: 1)
      ),
      GetPage(
        name: adminreports,
        page: () => AdminReports(),
        binding: ScreenBindings(),
        // transition: Transition.circularReveal,
        //      transitionDuration: Duration(seconds: 1)
      ),
      GetPage(
        name: reporttogatekeeperscreen,
        page: () => GatekeeperReports(),
        binding: ScreenBindings(),
        // transition: Transition.circularReveal,
        //      transitionDuration: Duration(seconds: 1)
      ),
      GetPage(
        name: addreporttogatekeeperscreen,
        page: () => ReportToGateKeeper(),
        binding: ScreenBindings(),
        // transition: Transition.circularReveal,
        //      transitionDuration: Duration(seconds: 1)
      ),
      GetPage(
        name: reportshistoryscreen,
        page: () => ReportsHistoryScreen(),
        binding: ScreenBindings(),
        // transition: Transition.circularReveal,
        //      transitionDuration: Duration(seconds: 1)
      ),
      GetPage(
        name: guestshistoryscreen,
        page: () => GuestsHistoryScreen(),
        binding: ScreenBindings(),
        // transition: Transition.circularReveal,
        //      transitionDuration: Duration(seconds: 1)
      ),
      GetPage(
        name: hireserviceproviderscreen,
        page: () => HireServiceProviderScreen(),
        binding: ScreenBindings(),
        // transition: Transition.circularReveal,
        //      transitionDuration: Duration(seconds: 1)
      ),
      GetPage(
        name: hireserviceproviderviewprofilescreen,
        page: () => HireServiceProviderViewProfileScreen(),
        binding: ScreenBindings(),
        // transition: Transition.circularReveal,
        //      transitionDuration: Duration(seconds: 1)
      ),
      GetPage(
        name: serviceprovidersattendancescreen,
        page: () => ServiceProvidersAttendanceScreen(),
        binding: ScreenBindings(),
        // transition: Transition.circularReveal,
        //      transitionDuration: Duration(seconds: 1)
      ),
      GetPage(
        name: viewattendancedetailscreen,
        page: () => ViewAttendanceDetailScreen(),
        binding: ScreenBindings(),
        // transition: Transition.circularReveal,
        //      transitionDuration: Duration(seconds: 1)
      ),
      GetPage(
        name: panicmodescreen,
        page: () => PanicModeScreen(),
        binding: ScreenBindings(),
        // transition: Transition.circularReveal,
        //      transitionDuration: Duration(seconds: 1)
      ),
      GetPage(
        name: notificationsscreen,
        page: () => NotificationsScreen(),
        binding: ScreenBindings(),
        // transition: Transition.circularReveal,
        //      transitionDuration: Duration(seconds: 1)
      ),
      GetPage(
        name: vieweventimages,
        page: () => ViewEventImages(),
        binding: ScreenBindings(),
        // transition: Transition.circularReveal,
        //      transitionDuration: Duration(seconds: 1)
      ),

      GetPage(
        name: viewimage,
        page: () => ViewImage(),
        binding: ScreenBindings(),
        // transition: Transition.circularReveal,
        //      transitionDuration: Duration(seconds: 1)
      ),

      GetPage(
        name: noticeboardscreen,
        page: () => NoticeBoardScreen(),
        binding: ScreenBindings(),
        // transition: Transition.circularReveal,
        //      transitionDuration: Duration(seconds: 1)
      ),
      
    ];
  }
}
