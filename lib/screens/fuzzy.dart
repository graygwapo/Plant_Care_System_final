// @dart = 2.9
import 'package:fuzzylogic/fuzzylogic.dart';

class FzLum extends FuzzyVariable<int> {
  var lum1 = FuzzySet.LeftShoulder(0, 545.5, 1091);
  var lum2 = FuzzySet.Triangle(545.5, 1091, 1636);
  var lum3 = FuzzySet.Triangle(1091, 1636, 2182);
  var lum4 = FuzzySet.Triangle(1636, 2182, 2727);
  var lum5 = FuzzySet.Triangle(2182, 2727, 3273);
  var lum6 = FuzzySet.Triangle(2727, 3273, 3818);
  var lum7 = FuzzySet.Triangle(3273, 3818, 4364);
  var lum8 = FuzzySet.Triangle(3818, 4364, 4909);
  var lum9 = FuzzySet.RightShoulder(4364, 4909, 6000);

  FzLum() {
    sets = [lum1, lum2, lum3, lum4, lum5, lum6, lum7, lum8, lum9];
    init();
  }
}

class FzTemp extends FuzzyVariable<int> {
  var temp1 = FuzzySet.LeftShoulder(-20, 0, 5);
  var temp2 = FuzzySet.Triangle(0, 5, 10);
  var temp3 = FuzzySet.Triangle(5, 10, 15);
  var temp4 = FuzzySet.Triangle(5, 10, 15);
  var temp5 = FuzzySet.Triangle(15, 20, 25);
  var temp6 = FuzzySet.Triangle(20, 25, 30);
  var temp7 = FuzzySet.Triangle(25, 30, 3);
  var temp8 = FuzzySet.RightShoulder(30, 35, 60);

  FzTemp() {
    sets = [temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8];
    init();
  }
}

class FzHum extends FuzzyVariable<int> {
  var hum1 = FuzzySet.Trapezoid(0, 0, 30, 35);
  var hum2 = FuzzySet.Trapezoid(30, 35, 40, 45);
  var hum3 = FuzzySet.Trapezoid(40, 45, 50, 55);
  var hum4 = FuzzySet.Trapezoid(50, 55, 60, 65);
  var hum5 = FuzzySet.Trapezoid(60, 65, 70, 75);
  var hum6 = FuzzySet.Trapezoid(70, 75, 100, 100);

  FzHum() {
    sets = [hum1, hum2, hum3, hum4, hum5, hum6];
    init();
  }
}

class ET extends FuzzyVariable<double> {
  var et1 = FuzzySet.Triangle(0.0, 0.0, 0.1);
  var et2 = FuzzySet.Triangle(0.0, 0.1, 0.2);
  var et3 = FuzzySet.Triangle(0.1, 0.2, 0.3);
  var et4 = FuzzySet.Triangle(0.2, 0.3, 0.4);
  var et5 = FuzzySet.Triangle(0.3, 0.4, 0.5);
  var et6 = FuzzySet.Triangle(0.4, 0.5, 0.6);
  var et7 = FuzzySet.Triangle(0.5, 0.6, 0.7);
  var et8 = FuzzySet.Triangle(0.6, 0.7, 0.8);
  var et9 = FuzzySet.Triangle(0.7, 0.8, 0.9);
  var et10 = FuzzySet.RightShoulder(0.8, 0.9, 1);

  // ignore: non_constant_identifier_names
  ET() {
    sets = [et1, et2, et3, et4, et5, et6, et7, et8, et9, et10];
    init();
  }
}


// var low = FuzzyRuleBase();
// low.addRules([
//   (LumFz.lum1 & TempFz.temp1 & HumFz.hum1) >> (ETrans.et1),
// ]);

