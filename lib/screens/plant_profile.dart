import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fuzzylogic/fuzzylogic.dart';
import 'package:plant_care_system/screens/bluetooth/pages/devices.dart';
import 'package:plant_care_system/screens/fuzzy.dart';
import 'package:plant_care_system/screens/update_info.dart';
import 'dart:async';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_close_app/flutter_close_app.dart';

void main() {
  runApp(const PlantInfo(
    qrResult: '',
  ));
}

class PlantInfo extends StatefulWidget {
  final String qrResult;
  const PlantInfo({Key? key, required this.qrResult}) : super(key: key);

  @override
  State<PlantInfo> createState() {
    return _PlantInfoState();
  }
}

class _PlantInfoState extends State<PlantInfo> {
  late String qrResult = widget.qrResult;

  double widget1Opacity = 0.00;
  double widget2Opacity = 0.00;
  double widget3Opacity = 0.00;
  double widget4Opacity = 0.00;

  @override
  void initState() {
    super.initState();
    qrResult = widget.qrResult;
  }

  // late List<charts.Series<Temp, String>> _seriesBarData;
  // late List<Temp> mydata;
  // _generateData(mydata) {
  //   _seriesBarData = <charts.Series<Temp, String>>[];
  //   _seriesBarData.add(
  //     charts.Series(
  //       domainFn: (Temp temp, _) => temp.time.toString(),
  //       measureFn: (Temp temp, _) => temp.temp,
  //       colorFn: (Temp temp, _) => charts.MaterialPalette.green.shadeDefault,
  //       id: 'Temperature Data',
  //       data: mydata,
  //       labelAccessorFn: (Temp row, _) => row.time,
  //     ),
  //   );
  // }

  // late final Stream<QuerySnapshot> temperature = FirebaseFirestore.instance
  //     .collection('PLANTS')
  //     .doc('aixTxzmX48fGe8g3Uc1S')
  //     .collection('temp_data')
  //     .snapshots();

  late final Stream<QuerySnapshot> plants = FirebaseFirestore.instance
      .collection('PLANTS')
      .where('Plant_Id', isEqualTo: widget.qrResult)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    //FUZZY
// ignore: non_constant_identifier_names
    var TempFz = FzTemp();
// ignore: non_constant_identifier_names
    var HumFz = FzHum();
// ignore: non_constant_identifier_names
    var LumFz = FzLum();
// ignore: non_constant_identifier_names
    var ETrans = ET();

// Add rules.
    var evatrans = FuzzyRuleBase();
    evatrans.addRules([
      //Lum1
      (LumFz.lum1 & TempFz.temp1 & HumFz.hum6) >> (ETrans.et1),
      (LumFz.lum1 & TempFz.temp1 & HumFz.hum5) >> (ETrans.et1),
      (LumFz.lum1 & TempFz.temp1 & HumFz.hum4) >> (ETrans.et1),
      (LumFz.lum1 & TempFz.temp1 & HumFz.hum3) >> (ETrans.et1),
      (LumFz.lum1 & TempFz.temp1 & HumFz.hum2) >> (ETrans.et1),
      (LumFz.lum1 & TempFz.temp1 & HumFz.hum1) >> (ETrans.et2),
      (LumFz.lum1 & TempFz.temp2 & HumFz.hum6) >> (ETrans.et2),
      (LumFz.lum1 & TempFz.temp2 & HumFz.hum5) >> (ETrans.et2),
      (LumFz.lum1 & TempFz.temp2 & HumFz.hum4) >> (ETrans.et2),
      (LumFz.lum1 & TempFz.temp2 & HumFz.hum3) >> (ETrans.et2),
      (LumFz.lum1 & TempFz.temp2 & HumFz.hum2) >> (ETrans.et3),
      (LumFz.lum1 & TempFz.temp2 & HumFz.hum1) >> (ETrans.et3),
      (LumFz.lum1 & TempFz.temp3 & HumFz.hum6) >> (ETrans.et3),
      (LumFz.lum1 & TempFz.temp3 & HumFz.hum5) >> (ETrans.et3),
      (LumFz.lum1 & TempFz.temp3 & HumFz.hum4) >> (ETrans.et3),
      (LumFz.lum1 & TempFz.temp3 & HumFz.hum3) >> (ETrans.et4),
      (LumFz.lum1 & TempFz.temp3 & HumFz.hum2) >> (ETrans.et4),
      (LumFz.lum1 & TempFz.temp3 & HumFz.hum1) >> (ETrans.et4),
      (LumFz.lum1 & TempFz.temp4 & HumFz.hum6) >> (ETrans.et4),
      (LumFz.lum1 & TempFz.temp4 & HumFz.hum5) >> (ETrans.et4),
      (LumFz.lum1 & TempFz.temp4 & HumFz.hum4) >> (ETrans.et5),
      (LumFz.lum1 & TempFz.temp4 & HumFz.hum3) >> (ETrans.et5),
      (LumFz.lum1 & TempFz.temp4 & HumFz.hum2) >> (ETrans.et5),
      (LumFz.lum1 & TempFz.temp4 & HumFz.hum1) >> (ETrans.et5),
      (LumFz.lum1 & TempFz.temp5 & HumFz.hum6) >> (ETrans.et6),
      (LumFz.lum1 & TempFz.temp5 & HumFz.hum5) >> (ETrans.et6),
      (LumFz.lum1 & TempFz.temp5 & HumFz.hum4) >> (ETrans.et6),
      (LumFz.lum1 & TempFz.temp5 & HumFz.hum3) >> (ETrans.et6),
      (LumFz.lum1 & TempFz.temp5 & HumFz.hum2) >> (ETrans.et6),
      (LumFz.lum1 & TempFz.temp5 & HumFz.hum1) >> (ETrans.et7),
      (LumFz.lum1 & TempFz.temp6 & HumFz.hum6) >> (ETrans.et7),
      (LumFz.lum1 & TempFz.temp6 & HumFz.hum5) >> (ETrans.et7),
      (LumFz.lum1 & TempFz.temp6 & HumFz.hum4) >> (ETrans.et7),
      (LumFz.lum1 & TempFz.temp6 & HumFz.hum3) >> (ETrans.et7),
      (LumFz.lum1 & TempFz.temp6 & HumFz.hum2) >> (ETrans.et8),
      (LumFz.lum1 & TempFz.temp6 & HumFz.hum1) >> (ETrans.et8),
      (LumFz.lum1 & TempFz.temp7 & HumFz.hum6) >> (ETrans.et8),
      (LumFz.lum1 & TempFz.temp7 & HumFz.hum5) >> (ETrans.et8),
      (LumFz.lum1 & TempFz.temp7 & HumFz.hum4) >> (ETrans.et8),
      (LumFz.lum1 & TempFz.temp7 & HumFz.hum3) >> (ETrans.et9),
      (LumFz.lum1 & TempFz.temp7 & HumFz.hum2) >> (ETrans.et9),
      (LumFz.lum1 & TempFz.temp7 & HumFz.hum1) >> (ETrans.et9),
      (LumFz.lum1 & TempFz.temp8 & HumFz.hum6) >> (ETrans.et9),
      (LumFz.lum1 & TempFz.temp8 & HumFz.hum5) >> (ETrans.et9),
      (LumFz.lum1 & TempFz.temp8 & HumFz.hum4) >> (ETrans.et9),
      (LumFz.lum1 & TempFz.temp8 & HumFz.hum3) >> (ETrans.et10),
      (LumFz.lum1 & TempFz.temp8 & HumFz.hum2) >> (ETrans.et10),
      (LumFz.lum1 & TempFz.temp8 & HumFz.hum1) >> (ETrans.et10),

      //Lum 2
      (LumFz.lum2 & TempFz.temp1 & HumFz.hum6) >> (ETrans.et1),
      (LumFz.lum2 & TempFz.temp1 & HumFz.hum5) >> (ETrans.et1),
      (LumFz.lum2 & TempFz.temp1 & HumFz.hum4) >> (ETrans.et1),
      (LumFz.lum2 & TempFz.temp1 & HumFz.hum3) >> (ETrans.et1),
      (LumFz.lum2 & TempFz.temp1 & HumFz.hum2) >> (ETrans.et1),
      (LumFz.lum2 & TempFz.temp1 & HumFz.hum1) >> (ETrans.et2),
      (LumFz.lum2 & TempFz.temp2 & HumFz.hum6) >> (ETrans.et2),
      (LumFz.lum2 & TempFz.temp2 & HumFz.hum5) >> (ETrans.et2),
      (LumFz.lum2 & TempFz.temp2 & HumFz.hum4) >> (ETrans.et2),
      (LumFz.lum2 & TempFz.temp2 & HumFz.hum3) >> (ETrans.et2),
      (LumFz.lum2 & TempFz.temp2 & HumFz.hum2) >> (ETrans.et3),
      (LumFz.lum2 & TempFz.temp2 & HumFz.hum1) >> (ETrans.et3),
      (LumFz.lum2 & TempFz.temp3 & HumFz.hum6) >> (ETrans.et3),
      (LumFz.lum2 & TempFz.temp3 & HumFz.hum5) >> (ETrans.et3),
      (LumFz.lum2 & TempFz.temp3 & HumFz.hum4) >> (ETrans.et3),
      (LumFz.lum2 & TempFz.temp3 & HumFz.hum3) >> (ETrans.et4),
      (LumFz.lum2 & TempFz.temp3 & HumFz.hum2) >> (ETrans.et4),
      (LumFz.lum2 & TempFz.temp3 & HumFz.hum1) >> (ETrans.et4),
      (LumFz.lum2 & TempFz.temp4 & HumFz.hum6) >> (ETrans.et4),
      (LumFz.lum2 & TempFz.temp4 & HumFz.hum5) >> (ETrans.et5),
      (LumFz.lum2 & TempFz.temp4 & HumFz.hum4) >> (ETrans.et5),
      (LumFz.lum2 & TempFz.temp4 & HumFz.hum3) >> (ETrans.et5),
      (LumFz.lum2 & TempFz.temp4 & HumFz.hum2) >> (ETrans.et5),
      (LumFz.lum2 & TempFz.temp4 & HumFz.hum1) >> (ETrans.et5),
      (LumFz.lum2 & TempFz.temp5 & HumFz.hum6) >> (ETrans.et6),
      (LumFz.lum2 & TempFz.temp5 & HumFz.hum5) >> (ETrans.et6),
      (LumFz.lum2 & TempFz.temp5 & HumFz.hum4) >> (ETrans.et6),
      (LumFz.lum2 & TempFz.temp5 & HumFz.hum3) >> (ETrans.et6),
      (LumFz.lum2 & TempFz.temp5 & HumFz.hum2) >> (ETrans.et6),
      (LumFz.lum2 & TempFz.temp5 & HumFz.hum1) >> (ETrans.et7),
      (LumFz.lum2 & TempFz.temp6 & HumFz.hum6) >> (ETrans.et7),
      (LumFz.lum2 & TempFz.temp6 & HumFz.hum5) >> (ETrans.et7),
      (LumFz.lum2 & TempFz.temp6 & HumFz.hum4) >> (ETrans.et7),
      (LumFz.lum2 & TempFz.temp6 & HumFz.hum3) >> (ETrans.et7),
      (LumFz.lum2 & TempFz.temp6 & HumFz.hum2) >> (ETrans.et8),
      (LumFz.lum2 & TempFz.temp6 & HumFz.hum1) >> (ETrans.et8),
      (LumFz.lum2 & TempFz.temp7 & HumFz.hum6) >> (ETrans.et8),
      (LumFz.lum2 & TempFz.temp7 & HumFz.hum5) >> (ETrans.et8),
      (LumFz.lum2 & TempFz.temp7 & HumFz.hum4) >> (ETrans.et8),
      (LumFz.lum2 & TempFz.temp7 & HumFz.hum3) >> (ETrans.et9),
      (LumFz.lum2 & TempFz.temp7 & HumFz.hum2) >> (ETrans.et9),
      (LumFz.lum2 & TempFz.temp7 & HumFz.hum1) >> (ETrans.et9),
      (LumFz.lum2 & TempFz.temp8 & HumFz.hum6) >> (ETrans.et9),
      (LumFz.lum2 & TempFz.temp8 & HumFz.hum5) >> (ETrans.et9),
      (LumFz.lum2 & TempFz.temp8 & HumFz.hum4) >> (ETrans.et9),
      (LumFz.lum2 & TempFz.temp8 & HumFz.hum3) >> (ETrans.et10),
      (LumFz.lum2 & TempFz.temp8 & HumFz.hum2) >> (ETrans.et10),
      (LumFz.lum2 & TempFz.temp8 & HumFz.hum1) >> (ETrans.et10),

      //Lum3
      (LumFz.lum3 & TempFz.temp1 & HumFz.hum6) >> (ETrans.et1),
      (LumFz.lum3 & TempFz.temp1 & HumFz.hum5) >> (ETrans.et1),
      (LumFz.lum3 & TempFz.temp1 & HumFz.hum4) >> (ETrans.et1),
      (LumFz.lum3 & TempFz.temp1 & HumFz.hum3) >> (ETrans.et1),
      (LumFz.lum3 & TempFz.temp1 & HumFz.hum2) >> (ETrans.et1),
      (LumFz.lum3 & TempFz.temp1 & HumFz.hum1) >> (ETrans.et2),
      (LumFz.lum3 & TempFz.temp2 & HumFz.hum6) >> (ETrans.et2),
      (LumFz.lum3 & TempFz.temp2 & HumFz.hum5) >> (ETrans.et2),
      (LumFz.lum3 & TempFz.temp2 & HumFz.hum4) >> (ETrans.et2),
      (LumFz.lum3 & TempFz.temp2 & HumFz.hum3) >> (ETrans.et2),
      (LumFz.lum3 & TempFz.temp2 & HumFz.hum2) >> (ETrans.et3),
      (LumFz.lum3 & TempFz.temp2 & HumFz.hum1) >> (ETrans.et3),
      (LumFz.lum3 & TempFz.temp3 & HumFz.hum6) >> (ETrans.et3),
      (LumFz.lum3 & TempFz.temp3 & HumFz.hum5) >> (ETrans.et3),
      (LumFz.lum3 & TempFz.temp3 & HumFz.hum4) >> (ETrans.et3),
      (LumFz.lum3 & TempFz.temp3 & HumFz.hum3) >> (ETrans.et4),
      (LumFz.lum3 & TempFz.temp3 & HumFz.hum2) >> (ETrans.et4),
      (LumFz.lum3 & TempFz.temp3 & HumFz.hum1) >> (ETrans.et4),
      (LumFz.lum3 & TempFz.temp4 & HumFz.hum6) >> (ETrans.et4),
      (LumFz.lum3 & TempFz.temp4 & HumFz.hum5) >> (ETrans.et5),
      (LumFz.lum3 & TempFz.temp4 & HumFz.hum4) >> (ETrans.et5),
      (LumFz.lum3 & TempFz.temp4 & HumFz.hum3) >> (ETrans.et5),
      (LumFz.lum3 & TempFz.temp4 & HumFz.hum2) >> (ETrans.et5),
      (LumFz.lum3 & TempFz.temp4 & HumFz.hum1) >> (ETrans.et5),
      (LumFz.lum3 & TempFz.temp5 & HumFz.hum6) >> (ETrans.et6),
      (LumFz.lum3 & TempFz.temp5 & HumFz.hum5) >> (ETrans.et6),
      (LumFz.lum3 & TempFz.temp5 & HumFz.hum4) >> (ETrans.et6),
      (LumFz.lum3 & TempFz.temp5 & HumFz.hum3) >> (ETrans.et6),
      (LumFz.lum3 & TempFz.temp5 & HumFz.hum2) >> (ETrans.et6),
      (LumFz.lum3 & TempFz.temp5 & HumFz.hum1) >> (ETrans.et7),
      (LumFz.lum3 & TempFz.temp6 & HumFz.hum6) >> (ETrans.et7),
      (LumFz.lum3 & TempFz.temp6 & HumFz.hum5) >> (ETrans.et7),
      (LumFz.lum3 & TempFz.temp6 & HumFz.hum4) >> (ETrans.et7),
      (LumFz.lum3 & TempFz.temp6 & HumFz.hum3) >> (ETrans.et7),
      (LumFz.lum3 & TempFz.temp6 & HumFz.hum2) >> (ETrans.et8),
      (LumFz.lum3 & TempFz.temp6 & HumFz.hum1) >> (ETrans.et8),
      (LumFz.lum3 & TempFz.temp7 & HumFz.hum6) >> (ETrans.et8),
      (LumFz.lum3 & TempFz.temp7 & HumFz.hum5) >> (ETrans.et8),
      (LumFz.lum3 & TempFz.temp7 & HumFz.hum4) >> (ETrans.et9),
      (LumFz.lum3 & TempFz.temp7 & HumFz.hum3) >> (ETrans.et9),
      (LumFz.lum3 & TempFz.temp7 & HumFz.hum2) >> (ETrans.et9),
      (LumFz.lum3 & TempFz.temp7 & HumFz.hum1) >> (ETrans.et9),
      (LumFz.lum3 & TempFz.temp8 & HumFz.hum6) >> (ETrans.et9),
      (LumFz.lum3 & TempFz.temp8 & HumFz.hum5) >> (ETrans.et9),
      (LumFz.lum3 & TempFz.temp8 & HumFz.hum4) >> (ETrans.et10),
      (LumFz.lum3 & TempFz.temp8 & HumFz.hum3) >> (ETrans.et10),
      (LumFz.lum3 & TempFz.temp8 & HumFz.hum2) >> (ETrans.et10),
      (LumFz.lum3 & TempFz.temp8 & HumFz.hum1) >> (ETrans.et10),
      //Lum4
      (LumFz.lum4 & TempFz.temp1 & HumFz.hum6) >> (ETrans.et1),
      (LumFz.lum4 & TempFz.temp1 & HumFz.hum5) >> (ETrans.et1),
      (LumFz.lum4 & TempFz.temp1 & HumFz.hum4) >> (ETrans.et1),
      (LumFz.lum4 & TempFz.temp1 & HumFz.hum3) >> (ETrans.et1),
      (LumFz.lum4 & TempFz.temp1 & HumFz.hum2) >> (ETrans.et1),
      (LumFz.lum4 & TempFz.temp1 & HumFz.hum1) >> (ETrans.et2),
      (LumFz.lum4 & TempFz.temp2 & HumFz.hum6) >> (ETrans.et2),
      (LumFz.lum4 & TempFz.temp2 & HumFz.hum5) >> (ETrans.et2),
      (LumFz.lum4 & TempFz.temp2 & HumFz.hum4) >> (ETrans.et2),
      (LumFz.lum4 & TempFz.temp2 & HumFz.hum3) >> (ETrans.et2),
      (LumFz.lum4 & TempFz.temp2 & HumFz.hum2) >> (ETrans.et3),
      (LumFz.lum4 & TempFz.temp2 & HumFz.hum1) >> (ETrans.et3),
      (LumFz.lum4 & TempFz.temp3 & HumFz.hum6) >> (ETrans.et3),
      (LumFz.lum4 & TempFz.temp3 & HumFz.hum5) >> (ETrans.et3),
      (LumFz.lum4 & TempFz.temp3 & HumFz.hum4) >> (ETrans.et4),
      (LumFz.lum4 & TempFz.temp3 & HumFz.hum3) >> (ETrans.et4),
      (LumFz.lum4 & TempFz.temp3 & HumFz.hum2) >> (ETrans.et4),
      (LumFz.lum4 & TempFz.temp3 & HumFz.hum1) >> (ETrans.et4),
      (LumFz.lum4 & TempFz.temp4 & HumFz.hum6) >> (ETrans.et4),
      (LumFz.lum4 & TempFz.temp4 & HumFz.hum5) >> (ETrans.et5),
      (LumFz.lum4 & TempFz.temp4 & HumFz.hum4) >> (ETrans.et5),
      (LumFz.lum4 & TempFz.temp4 & HumFz.hum3) >> (ETrans.et5),
      (LumFz.lum4 & TempFz.temp4 & HumFz.hum2) >> (ETrans.et5),
      (LumFz.lum4 & TempFz.temp4 & HumFz.hum1) >> (ETrans.et5),
      (LumFz.lum4 & TempFz.temp5 & HumFz.hum6) >> (ETrans.et6),
      (LumFz.lum4 & TempFz.temp5 & HumFz.hum5) >> (ETrans.et6),
      (LumFz.lum4 & TempFz.temp5 & HumFz.hum4) >> (ETrans.et6),
      (LumFz.lum4 & TempFz.temp5 & HumFz.hum3) >> (ETrans.et6),
      (LumFz.lum4 & TempFz.temp5 & HumFz.hum2) >> (ETrans.et6),
      (LumFz.lum4 & TempFz.temp5 & HumFz.hum1) >> (ETrans.et7),
      (LumFz.lum4 & TempFz.temp6 & HumFz.hum6) >> (ETrans.et7),
      (LumFz.lum4 & TempFz.temp6 & HumFz.hum5) >> (ETrans.et7),
      (LumFz.lum4 & TempFz.temp6 & HumFz.hum4) >> (ETrans.et7),
      (LumFz.lum4 & TempFz.temp6 & HumFz.hum3) >> (ETrans.et7),
      (LumFz.lum4 & TempFz.temp6 & HumFz.hum2) >> (ETrans.et8),
      (LumFz.lum4 & TempFz.temp6 & HumFz.hum1) >> (ETrans.et8),
      (LumFz.lum4 & TempFz.temp7 & HumFz.hum6) >> (ETrans.et8),
      (LumFz.lum4 & TempFz.temp7 & HumFz.hum5) >> (ETrans.et8),
      (LumFz.lum4 & TempFz.temp7 & HumFz.hum4) >> (ETrans.et9),
      (LumFz.lum4 & TempFz.temp7 & HumFz.hum3) >> (ETrans.et9),
      (LumFz.lum4 & TempFz.temp7 & HumFz.hum2) >> (ETrans.et9),
      (LumFz.lum4 & TempFz.temp7 & HumFz.hum1) >> (ETrans.et9),
      (LumFz.lum4 & TempFz.temp8 & HumFz.hum6) >> (ETrans.et9),
      (LumFz.lum4 & TempFz.temp8 & HumFz.hum5) >> (ETrans.et9),
      (LumFz.lum4 & TempFz.temp8 & HumFz.hum4) >> (ETrans.et10),
      (LumFz.lum4 & TempFz.temp8 & HumFz.hum3) >> (ETrans.et10),
      (LumFz.lum4 & TempFz.temp8 & HumFz.hum2) >> (ETrans.et10),
      (LumFz.lum4 & TempFz.temp8 & HumFz.hum1) >> (ETrans.et10),

      //Lum5
      (LumFz.lum5 & TempFz.temp1 & HumFz.hum6) >> (ETrans.et1),
      (LumFz.lum5 & TempFz.temp1 & HumFz.hum5) >> (ETrans.et1),
      (LumFz.lum5 & TempFz.temp1 & HumFz.hum4) >> (ETrans.et1),
      (LumFz.lum5 & TempFz.temp1 & HumFz.hum3) >> (ETrans.et1),
      (LumFz.lum5 & TempFz.temp1 & HumFz.hum2) >> (ETrans.et1),
      (LumFz.lum5 & TempFz.temp1 & HumFz.hum1) >> (ETrans.et2),
      (LumFz.lum5 & TempFz.temp2 & HumFz.hum6) >> (ETrans.et2),
      (LumFz.lum5 & TempFz.temp2 & HumFz.hum5) >> (ETrans.et2),
      (LumFz.lum5 & TempFz.temp2 & HumFz.hum4) >> (ETrans.et2),
      (LumFz.lum5 & TempFz.temp2 & HumFz.hum3) >> (ETrans.et2),
      (LumFz.lum5 & TempFz.temp2 & HumFz.hum2) >> (ETrans.et3),
      (LumFz.lum5 & TempFz.temp2 & HumFz.hum1) >> (ETrans.et3),
      (LumFz.lum5 & TempFz.temp3 & HumFz.hum6) >> (ETrans.et3),
      (LumFz.lum5 & TempFz.temp3 & HumFz.hum5) >> (ETrans.et3),
      (LumFz.lum5 & TempFz.temp3 & HumFz.hum4) >> (ETrans.et4),
      (LumFz.lum5 & TempFz.temp3 & HumFz.hum3) >> (ETrans.et4),
      (LumFz.lum5 & TempFz.temp3 & HumFz.hum2) >> (ETrans.et4),
      (LumFz.lum5 & TempFz.temp3 & HumFz.hum1) >> (ETrans.et4),
      (LumFz.lum5 & TempFz.temp4 & HumFz.hum6) >> (ETrans.et4),
      (LumFz.lum5 & TempFz.temp4 & HumFz.hum5) >> (ETrans.et5),
      (LumFz.lum5 & TempFz.temp4 & HumFz.hum4) >> (ETrans.et5),
      (LumFz.lum5 & TempFz.temp4 & HumFz.hum3) >> (ETrans.et5),
      (LumFz.lum5 & TempFz.temp4 & HumFz.hum2) >> (ETrans.et5),
      (LumFz.lum5 & TempFz.temp4 & HumFz.hum1) >> (ETrans.et6),
      (LumFz.lum5 & TempFz.temp5 & HumFz.hum6) >> (ETrans.et6),
      (LumFz.lum5 & TempFz.temp5 & HumFz.hum5) >> (ETrans.et6),
      (LumFz.lum5 & TempFz.temp5 & HumFz.hum4) >> (ETrans.et6),
      (LumFz.lum5 & TempFz.temp5 & HumFz.hum3) >> (ETrans.et7),
      (LumFz.lum5 & TempFz.temp5 & HumFz.hum2) >> (ETrans.et7),
      (LumFz.lum5 & TempFz.temp5 & HumFz.hum1) >> (ETrans.et7),
      (LumFz.lum5 & TempFz.temp6 & HumFz.hum6) >> (ETrans.et7),
      (LumFz.lum5 & TempFz.temp6 & HumFz.hum5) >> (ETrans.et8),
      (LumFz.lum5 & TempFz.temp6 & HumFz.hum4) >> (ETrans.et8),
      (LumFz.lum5 & TempFz.temp6 & HumFz.hum3) >> (ETrans.et8),
      (LumFz.lum5 & TempFz.temp6 & HumFz.hum2) >> (ETrans.et8),
      (LumFz.lum5 & TempFz.temp6 & HumFz.hum1) >> (ETrans.et8),
      (LumFz.lum5 & TempFz.temp7 & HumFz.hum6) >> (ETrans.et9),
      (LumFz.lum5 & TempFz.temp7 & HumFz.hum5) >> (ETrans.et9),
      (LumFz.lum5 & TempFz.temp7 & HumFz.hum4) >> (ETrans.et9),
      (LumFz.lum5 & TempFz.temp7 & HumFz.hum3) >> (ETrans.et9),
      (LumFz.lum5 & TempFz.temp7 & HumFz.hum2) >> (ETrans.et9),
      (LumFz.lum5 & TempFz.temp7 & HumFz.hum1) >> (ETrans.et10),
      (LumFz.lum5 & TempFz.temp8 & HumFz.hum6) >> (ETrans.et10),
      (LumFz.lum5 & TempFz.temp8 & HumFz.hum5) >> (ETrans.et10),
      (LumFz.lum5 & TempFz.temp8 & HumFz.hum4) >> (ETrans.et10),
      (LumFz.lum5 & TempFz.temp8 & HumFz.hum3) >> (ETrans.et10),
      (LumFz.lum5 & TempFz.temp8 & HumFz.hum2) >> (ETrans.et10),
      (LumFz.lum5 & TempFz.temp8 & HumFz.hum1) >> (ETrans.et10),

      //Lum6
      (LumFz.lum6 & TempFz.temp1 & HumFz.hum6) >> (ETrans.et1),
      (LumFz.lum6 & TempFz.temp1 & HumFz.hum5) >> (ETrans.et1),
      (LumFz.lum6 & TempFz.temp1 & HumFz.hum4) >> (ETrans.et1),
      (LumFz.lum6 & TempFz.temp1 & HumFz.hum3) >> (ETrans.et1),
      (LumFz.lum6 & TempFz.temp1 & HumFz.hum2) >> (ETrans.et1),
      (LumFz.lum6 & TempFz.temp1 & HumFz.hum1) >> (ETrans.et2),
      (LumFz.lum6 & TempFz.temp2 & HumFz.hum6) >> (ETrans.et2),
      (LumFz.lum6 & TempFz.temp2 & HumFz.hum5) >> (ETrans.et2),
      (LumFz.lum6 & TempFz.temp2 & HumFz.hum4) >> (ETrans.et2),
      (LumFz.lum6 & TempFz.temp2 & HumFz.hum3) >> (ETrans.et2),
      (LumFz.lum6 & TempFz.temp2 & HumFz.hum2) >> (ETrans.et3),
      (LumFz.lum6 & TempFz.temp2 & HumFz.hum1) >> (ETrans.et3),
      (LumFz.lum6 & TempFz.temp3 & HumFz.hum6) >> (ETrans.et3),
      (LumFz.lum6 & TempFz.temp3 & HumFz.hum5) >> (ETrans.et3),
      (LumFz.lum6 & TempFz.temp3 & HumFz.hum4) >> (ETrans.et4),
      (LumFz.lum6 & TempFz.temp3 & HumFz.hum3) >> (ETrans.et4),
      (LumFz.lum6 & TempFz.temp3 & HumFz.hum2) >> (ETrans.et4),
      (LumFz.lum6 & TempFz.temp3 & HumFz.hum1) >> (ETrans.et4),
      (LumFz.lum6 & TempFz.temp4 & HumFz.hum6) >> (ETrans.et4),
      (LumFz.lum6 & TempFz.temp4 & HumFz.hum5) >> (ETrans.et5),
      (LumFz.lum6 & TempFz.temp4 & HumFz.hum4) >> (ETrans.et5),
      (LumFz.lum6 & TempFz.temp4 & HumFz.hum3) >> (ETrans.et5),
      (LumFz.lum6 & TempFz.temp4 & HumFz.hum2) >> (ETrans.et5),
      (LumFz.lum6 & TempFz.temp4 & HumFz.hum1) >> (ETrans.et5),
      (LumFz.lum6 & TempFz.temp5 & HumFz.hum6) >> (ETrans.et6),
      (LumFz.lum6 & TempFz.temp5 & HumFz.hum5) >> (ETrans.et6),
      (LumFz.lum6 & TempFz.temp5 & HumFz.hum4) >> (ETrans.et6),
      (LumFz.lum6 & TempFz.temp5 & HumFz.hum3) >> (ETrans.et7),
      (LumFz.lum6 & TempFz.temp5 & HumFz.hum2) >> (ETrans.et7),
      (LumFz.lum6 & TempFz.temp5 & HumFz.hum1) >> (ETrans.et7),
      (LumFz.lum6 & TempFz.temp6 & HumFz.hum6) >> (ETrans.et8),
      (LumFz.lum6 & TempFz.temp6 & HumFz.hum5) >> (ETrans.et8),
      (LumFz.lum6 & TempFz.temp6 & HumFz.hum4) >> (ETrans.et8),
      (LumFz.lum6 & TempFz.temp6 & HumFz.hum3) >> (ETrans.et8),
      (LumFz.lum6 & TempFz.temp6 & HumFz.hum2) >> (ETrans.et8),
      (LumFz.lum6 & TempFz.temp6 & HumFz.hum1) >> (ETrans.et9),
      (LumFz.lum6 & TempFz.temp7 & HumFz.hum6) >> (ETrans.et9),
      (LumFz.lum6 & TempFz.temp7 & HumFz.hum5) >> (ETrans.et9),
      (LumFz.lum6 & TempFz.temp7 & HumFz.hum4) >> (ETrans.et9),
      (LumFz.lum6 & TempFz.temp7 & HumFz.hum3) >> (ETrans.et9),
      (LumFz.lum6 & TempFz.temp7 & HumFz.hum2) >> (ETrans.et10),
      (LumFz.lum6 & TempFz.temp7 & HumFz.hum1) >> (ETrans.et10),
      (LumFz.lum6 & TempFz.temp8 & HumFz.hum6) >> (ETrans.et10),
      (LumFz.lum6 & TempFz.temp8 & HumFz.hum5) >> (ETrans.et10),
      (LumFz.lum6 & TempFz.temp8 & HumFz.hum4) >> (ETrans.et10),
      (LumFz.lum6 & TempFz.temp8 & HumFz.hum3) >> (ETrans.et10),
      (LumFz.lum6 & TempFz.temp8 & HumFz.hum2) >> (ETrans.et10),
      (LumFz.lum6 & TempFz.temp8 & HumFz.hum1) >> (ETrans.et10),

      //Lum7
      (LumFz.lum7 & TempFz.temp1 & HumFz.hum6) >> (ETrans.et1),
      (LumFz.lum7 & TempFz.temp1 & HumFz.hum5) >> (ETrans.et1),
      (LumFz.lum7 & TempFz.temp1 & HumFz.hum4) >> (ETrans.et1),
      (LumFz.lum7 & TempFz.temp1 & HumFz.hum3) >> (ETrans.et1),
      (LumFz.lum7 & TempFz.temp1 & HumFz.hum2) >> (ETrans.et1),
      (LumFz.lum7 & TempFz.temp1 & HumFz.hum1) >> (ETrans.et2),
      (LumFz.lum7 & TempFz.temp2 & HumFz.hum6) >> (ETrans.et2),
      (LumFz.lum7 & TempFz.temp2 & HumFz.hum5) >> (ETrans.et2),
      (LumFz.lum7 & TempFz.temp2 & HumFz.hum4) >> (ETrans.et2),
      (LumFz.lum7 & TempFz.temp2 & HumFz.hum3) >> (ETrans.et2),
      (LumFz.lum7 & TempFz.temp2 & HumFz.hum2) >> (ETrans.et3),
      (LumFz.lum7 & TempFz.temp2 & HumFz.hum1) >> (ETrans.et3),
      (LumFz.lum7 & TempFz.temp3 & HumFz.hum6) >> (ETrans.et3),
      (LumFz.lum7 & TempFz.temp3 & HumFz.hum5) >> (ETrans.et3),
      (LumFz.lum7 & TempFz.temp3 & HumFz.hum4) >> (ETrans.et4),
      (LumFz.lum7 & TempFz.temp3 & HumFz.hum3) >> (ETrans.et4),
      (LumFz.lum7 & TempFz.temp3 & HumFz.hum2) >> (ETrans.et4),
      (LumFz.lum7 & TempFz.temp3 & HumFz.hum1) >> (ETrans.et4),
      (LumFz.lum7 & TempFz.temp4 & HumFz.hum6) >> (ETrans.et4),
      (LumFz.lum7 & TempFz.temp4 & HumFz.hum5) >> (ETrans.et5),
      (LumFz.lum7 & TempFz.temp4 & HumFz.hum4) >> (ETrans.et5),
      (LumFz.lum7 & TempFz.temp4 & HumFz.hum3) >> (ETrans.et5),
      (LumFz.lum7 & TempFz.temp4 & HumFz.hum2) >> (ETrans.et5),
      (LumFz.lum7 & TempFz.temp4 & HumFz.hum1) >> (ETrans.et5),
      (LumFz.lum7 & TempFz.temp5 & HumFz.hum6) >> (ETrans.et6),
      (LumFz.lum7 & TempFz.temp5 & HumFz.hum5) >> (ETrans.et6),
      (LumFz.lum7 & TempFz.temp5 & HumFz.hum4) >> (ETrans.et6),
      (LumFz.lum7 & TempFz.temp5 & HumFz.hum3) >> (ETrans.et7),
      (LumFz.lum7 & TempFz.temp5 & HumFz.hum2) >> (ETrans.et7),
      (LumFz.lum7 & TempFz.temp5 & HumFz.hum1) >> (ETrans.et7),
      (LumFz.lum7 & TempFz.temp6 & HumFz.hum6) >> (ETrans.et8),
      (LumFz.lum7 & TempFz.temp6 & HumFz.hum5) >> (ETrans.et8),
      (LumFz.lum7 & TempFz.temp6 & HumFz.hum4) >> (ETrans.et8),
      (LumFz.lum7 & TempFz.temp6 & HumFz.hum3) >> (ETrans.et8),
      (LumFz.lum7 & TempFz.temp6 & HumFz.hum2) >> (ETrans.et9),
      (LumFz.lum7 & TempFz.temp6 & HumFz.hum1) >> (ETrans.et9),
      (LumFz.lum7 & TempFz.temp7 & HumFz.hum6) >> (ETrans.et9),
      (LumFz.lum7 & TempFz.temp7 & HumFz.hum5) >> (ETrans.et9),
      (LumFz.lum7 & TempFz.temp7 & HumFz.hum4) >> (ETrans.et9),
      (LumFz.lum7 & TempFz.temp7 & HumFz.hum3) >> (ETrans.et9),
      (LumFz.lum7 & TempFz.temp7 & HumFz.hum2) >> (ETrans.et10),
      (LumFz.lum7 & TempFz.temp7 & HumFz.hum1) >> (ETrans.et10),
      (LumFz.lum7 & TempFz.temp8 & HumFz.hum6) >> (ETrans.et10),
      (LumFz.lum7 & TempFz.temp8 & HumFz.hum5) >> (ETrans.et10),
      (LumFz.lum7 & TempFz.temp8 & HumFz.hum4) >> (ETrans.et10),
      (LumFz.lum7 & TempFz.temp8 & HumFz.hum3) >> (ETrans.et10),
      (LumFz.lum7 & TempFz.temp8 & HumFz.hum2) >> (ETrans.et10),
      (LumFz.lum7 & TempFz.temp8 & HumFz.hum1) >> (ETrans.et10),

      //Lum8
      (LumFz.lum8 & TempFz.temp1 & HumFz.hum6) >> (ETrans.et1),
      (LumFz.lum8 & TempFz.temp1 & HumFz.hum5) >> (ETrans.et1),
      (LumFz.lum8 & TempFz.temp1 & HumFz.hum4) >> (ETrans.et1),
      (LumFz.lum8 & TempFz.temp1 & HumFz.hum3) >> (ETrans.et1),
      (LumFz.lum8 & TempFz.temp1 & HumFz.hum2) >> (ETrans.et1),
      (LumFz.lum8 & TempFz.temp1 & HumFz.hum1) >> (ETrans.et2),
      (LumFz.lum8 & TempFz.temp2 & HumFz.hum6) >> (ETrans.et2),
      (LumFz.lum8 & TempFz.temp2 & HumFz.hum5) >> (ETrans.et2),
      (LumFz.lum8 & TempFz.temp2 & HumFz.hum4) >> (ETrans.et2),
      (LumFz.lum8 & TempFz.temp2 & HumFz.hum3) >> (ETrans.et2),
      (LumFz.lum8 & TempFz.temp2 & HumFz.hum2) >> (ETrans.et3),
      (LumFz.lum8 & TempFz.temp2 & HumFz.hum1) >> (ETrans.et3),
      (LumFz.lum8 & TempFz.temp3 & HumFz.hum6) >> (ETrans.et3),
      (LumFz.lum8 & TempFz.temp3 & HumFz.hum5) >> (ETrans.et3),
      (LumFz.lum8 & TempFz.temp3 & HumFz.hum4) >> (ETrans.et4),
      (LumFz.lum8 & TempFz.temp3 & HumFz.hum3) >> (ETrans.et4),
      (LumFz.lum8 & TempFz.temp3 & HumFz.hum2) >> (ETrans.et4),
      (LumFz.lum8 & TempFz.temp3 & HumFz.hum1) >> (ETrans.et4),
      (LumFz.lum8 & TempFz.temp4 & HumFz.hum6) >> (ETrans.et4),
      (LumFz.lum8 & TempFz.temp4 & HumFz.hum5) >> (ETrans.et5),
      (LumFz.lum8 & TempFz.temp4 & HumFz.hum4) >> (ETrans.et5),
      (LumFz.lum8 & TempFz.temp4 & HumFz.hum3) >> (ETrans.et5),
      (LumFz.lum8 & TempFz.temp4 & HumFz.hum2) >> (ETrans.et5),
      (LumFz.lum8 & TempFz.temp4 & HumFz.hum1) >> (ETrans.et5),
      (LumFz.lum8 & TempFz.temp5 & HumFz.hum6) >> (ETrans.et6),
      (LumFz.lum8 & TempFz.temp5 & HumFz.hum5) >> (ETrans.et6),
      (LumFz.lum8 & TempFz.temp5 & HumFz.hum4) >> (ETrans.et6),
      (LumFz.lum8 & TempFz.temp5 & HumFz.hum3) >> (ETrans.et7),
      (LumFz.lum8 & TempFz.temp5 & HumFz.hum2) >> (ETrans.et7),
      (LumFz.lum8 & TempFz.temp5 & HumFz.hum1) >> (ETrans.et7),
      (LumFz.lum8 & TempFz.temp6 & HumFz.hum6) >> (ETrans.et8),
      (LumFz.lum8 & TempFz.temp6 & HumFz.hum5) >> (ETrans.et8),
      (LumFz.lum8 & TempFz.temp6 & HumFz.hum4) >> (ETrans.et9),
      (LumFz.lum8 & TempFz.temp6 & HumFz.hum3) >> (ETrans.et9),
      (LumFz.lum8 & TempFz.temp6 & HumFz.hum2) >> (ETrans.et9),
      (LumFz.lum8 & TempFz.temp6 & HumFz.hum1) >> (ETrans.et9),
      (LumFz.lum8 & TempFz.temp7 & HumFz.hum6) >> (ETrans.et9),
      (LumFz.lum8 & TempFz.temp7 & HumFz.hum5) >> (ETrans.et9),
      (LumFz.lum8 & TempFz.temp7 & HumFz.hum4) >> (ETrans.et10),
      (LumFz.lum8 & TempFz.temp7 & HumFz.hum3) >> (ETrans.et10),
      (LumFz.lum8 & TempFz.temp7 & HumFz.hum2) >> (ETrans.et10),
      (LumFz.lum8 & TempFz.temp7 & HumFz.hum1) >> (ETrans.et10),
      (LumFz.lum8 & TempFz.temp8 & HumFz.hum6) >> (ETrans.et10),
      (LumFz.lum8 & TempFz.temp8 & HumFz.hum5) >> (ETrans.et10),
      (LumFz.lum8 & TempFz.temp8 & HumFz.hum4) >> (ETrans.et10),
      (LumFz.lum8 & TempFz.temp8 & HumFz.hum3) >> (ETrans.et10),
      (LumFz.lum8 & TempFz.temp8 & HumFz.hum2) >> (ETrans.et10),
      (LumFz.lum8 & TempFz.temp8 & HumFz.hum1) >> (ETrans.et10),

      //Lum9
      (LumFz.lum9 & TempFz.temp1 & HumFz.hum6) >> (ETrans.et1),
      (LumFz.lum9 & TempFz.temp1 & HumFz.hum5) >> (ETrans.et1),
      (LumFz.lum9 & TempFz.temp1 & HumFz.hum4) >> (ETrans.et1),
      (LumFz.lum9 & TempFz.temp1 & HumFz.hum3) >> (ETrans.et1),
      (LumFz.lum9 & TempFz.temp1 & HumFz.hum2) >> (ETrans.et1),
      (LumFz.lum9 & TempFz.temp1 & HumFz.hum1) >> (ETrans.et2),
      (LumFz.lum9 & TempFz.temp2 & HumFz.hum6) >> (ETrans.et2),
      (LumFz.lum9 & TempFz.temp2 & HumFz.hum5) >> (ETrans.et2),
      (LumFz.lum9 & TempFz.temp2 & HumFz.hum4) >> (ETrans.et2),
      (LumFz.lum9 & TempFz.temp2 & HumFz.hum3) >> (ETrans.et2),
      (LumFz.lum9 & TempFz.temp2 & HumFz.hum2) >> (ETrans.et3),
      (LumFz.lum9 & TempFz.temp2 & HumFz.hum1) >> (ETrans.et3),
      (LumFz.lum9 & TempFz.temp3 & HumFz.hum6) >> (ETrans.et3),
      (LumFz.lum9 & TempFz.temp3 & HumFz.hum5) >> (ETrans.et3),
      (LumFz.lum9 & TempFz.temp3 & HumFz.hum4) >> (ETrans.et4),
      (LumFz.lum9 & TempFz.temp3 & HumFz.hum3) >> (ETrans.et4),
      (LumFz.lum9 & TempFz.temp3 & HumFz.hum2) >> (ETrans.et4),
      (LumFz.lum9 & TempFz.temp3 & HumFz.hum1) >> (ETrans.et4),
      (LumFz.lum9 & TempFz.temp4 & HumFz.hum6) >> (ETrans.et4),
      (LumFz.lum9 & TempFz.temp4 & HumFz.hum5) >> (ETrans.et5),
      (LumFz.lum9 & TempFz.temp4 & HumFz.hum4) >> (ETrans.et5),
      (LumFz.lum9 & TempFz.temp4 & HumFz.hum3) >> (ETrans.et5),
      (LumFz.lum9 & TempFz.temp4 & HumFz.hum2) >> (ETrans.et6),
      (LumFz.lum9 & TempFz.temp4 & HumFz.hum1) >> (ETrans.et6),
      (LumFz.lum9 & TempFz.temp5 & HumFz.hum6) >> (ETrans.et6),
      (LumFz.lum9 & TempFz.temp5 & HumFz.hum5) >> (ETrans.et7),
      (LumFz.lum9 & TempFz.temp5 & HumFz.hum4) >> (ETrans.et7),
      (LumFz.lum9 & TempFz.temp5 & HumFz.hum3) >> (ETrans.et7),
      (LumFz.lum9 & TempFz.temp5 & HumFz.hum2) >> (ETrans.et7),
      (LumFz.lum9 & TempFz.temp5 & HumFz.hum1) >> (ETrans.et8),
      (LumFz.lum9 & TempFz.temp6 & HumFz.hum6) >> (ETrans.et8),
      (LumFz.lum9 & TempFz.temp6 & HumFz.hum5) >> (ETrans.et8),
      (LumFz.lum9 & TempFz.temp6 & HumFz.hum4) >> (ETrans.et8),
      (LumFz.lum9 & TempFz.temp6 & HumFz.hum3) >> (ETrans.et9),
      (LumFz.lum9 & TempFz.temp6 & HumFz.hum2) >> (ETrans.et9),
      (LumFz.lum9 & TempFz.temp6 & HumFz.hum1) >> (ETrans.et9),
      (LumFz.lum9 & TempFz.temp7 & HumFz.hum6) >> (ETrans.et9),
      (LumFz.lum9 & TempFz.temp7 & HumFz.hum5) >> (ETrans.et9),
      (LumFz.lum9 & TempFz.temp7 & HumFz.hum4) >> (ETrans.et10),
      (LumFz.lum9 & TempFz.temp7 & HumFz.hum3) >> (ETrans.et10),
      (LumFz.lum9 & TempFz.temp7 & HumFz.hum2) >> (ETrans.et10),
      (LumFz.lum9 & TempFz.temp7 & HumFz.hum1) >> (ETrans.et10),
      (LumFz.lum9 & TempFz.temp8 & HumFz.hum6) >> (ETrans.et10),
      (LumFz.lum9 & TempFz.temp8 & HumFz.hum5) >> (ETrans.et10),
      (LumFz.lum9 & TempFz.temp8 & HumFz.hum4) >> (ETrans.et10),
      (LumFz.lum9 & TempFz.temp8 & HumFz.hum3) >> (ETrans.et10),
      (LumFz.lum9 & TempFz.temp8 & HumFz.hum2) >> (ETrans.et10),
      (LumFz.lum9 & TempFz.temp8 & HumFz.hum1) >> (ETrans.et10)
    ]);
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: FlutterCloseAppPage(
          onCloseFailed: () {
            // Condition does not match: the first press or the second press interval is more than 2 seconds, display a prompt message
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Press again to exit'),
            ));
          },
          child: Scaffold(
              backgroundColor: const Color.fromARGB(255, 229, 242, 201),
              appBar: AppBar(
                automaticallyImplyLeading: false,
                iconTheme: const IconThemeData(
                    color: Color.fromARGB(255, 199, 217, 137)),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Close Plant Profile?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);
                            },
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
                backgroundColor: Colors.transparent,
                bottomOpacity: 0.0,
                title: const Text('Plant Profile',
                    style: TextStyle(
                      color: Color.fromARGB(255, 18, 64, 38),
                      fontWeight: FontWeight.bold,
                    )),
                elevation: 0,
              ),
              body: Center(
                child: StreamBuilder<QuerySnapshot>(
                  stream: plants,
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot,
                  ) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong!');
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Column(children: const <Widget>[
                        CircularProgressIndicator(
                          color: Color.fromARGB(255, 18, 64, 38),
                        ),
                        Text('Loading Data Please Wait...'),
                      ]);
                    }

                    final data = snapshot.requireData;

                    return ListView.builder(
                      itemCount: data.size,
                      itemBuilder: (context, index) {
                        double tempRecord =
                            double.parse('${data.docs[index]['Temp_Record']}');
                        double humRecord =
                            double.parse('${data.docs[index]['Hum_Record']}');
                        double mstRecord =
                            double.parse('${data.docs[index]['Moist_Record']}');
                        double luxRecord =
                            double.parse('${data.docs[index]['Light_Record']}');
                        DateTime datetime = DateTime.parse((data.docs[index]
                                ['TimeStamp'])
                            .toDate()
                            .toString());

                        var evatranspiration = ETrans.createOutputPlaceholder();
                        evatrans.resolve(inputs: [
                          LumFz.assign(
                              luxRecord.round() == 0 ? 1 : luxRecord.round()),
                          TempFz.assign(
                              tempRecord.round() == 0 ? 1 : tempRecord.round()),
                          HumFz.assign(
                              humRecord.round() == 0 ? 1 : humRecord.round())
                        ], outputs: [
                          evatranspiration
                        ]);

                        //print(evatranspiration.crispValue);
                        var crispValue = evatranspiration.crispValue;

                        double cmPerDay = (crispValue * 24) / 10;
                        double potVolume =
                            double.parse('${data.docs[index]['Pot_Height']}');
                        int drainLength =
                            ((potVolume * .75) / cmPerDay).round();

                        return SingleChildScrollView(
                          child: Column(children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.all(1),
                                child: Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        20, 10, 20, 0),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 119, 217, 137),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 5, 0, 0),
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 18, 64, 38),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: const Icon(
                                            LineIcons.pagelines,
                                            color: Color.fromARGB(
                                                255, 199, 217, 137),
                                            size: 50,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          '${data.docs[index]['Plant_Name']}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '${data.docs[index]['Plant_Variety']}',
                                          style: const TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20,
                                            fontFamily: 'AvenirLight',
                                          ),
                                        ),
                                        Text(
                                          '${data.docs[index]['Plant_Specie']}',
                                          style: const TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontFamily: 'AvenirLight',
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'Pot Type: ${data.docs[index]['Pot_Type']}',
                                          style: const TextStyle(
                                            fontFamily: 'AvenirLight',
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Base Diameter: ${data.docs[index]['Pot_BaseDiameter']} cm',
                                                style: const TextStyle(
                                                  fontFamily: 'AvenirLight',
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'Top Diameter: ${data.docs[index]['Pot_TopDiameter']} cm',
                                                style: const TextStyle(
                                                  fontFamily: 'AvenirLight',
                                                ),
                                              ),
                                            ]),
                                        Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Height: ${data.docs[index]['Pot_Height']} cm',
                                                style: const TextStyle(
                                                  fontFamily: 'AvenirLight',
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'Width: ${data.docs[index]['Pot_Width']} cm',
                                                style: const TextStyle(
                                                  fontFamily: 'AvenirLight',
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'Length: ${data.docs[index]['Pot_Length']} cm',
                                                style: const TextStyle(
                                                  fontFamily: 'AvenirLight',
                                                ),
                                              ),
                                            ]),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 0, 20, 10),
                                          child: Text(
                                            '"${data.docs[index]['Short_Desc']}"',
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontFamily: 'AvenirLight',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        foregroundColor:
                                                            const Color.fromARGB(
                                                                255, 199, 217, 137),
                                                        backgroundColor:
                                                            const Color.fromARGB(
                                                                255, 18, 64, 38),
                                                        elevation: 0,
                                                        minimumSize:
                                                            const Size(70, 20),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    30)),
                                                        padding:
                                                            const EdgeInsets.symmetric(
                                                                vertical: 15,
                                                                horizontal: 10)),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .push(
                                                              MaterialPageRoute(
                                                        builder: (context) =>
                                                            UpdateInfo(
                                                          qrResult: qrResult,
                                                        ),
                                                      ));
                                                    },
                                                    child: const Text(
                                                      'Update Pot',
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        foregroundColor:
                                                            const Color.fromARGB(
                                                                255, 199, 217, 137),
                                                        backgroundColor:
                                                            const Color.fromARGB(
                                                                255, 64, 18, 23),
                                                        elevation: 0,
                                                        minimumSize:
                                                            const Size(40, 20),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    30)),
                                                        padding:
                                                            const EdgeInsets.symmetric(
                                                                vertical: 15,
                                                                horizontal: 10)),
                                                    onPressed: () =>
                                                        showDialog<String>(
                                                      context: context,
                                                      builder: (BuildContext
                                                              context) =>
                                                          AlertDialog(
                                                        title: const Text(
                                                            "Data will be deleted permanently and you won't be able to retieve it again."),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    context),
                                                            child: const Text(
                                                                'Cancel'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .popUntil(
                                                                      (route) =>
                                                                          route
                                                                              .isFirst);
                                                              FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      'PLANTS')
                                                                  .where(
                                                                      'Plant_Id',
                                                                      isEqualTo:
                                                                          widget
                                                                              .qrResult)
                                                                  .get()
                                                                  .then((val) => val
                                                                      .docs
                                                                      .forEach(
                                                                          (doc) =>
                                                                              {
                                                                                doc.reference.delete()
                                                                              }));
                                                            },
                                                            child: const Text(
                                                                'Delete'),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    child: const Text(
                                                      'Delete Plant',
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ],
                                    ))),
                            const SizedBox(
                              height: 30,
                            ),
                            tempRecord == 0 &&
                                    luxRecord == 0 &&
                                    mstRecord == 0 &&
                                    humRecord == 0
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                        Icon(
                                          LineIcons.seedling,
                                          color: Color.fromARGB(
                                              255, 137, 217, 137),
                                          size: 100,
                                        ),
                                        Text("No Data",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 50,
                                              color: Color.fromARGB(
                                                  255, 137, 217, 137),
                                            )),
                                        Text(
                                            "Start Gathering Data to show latest gathered data history here",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  255, 137, 217, 137),
                                            )),
                                        SizedBox(
                                          height: 40,
                                        ),
                                      ])
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        const Text("Last Data Gathered:",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 30,
                                              color: Colors.black,
                                            )),
                                        const SizedBox(height: 15),
                                        Text('$datetime',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 15,
                                              color: Colors.black,
                                            )),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 15, 10, 0),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      const Icon(
                                                        Icons
                                                            .thermostat_outlined,
                                                        color: Colors.black,
                                                        size: 50,
                                                      ),
                                                      const Text(
                                                        'Temperature',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      Text(
                                                        '$tempRecord °C',
                                                        style: const TextStyle(
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                    child: Column(
                                                  children: [
                                                    const Icon(
                                                      Icons.water_outlined,
                                                      color: Colors.black,
                                                      size: 50,
                                                    ),
                                                    const Text(
                                                      'Humidity',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Text(
                                                      '$humRecord %',
                                                      style: const TextStyle(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                                Expanded(
                                                    child: Column(
                                                  children: [
                                                    const Icon(
                                                      Icons.water_drop_outlined,
                                                      color: Colors.black,
                                                      size: 50,
                                                    ),
                                                    const Text(
                                                      'Soil Moisture',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Text(
                                                      '$mstRecord %',
                                                      style: const TextStyle(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                                Expanded(
                                                    child: Column(
                                                  children: [
                                                    const Icon(
                                                      Icons.lightbulb_outline,
                                                      color: Colors.black,
                                                      size: 50,
                                                    ),
                                                    const Text(
                                                      'Lux',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Text(
                                                      '$luxRecord lx',
                                                      style: const TextStyle(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                              ]),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 10, 0),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                    'Water is expected to reach low level after $drainLength days'),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        foregroundColor:
                                                            const Color.fromARGB(
                                                                255,
                                                                199,
                                                                217,
                                                                137),
                                                        backgroundColor:
                                                            const Color.fromARGB(
                                                                255, 18, 64, 38),
                                                        elevation: 0,
                                                        minimumSize:
                                                            const Size(20, 10),
                                                        padding: const EdgeInsets
                                                                .symmetric(
                                                            vertical: 10,
                                                            horizontal: 10)),
                                                    onPressed: () {},
                                                    child: const Text(
                                                        'Get Notified'))
                                              ]),
                                        )
                                      ]),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      const Color.fromARGB(255, 199, 217, 137),
                                  backgroundColor:
                                      const Color.fromARGB(255, 18, 64, 38),
                                  elevation: 20,
                                  minimumSize: const Size(200, 60),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 90),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => DevicesPage(
                                          qrResult: qrResult,
                                          plantName:
                                              '${data.docs[index]['Plant_Name']}',
                                          plantSpecie:
                                              '${data.docs[index]['Plant_Specie']}',
                                          potType:
                                              '${data.docs[index]['Pot_Type']}',
                                          potHeight: double.parse(
                                              '${data.docs[index]['Pot_Height']}'),
                                          potWidth: double.parse(
                                              '${data.docs[index]['Pot_Width']}'),
                                          potBase: double.parse(
                                              '${data.docs[index]['Pot_BaseDiameter']}'),
                                          potTop: double.parse(
                                              '${data.docs[index]['Pot_TopDiameter']}'),
                                          potLength: double.parse(
                                              '${data.docs[index]['Pot_Length']}')),
                                      settings: const RouteSettings(
                                          name: "/PlantProfile")));
                                },
                                child: const Text(
                                  'Gather Environment Data',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ]),
                        );
                      },
                    );
                  },
                ),
              )),
        ));
  }

  // Widget _buildChart(BuildContext context, List<Temp> tempdata) {
  //   mydata = tempdata;
  //   _generateData(mydata);
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Center(
  //       child: Column(
  //         children: <Widget>[
  //           const Text(
  //             'Sales by Year',
  //             style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
  //           ),
  //           const SizedBox(
  //             height: 10.0,
  //           ),
  //           Expanded(
  //             child: charts.BarChart(
  //               _seriesBarData,
  //               animate: true,
  //               animationDuration: const Duration(seconds: 3),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
