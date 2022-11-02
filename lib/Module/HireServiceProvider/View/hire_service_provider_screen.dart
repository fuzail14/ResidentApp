import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:userapp/Module/HireServiceProvider/View/hireserviceproviderscreen_custom_search_delegate.dart';
import 'package:userapp/Routes/set_routes.dart';
import 'package:userapp/Utils/constants.dart';

class HireServiceProviderScreen extends StatefulWidget {
  const HireServiceProviderScreen({Key? key}) : super(key: key);

  @override
  State<HireServiceProviderScreen> createState() =>
      _HireServiceProviderScreenState();
}

class _HireServiceProviderScreenState extends State<HireServiceProviderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  showSearch(
                      context: context,
                      delegate:
                          HireServiceProviderScreenCustomSearchDelegate());
                },
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )),
        ],
        title: Text('Service Provider'),
        automaticallyImplyLeading: false,
        backgroundColor: overallcolor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.450,
                child: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 5,
                    shadowColor: Colors.black,
                    color: HexColor("#FFFBE8"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage('assets/k.webp'),
                                  //NetworkImage
                                  radius: 60,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    'Name',
                                    style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Column(children: [Text('Hamza')]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Column(children: [Text('Role: Cook')]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Column(
                                      children: [Text('Experience: 2Years')]),
                                ),
                              ],
                            ),
                          ), //Text
                          Container(
                            width: double.infinity,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 80),
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.toNamed(
                                      hireserviceproviderviewprofilescreen);
                                },

                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Text(
                                    'VIEW PROFILE',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ), //Padding
                              ),
                            ),
                          )
                        ])),
              );
            },
            itemCount: 5,
          ),
        ),
      ),
    );
  }
}
