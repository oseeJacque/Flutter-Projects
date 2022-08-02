import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class custumText extends Text {
  custumText(String data,
      {color: Colors.white, textAlign: TextAlign.center, factory: 1.0,fontWeight:FontWeight.normal})
      : super(data,
            textAlign: textAlign,
            textScaleFactor: factory,
            style: TextStyle(color: color,fontWeight: fontWeight));
}
