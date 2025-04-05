//TODO
/*
"Beam_id"	INTEGER,
	"Beam_projectId"	INTEGER,
	"Beam_no"	INTEGER NOT NULL UNIQUE,
	"Beam_name"	TEXT,
	"Beam_shape"	TEXT DEFAULT 'Rectangle',
	"Beam_b"	INTEGER DEFAULT 60,
	"Beam_h"	INTEGER DEFAULT 25,
	"Beam_bf"	INTEGER DEFAULT 0,
	"Beam_hf"	INTEGER DEFAULT 0,
	"Beam_Fy"	INTEGER DEFAULT 4200,
	"Beam_Fc"	INTEGER DEFAULT 300,
	"Beam_mainSteelBar"	INTEGER DEFAULT 12,
	"Beam_stirrup"	INTEGER DEFAULT 10,
	PRIMARY KEY("Beam_no" AUTOINCREMENT)
	*/
import 'dart:math' as math;

mixin intBeams {
  /// genernal variables
  int id=0;
  int projectId=0;
  int no=0;
  String name='Beam_0000';
}
mixin intBeamsShape {
  /// Shape Variables
  String shape='Rectangle';/// Shapes  // Rectangle OR T  OR  L  //
  int b= 60;// in cm
  int h= 25;// in cm
  int hf= 0;// in cm
  int bf= 0;// in cm
  /// Wight Variables
  double concreteDensity =2.4 ;// ton/m3
  late double? OW_Meter =Cal_OwnWhiegth();// ton/m3
  ///Moment of Inttai
  late double? I_zz =Cal_Izz();//
  /// Return Moment of Intia [I_zz]  according to variable [shape]
  ///
  ///[shape] has three values
  ///
  ///  * [Rectangle]
  ///  * [T]
  ///  * [L]
  ///
  ///
  @override
  double? Cal_Izz(){
    double? Izz;
    double? I_zz1;
    double? I_zz2;
    double? cntr_Y;
    int? e;
    if(shape=='Rectangle') {
      OW_Meter = concreteDensity * b * h / (math.pow(100, 2));
      Izz=b*math.pow(h, 3)/(12*math.pow(100, 4));
    }else if(shape=='T') {
      OW_Meter = concreteDensity * ((bf * hf)+(b *(h- hf))) / (math.pow(100, 2));
      e=h-hf;
      cntr_Y=((0.5*b*math.pow(e, 2))+(hf*bf*(e+0.5*hf)))/(e*b+hf*bf);
      I_zz1=(b*math.pow(e, 3)/12)+(e*b*math.pow((cntr_Y-(e/2)), 2));
      I_zz2=(bf*math.pow(hf, 3)/12)+(bf*hf*math.pow((cntr_Y-(e+(hf/2))), 2));
      Izz=(I_zz1+I_zz2)/math.pow(100, 4);
    }else if(shape=='L') {
      e=h-hf;
      OW_Meter = concreteDensity * ((bf * hf)+(b *(h- hf))) / (math.pow(100, 2));
      cntr_Y=((0.5*b*math.pow(e, 2))+(hf*bf*(e+0.5*hf)))/(e*b+hf*bf);
      I_zz1=(b*math.pow(e, 3)/12)+(e*b*math.pow((cntr_Y-(e/2)), 2));
      I_zz2=(bf*math.pow(hf, 3)/12)+(bf*hf*math.pow((cntr_Y-(h-(hf/2))), 2));
      Izz=(I_zz1+I_zz2)/math.pow(100, 4);
    }
    return Izz;
  }

  @override
  double? Cal_OwnWhiegth(){
    double? Ow;
    if (concreteDensity==0)
    {
      Ow =0;
    }else {
      if (shape == 'Rectangle') {
        Ow = concreteDensity * b * h ;
      } else if (shape == 'T') {
        Ow = concreteDensity * ((bf * hf) + (b * (h - hf)));
      } else if (shape == 'L') {
        Ow = concreteDensity * ((bf * hf) + (b * (h - hf)));
      }
    }
    return Ow;
  }
}
mixin intBeamsDesign {
  /// Steel Variables
  int Fy= 4200;// kg/cm3
  int Fc= 300;// kg/cm3
  int mainSteelBar= 12; // mm
  int stirrup=10;// mm
  double CoverTop=2.5;// cm
  double Coverbot=2.5;// cm

}
/// New Beam With full informations [Beams].
///
/// we need Main [Variables]
///
///  * [id] Beam no in database.
///  * [projectId] project no when the [projectId] == 0 it will be with out project just element.
///  * [no] Beam no. in project.
///  * [name] project name.
///  * [beam_shape] General Beam Shape there are three types ['Rectangle'] Or ['T'] Or ['L'].
///

class Beams with intBeams,intBeamsShape,intBeamsDesign {
  Beam_Shape beam_shape=Beam_Shape.Impty();
  Beam_Design beam_design=Beam_Design.Impty();
  Beams.Impty();
  Beams.fromdb(dynamic obj) {
    id =obj["Beam_id"] as int;
    projectId =obj["Beam_projectId"]  as int;
    no =obj["Beam_no"] as int;
    name =obj["Beam_name"];
    beam_shape=Beam_Shape.fromdb(obj);
    beam_design=Beam_Design.fromdb(obj);
  }

  Beams.fromMap(Map<String, dynamic> obj) {
    id =obj["Beam_id"] as int;
    projectId =obj["Beam_projectId"] as int;
    no =obj["Beam_no"] as int;
    name =obj["Beam_name"];
    beam_shape=Beam_Shape.fromMap(obj);
    beam_design=Beam_Design.fromMap(obj);
  }

  Map<String, dynamic> toMap() => {
    "Beam_id":id ,
    "Beam_projectId":projectId,
    "Beam_no":no ,
    "Beam_name":name,
  };
}

class Beam_Shape with intBeamsShape   {
  Beam_Shape.Impty();
  Beam_Shape.fromdb(dynamic obj) {
    shape =obj["Beam_shape"];
    b =obj["Beam_b"]  as int;
    h =obj["Beam_h"] as int;
    hf =obj["Beam_hf"] as int;
    bf =obj["Beam_bf"] as int;
  }

  Beam_Shape.fromMap(Map<String, dynamic> obj) {
    shape =obj["Beam_shape"];
    b =obj["Beam_b"]  as int;
    h =obj["Beam_h"] as int;
    hf =obj["Beam_hf"] as int;
    bf =obj["Beam_bf"] as int;
  }

  Map<String, dynamic> toMap() => {
    "Beam_shape":shape ,
    "Beam_b":b,
    "Beam_h":h ,
    "Beam_bf":bf,
    "Beam_hf":hf ,
  };
}

class Beam_Design with intBeamsDesign   {
  Beam_Design.Impty();
  Beam_Design.fromdb(dynamic obj) {
    Fy =obj["Beam_Fy"]as int;
    Fc =obj["Beam_Fc"]  as int;
    mainSteelBar =obj["Beam_mainSteelBar"] as int;
    stirrup =obj["Beam_stirrup"] as int;
  }

  Beam_Design.fromMap(Map<String, dynamic> obj) {
    Fy =obj["Beam_Fy"] as int;
    Fc =obj["Beam_Fc"] as int;
    mainSteelBar =obj["Beam_mainSteelBar"] as int;
    stirrup =obj["Beam_stirrup"] as int;
  }

  Map<String, dynamic> toMap() => {
    "Beam_Fy":Fy ,
    "Beam_Fc":Fc,
    "Beam_mainSteelBar":mainSteelBar ,
    "Beam_stirrup":stirrup ,
  };

}

