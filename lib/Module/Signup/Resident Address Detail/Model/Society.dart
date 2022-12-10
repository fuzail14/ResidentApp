import 'dart:convert';

/// data : [{"id":25,"societyname":"393931","societyaddress":"3939","userid":1,"created_at":"2022-09-09T15:06:39.000000Z","updated_at":"2022-09-09T15:06:39.000000Z"},{"id":26,"societyname":"s92993","societyaddress":"9393","userid":1,"created_at":"2022-09-09T15:10:18.000000Z","updated_at":"2022-09-09T15:10:18.000000Z"},{"id":27,"societyname":"838eu","societyaddress":"euee","userid":1,"created_at":"2022-09-09T15:21:15.000000Z","updated_at":"2022-09-09T15:21:15.000000Z"},{"id":28,"societyname":"ww9w9w","societyaddress":"9w9w","userid":1,"created_at":"2022-09-09T15:21:23.000000Z","updated_at":"2022-09-09T15:21:23.000000Z"},{"id":29,"societyname":"hwehhj","societyaddress":"rjrj","userid":1,"created_at":"2022-09-09T16:16:57.000000Z","updated_at":"2022-09-09T16:16:57.000000Z"},{"id":30,"societyname":"3j31","societyaddress":"3j3","userid":1,"created_at":"2022-09-09T16:43:11.000000Z","updated_at":"2022-09-09T16:43:11.000000Z"},{"id":31,"societyname":"2","societyaddress":"2","userid":1,"created_at":"2022-09-09T16:43:29.000000Z","updated_at":"2022-09-09T16:43:29.000000Z"},{"id":32,"societyname":"99`","societyaddress":"3883","userid":1,"created_at":"2022-09-10T03:43:17.000000Z","updated_at":"2022-09-10T03:43:17.000000Z"}]

class Society {
  final int? id;
   String? name;
  final String? address;
  final String? country;
  final String? state;
  final String? city;
  final String? type;

  Society({
    required this.id,
    required this.name,
    required this.address,
    required this.country,
    required this.state,
    required this.city,
    required this.type,
  });
}
