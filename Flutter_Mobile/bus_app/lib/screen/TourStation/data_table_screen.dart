
import 'package:flutter/material.dart';



class DataTableScreen extends StatelessWidget {

  final List<Map<String, dynamic>> filteredData;

   const DataTableScreen({
    Key? key,
    required this.filteredData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width,
        ),
        child: DataTable(
          headingRowColor: const MaterialStatePropertyAll(Colors.blue),
          dataRowColor: const MaterialStatePropertyAll(Color(0xFFf7f2f9)),


          columns: const [
            DataColumn(label: Text("المدينة", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15))),
            DataColumn(label: Text("رقم الاتوبيس", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15))),
            DataColumn(label: Text("المناطق", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15))),
            DataColumn(label: Text("السعر", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15))),
          ],
          rows: List<DataRow>.generate(
            filteredData.length,
                (index) => DataRow(


              cells: [
                DataCell(Text(filteredData[index]['City'].toString())),
                DataCell(Text(filteredData[index]['Route Number'].toString())),
                DataCell(Text(filteredData[index]['Stations'].join(','))),
                DataCell(Text(filteredData[index]['Price'].toString())),
              ],
            ),
          ),
        ),
      ),
    );

  }
}