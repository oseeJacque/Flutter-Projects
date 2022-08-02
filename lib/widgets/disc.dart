import 'package:flutter/material.dart';
import 'package:whatsapp/widgets/homePage.dart';
import 'package:whatsapp/widgets/textCustum.dart';

class disc extends StatelessWidget {
  const disc(List<Personne> p);

  @override
  Widget build(BuildContext context) {
   
    return ListView.builder(
      //Column pour la deuxième  tab
      itemCount: Pers.length,
      itemBuilder: (context, i) {
        Personne item = Pers[i];
        return Container(
          padding: EdgeInsets.all(5.0),
          child: Card(
            elevation: 0.0,
            margin: EdgeInsets.all(5.0),
            child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      item.photo,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          custumText(
                            item.nom,
                            color: Colors.black,
                            factory: 1.5,
                            fontWeight: FontWeight.bold,
                          ),
                          custumText(
                            " " + item.Prenom,
                            color: Colors.black,
                            factory: 1.5,
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          custumText(
                            "Nouveau message.....!!",
                            color: Colors.black,
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [custumText("01:50", color: Colors.green)],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: custumText(
                          "5",
                          color: Colors.green,
                          factory: 1.0,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
