import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

const splashlogo = 'assets/mia.png';
const userpic = 'assets/k.webp';
const userpic2 = 'assets/kk.webp';
const glass = 'assets/g1.webp';
final Color overallcolor1 = HexColor('#00BFA6');

final Color overallcolor = HexColor('#00BFA6');



DateTime dateTime = DateTime.now();
String currentdate = dateTime.toString().split(' ')[0];
TimeOfDay currentTime = TimeOfDay.now();

    var CurrentTime =
        '${currentTime.hour.toString().padLeft(2, '0')}:${currentTime.minute.toString().padLeft(2, '0')}:${currentTime.period.toString().split('.')[1]}';

