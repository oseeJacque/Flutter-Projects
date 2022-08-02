import 'package:flutter/material.dart';
import 'package:whatsapp/widgets/textCustum.dart';

class OutilsProfessionnels extends StatefulWidget{
  const OutilsProfessionnels({Key? key,required this.title}): super(key: key);

  final String title;

  @override 
 State <OutilsProfessionnels> createSate()=>_OutilsProfessionnels();
 
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

}

class _OutilsProfessionnels extends State<OutilsProfessionnels>{

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: custumText(widget.title,factory: 1.5,),
      ),
      
    );
  }

}