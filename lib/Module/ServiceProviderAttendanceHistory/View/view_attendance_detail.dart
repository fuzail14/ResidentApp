import 'package:flutter/material.dart';
import 'package:userapp/Utils/constants.dart';


class ViewAttendanceDetailScreen extends StatefulWidget {
  const ViewAttendanceDetailScreen({Key? key}) : super(key: key);

  @override
  State<ViewAttendanceDetailScreen> createState() =>
      _ViewAttendanceDetailScreenState();
}

class _ViewAttendanceDetailScreenState
    extends State<ViewAttendanceDetailScreen> {
  List<Map> _gatekeepers = [
    {
      'date': currentdate,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'checkin': CurrentTime,
      'checkout': CurrentTime,
    },
    {
      'date': currentdate,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'checkin': CurrentTime,
      'checkout': CurrentTime,
    },
    {
      'date': currentdate,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'checkin': CurrentTime,
      'checkout': CurrentTime,
    },

    {
      'date': currentdate,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'checkin': CurrentTime,
      'checkout': CurrentTime,
    },
    {
      'date': currentdate,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'checkin': CurrentTime,
      'checkout': CurrentTime,
    },
    {
      'date': currentdate,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'checkin': CurrentTime,
      'checkout': CurrentTime,
    },
    {
      'date': currentdate,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'checkin': CurrentTime,
      'checkout': CurrentTime,
    },
    {
      'date': currentdate,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'checkin': CurrentTime,
      'checkout': CurrentTime,
    },
    {
      'date': currentdate,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'checkin': CurrentTime,
      'checkout': CurrentTime,
    },
    {
      'date': currentdate,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'checkin': CurrentTime,
      'checkout': CurrentTime,
    },
    {
      'date': currentdate,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'checkin': CurrentTime,
      'checkout': CurrentTime,
    },
    {
      'date': currentdate,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'checkin': CurrentTime,
      'checkout': CurrentTime,
    },
    {
      'date': currentdate,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'checkin': CurrentTime,
      'checkout': CurrentTime,
    },
    {
      'date': currentdate,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'checkin': CurrentTime,
      'checkout': CurrentTime,
    },
    {
      'date': currentdate,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'checkin': CurrentTime,
      'checkout': CurrentTime,
    },

    {
      'date': currentdate,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'checkin': CurrentTime,
      'checkout': CurrentTime,
    },
    {
      'date': currentdate,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'checkin': CurrentTime,
      'checkout': CurrentTime,
    },
    {
      'date': currentdate,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'checkin': CurrentTime,
      'checkout': CurrentTime,
    },
    {
      'date': currentdate,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'checkin': CurrentTime,
      'checkout': CurrentTime,
    },
    {
      'date': currentdate,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'checkin': CurrentTime,
      'checkout': CurrentTime,
    },
    {
      'date': currentdate,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'checkin': CurrentTime,
      'checkout': CurrentTime,
    },
    {
      'date': currentdate,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'checkin': CurrentTime,
      'checkout': CurrentTime,
    },
    {
      'date': currentdate,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'checkin': CurrentTime,
      'checkout': CurrentTime,
    },
    {
      'date': currentdate,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'checkin': CurrentTime,
      'checkout': CurrentTime,
    },
    {
      'date': currentdate,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'checkin': CurrentTime,
      'checkout': CurrentTime,
    },
    {
      'date': currentdate,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'checkin': CurrentTime,
      'checkout': CurrentTime,
    },
    {
      'date': currentdate,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'checkin': CurrentTime,
      'checkout': CurrentTime,
    },
    {
      'date': currentdate,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'checkin': CurrentTime,
      'checkout': CurrentTime,
    },
    {
      'date': currentdate,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'checkin': CurrentTime,
      'checkout': CurrentTime,
    },
    {
      'date': currentdate,
      'name': 'Noman Awan',
      'cnic': '34848854594595',
      'address': 'NE 728',
      'checkin': CurrentTime,
      'checkout': CurrentTime,
    },
    
  ];

  List<DataColumn> userDataColumn = [
    const DataColumn(label: Text("DATE")),
    const DataColumn(label: Text("Name")),
    const DataColumn(label: Text("CNIC")),
    const DataColumn(label: Text("Address")),
    const DataColumn(label: Text("CHECK-IN ")),
    const DataColumn(label: Text("CHECKOUT")),
  ];

  List<DataRow> userDataRows() {
    return _gatekeepers
        .map(
          (e) => DataRow(cells: [
            DataCell(Text(e['date'].toString())),
            DataCell(Text(e['name'].toString())),
            DataCell(Text(e['cnic'].toString())),
            DataCell(Text(e['address'].toString())),
            
            DataCell(Text(e['checkin'].toString())),
            DataCell(Text(e['checkout'].toString())),
            
          ]),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: overallcolor,
        automaticallyImplyLeading: false,
        title: const Text("Attendance Detail"),
     
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
               decoration: BoxDecoration(border: Border.all(color: 
              Colors.lightBlue, width: 8)),
              
              columns: userDataColumn,
              rows: userDataRows(),
              
              
            )),
      ),
    );
  }
}
