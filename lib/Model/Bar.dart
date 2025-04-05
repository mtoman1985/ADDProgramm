import 'package:add_programme/Model/Beams.dart';

/*CREATE TABLE "Span" (
"Span_Id"	INTEGER NOT NULL UNIQUE,
"Span_beamId"	INTEGER,
"Span_order"	INTEGER,
"Span_length"	NUMERIC DEFAULT 3.3,
"Span_loadLength"	NUMERIC DEFAULT 3,
"Node_startShearNo"	INTEGER,
"Node_startMomentNo"	INTEGER,
"Node_endShearNo"	INTEGER,
"Node_endMomentNo"	INTEGER,
"Span_supportStart"	TEXT DEFAULT 'True',
"Span_supportEnd"	TEXT DEFAULT 'True',
"Span_beamShape"	TEXT DEFAULT 'Rectangle',
"Span_beamShape_b"	INTEGER DEFAULT 60,
"Span_beamShape_h"	INTEGER DEFAULT 25,
"Span_beamShape_Hf"	INTEGER DEFAULT 0,
"Span_beamShape_Bf"	INTEGER DEFAULT 60,
PRIMARY KEY("Span_Id" AUTOINCREMENT)
);*/

class Bar extends Beam_Shape{
  Bar.Impty() : super.Impty();
}