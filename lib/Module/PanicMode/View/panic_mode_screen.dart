import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:userapp/Utils/constants.dart';

import '../Controller/panic_mode_controller.dart';

class PanicModeScreen extends StatefulWidget {
  @override
  State<PanicModeScreen> createState() => _PanicModeScreenState();
}

class _PanicModeScreenState extends State<PanicModeScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Panic Mode"),
        backgroundColor: overallcolor,
        automaticallyImplyLeading: false,
      ),
      body: GetBuilder<PanicModeController>(
        init: PanicModeController(),
        builder: (controller) {
          
        
        return SingleChildScrollView(
          child: Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.all(14),
                width: 200,
                color: Colors.white70,
                child: Image.network(
                  'http://clipart-library.com/images/kcKopp8Xi.png',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            
      
            Container(
              height: MediaQuery.of(context).size.height * 0.25, //140
      
              // color: Colors.amberAccent,
      
              child: GridView.builder(
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 7,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.3),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        controller.selectedProblem(index);
                      
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ( controller.selectedProblemIndex == index)
                                ? overallcolor
                                : Colors.white,
                            border: Border.all(
                                width: 1,
                                color: Color(0xff6B779A).withOpacity(0.10))),
                        child: Center(
                            child: Text(
                           controller.problemsList[index],
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
            controller. selectedProblemIndex == 3
                ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Describe Problem',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  )
                : Container(),
            Center(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.all(20),
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                        child: Text(
                      'Submit Problem',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
            )
          ]),
        );
    }  ),
    );
  }
}
