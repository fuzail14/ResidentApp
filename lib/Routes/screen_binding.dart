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
import 'package:userapp/Module/Report%20to%20Sub%20Admin/View/Admin%20Reports/admin_reports.dart';
import 'package:userapp/Module/ReportToGateKeeper/View/report_to_gatekeeper_screen.dart';
import 'package:userapp/Module/ReportsHistory/View/admin_reports_history_screen.dart';
import 'package:userapp/Module/ServiceProviderAttendanceHistory/View/service_providers_attendance.dart';
import 'package:userapp/Module/ServiceProviderAttendanceHistory/View/view_attendance_detail.dart';

import 'package:userapp/Module/Splash/View/splash_screen.dart';
import 'package:userapp/Widgets/image_show.dart';

import '../Module/HomeScreen/View/home_screen.dart';
import '../Module/Login/View/login_screen.dart';
import '../Module/Report to Sub Admin/View/Report to Admin/report_to_admin.dart';


class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreen());
    Get.lazyPut(() => Login());
    Get.lazyPut(() => HomeScreen());
    Get.lazyPut(() => EventsScreen());
    Get.lazyPut(() => ChatScreen());
    Get.lazyPut(() => ChatAvailbilityScreen());
    Get.lazyPut(() => ReportToAdmin());
    Get.lazyPut(() => AdminReports());
    Get.lazyPut(() => GatekeeperReports());
    Get.lazyPut(() => ReportToGateKeeper());
    Get.lazyPut(() => ReportsHistoryScreen());
    Get.lazyPut(() => GuestsHistoryScreen());
    Get.lazyPut(() => HireServiceProviderScreen());

    Get.lazyPut(() => HireServiceProviderViewProfileScreen());

    Get.lazyPut(() => ServiceProvidersAttendanceScreen());

    Get.lazyPut(() => ViewAttendanceDetailScreen());

    Get.lazyPut(() => PanicModeScreen());

    Get.lazyPut(() => NotificationsScreen());

    Get.lazyPut(() => ViewEventImages());

    Get.lazyPut(() => ViewImage());
    Get.lazyPut(() => NoticeBoardScreen());
    
    
    
    
  }
}
