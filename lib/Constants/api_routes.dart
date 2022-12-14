const String imageBaseUrl =
    'http://192.168.100.133:8080/mia-society-app-laravel-api/public/storage/';

class Api {
  static const String baseUrl = 'http://192.168.100.16:8080/api/';
  static const String login = baseUrl + "login";
  static const String report_to_admin = baseUrl + "reporttoadmin";
  static const String admin_reports = baseUrl + "adminreports";
  static const String updatereportstatus = baseUrl + "updatereportstatus";
  static const String historyreports = baseUrl + "historyreports";
  static const String viewallnoticesapi = baseUrl + "viewallnotices";
  static const String viewevent = baseUrl + "event/events";
  static const String viewpreapproveentryreports =
      baseUrl + "viewpreapproveentryreports";
  static const String view_all_societies =
      baseUrl + "society/viewsocietiesforresidents";
  static const String view_all_phases = baseUrl + "viewphasesforresidents";
  static const String view_all_floors = baseUrl + "viewfloorsforresidents";
  static const String view_all_apartments = baseUrl + "viewapartmentsforresidents";
  
  
  static const String view_all_blocks = baseUrl + "viewblocksforresidents";

  static const String view_all_streets = baseUrl + "viewstreetsforresidents";

  static const String view_all_houses = baseUrl + "viewhousesforresidents";

  static const String registerresident = baseUrl + "registerresident";
  static const String registerbuildingresident = baseUrl + "registerbuildingresident";
  
  

  static const String signup = baseUrl + "register";
}
