import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:userapp/Routes/set_routes.dart';
import 'package:userapp/Utils/constants.dart';

class HireServiceProviderViewProfileScreen extends StatefulWidget {
  @override
  State<HireServiceProviderViewProfileScreen> createState() =>
      _HireServiceProviderViewProfileScreenState();
}

class _HireServiceProviderViewProfileScreenState
    extends State<HireServiceProviderViewProfileScreen> {
  bool timePicked = false;

  var appointmentTime = [
    "09:00 AM To 11:00 AM",
    "11:00 AM To 01:00 PM",
    "01:00 PM To 03:00 PM",
    "03:00 PM To 05:00 PM",
    "05:00 PM To 7:00 PM",
    "07:00 PM To 9:00 PM",
    "09:00 PM To 11:00 PM",
    "11:00 PM To 01:00 PM",
  ];

  int? currentTimeIndex;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Provider Profile'),
        automaticallyImplyLeading: false,
        backgroundColor: overallcolor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 150,
                child: Image(
                  image: AssetImage(
                    'assets/k.webp',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Hamza Iqbal',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Address',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Address',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Phone Number',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '03365067568',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'CNIC',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '37405-7456381-5',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Role',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Cook',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Experience',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '2-YEARS',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'hi ju dsj fjnbhjd',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Monthly Salary',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '20,000-PKR',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Available From',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '09:00 AM',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Available Till: ',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '07:00 PM',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Available Week Days On: ',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Monday Tue Wed Thu Fri Sat Sun',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Cover Houses In One Day: ',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Number Of Houses: 4',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Available Time Slots",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02, //19
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4, //140

                      // color: Colors.amberAccent,

                      child: GridView.builder(
                          itemCount: 8,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 7,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 1.3),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                //changeIndexTimeZone(index);
                                currentTimeIndex = index;
                                //print(controller.appointmentTime[index]);
                                // objModel.time =
                                //     controller.appointmentTime[index];
                                // print(objModel.time);
                                // objModel.patientName = patientName;
                                // objModel.doctorName = doctorName;

                                timePicked = true;
                                setState(() {});
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: (currentTimeIndex == index)
                                        ? overallcolor
                                        : Colors.white,
                                    border: Border.all(
                                        width: 1,
                                        color: Color(0xff6B779A)
                                            .withOpacity(0.10))),
                                child: Center(
                                    child: Text(
                                  appointmentTime[index],
                                  style: TextStyle(

                                      //14

                                      fontFamily: "OpenSansRegular"),
                                  textAlign: TextAlign.center,
                                )),
                              ),
                            );

                          }),
                    ),
                   
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: SizedBox(
                        width: 160,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: overallcolor,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Text(
                            'Save',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            Get.offAllNamed(homescreen);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
