import 'package:flutter/material.dart';
import 'package:whatsapp/widgets/disc.dart';
import 'package:whatsapp/widgets/textCustum.dart';
import 'package:whatsapp/widgets/outilsProfessionnel.dart';


/*
Le home page est la page d'acceuil. Sur cette page on a
*/
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  tache tacheSelectionne =
      taches[0]; //Selectionner une tache tout en l'initialisant
  Personne personneInitiale = Pers[0]; //Initialisation de Personne

//Fonction permettant de parcourir les taches
  void optionSelectionne(tache t) {
    setState(() {
      tacheSelectionne = t;
    });
  }

  //Fonction permettant de parcourir les personnes
  void personneSlectionner(Personne p) {
    setState(() {
      personneInitiale = p;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 4,
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor:const Color.fromARGB(250, 12, 67, 72),
                  centerTitle: false,
                  title: custumText(
                  widget.title,
                  factory: 1.5,
                  ),
                  actions: [
                    const FlatButton(
                        onPressed: null,
                        child:
                            Icon(Icons.search, color: Colors.white, size: 30)),
                    PopupMenuButton(
                      icon: const Icon(Icons.menu),
                      elevation: 14,
                      initialValue: taches[0],
                      onSelected: (opt) {
                        setState(() {
                          opt = tacheSelectionne.option;
                          const OutilsProfessionnels(title: "Simple page");
                        });
                      },
                      itemBuilder: (BuildContext context) {
                        return taches.map((tache t) {
                          return PopupMenuItem<tache>(
                              value: t,
                              child: custumText(t.option, color: Colors.black));
                        }).toList();
                      },
                    )
                  ],
                  bottom: const TabBar(
                    tabs: <Widget>[
                      Tab(
                        child: Icon(Icons.camera),
                      ),
                      Tab(
                        text: "Disc",
                      ),
                      Tab(text: "STATUT"),
                      Tab(text: "APPELS"),
                    ],
                    labelColor: Colors.black,
                  ),
                ),
                body: TabBarView(children: <Widget>[
                  Column(
                    //Column pour la première tab
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [custumText("Page1", color: Colors.black)],
                  ),

                  //Ce liste view concerne la table disc
                  disc(Pers), //C'est une classe qui hérite de Stalesswidget

                  Column(
                    //Column pour la troisième tab
                    mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(personneInitiale.photo, 
                            width: 50, 
                            height: 50,
                            fit: BoxFit.cover,),
                          ), 
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children:[
                                  custumText("Mon statut",color:Colors.black,factory: 1.5,fontWeight: FontWeight.bold,)
                                ]
                              ), 
                              Row(
                                children: [
                                  custumText("Appuyer pour ajouter un statut",color: Colors.black,)
                                ],
                              )
                            ],
                          ), 
                          Row(
                            children: [
                              custumText("Récentes mises à jour",color: Colors.black,),
                            ],
                          ),
                        ],
                      ), 
                      ListView.builder(
                        itemCount: Pers.length,
                        itemBuilder: (context,i){
                          Personne item=Pers[i];
                          return Container(
                            padding: EdgeInsets.all(5.0),
                            child: Card(
                              elevation: 0.0, 
                              margin: EdgeInsets.all(5.0),
                              child: InkWell(
                                onTap: (){},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.asset(item.photo, 
                                      width: 50, 
                                      height: 50, 
                                      fit: BoxFit.cover,
                                      ),
                                    ), 
                                    Column(children: [
                                      custumText(item.nom+" "+item.Prenom,color: Colors.black,fontWeight: FontWeight.bold,factory: 1.5,), 
                                      custumText("data")
                                    ],)
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                    ],
                  ),

                  Column(
                    //Column pour la quatrième tab
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [custumText("Pages", color: Colors.black)],
                  ),
                ] // This trailing comma makes auto-formatting nicer for build methods.
                    ))));
  }
}

//Classe contenant la liste des tâches
class tache {
  late String option;
  //late Builder page;
  tache(String option) {
    this.option = option;
    //this.page=page;
  }
}

//Classe personne et se diferents caracteristiques
class Personne {
  late String nom;
  late String Prenom;
  late String photo;
  Personne(String nom, String Prenom, String photo) {
    this.nom = nom;
    this.Prenom = Prenom;
    this.photo = photo;
  }
}

//LIstes des personnes

List<Personne> Pers = [
  Personne("Dupont", "Mathias",
      "lib/image/personne-physique-ou-morale-ce-quil-vous-faut-savoir-13012022020600081226.jpg"),
  Personne("Lavoisier", "Jenifer", "lib/image/personne1.jpg"),
  Personne("Kéita", "Soumaile", "lib/image/personneChampiion.jpg"),
  Personne("Promax", "Diamond", "lib/image/personneDiamond.jpeg"),
  Personne("Chancelier", "Mandigo", "lib/image/personneLunnette.jpg"),
  Personne("Fally", "Ipupa", "lib/image/personneFally.jpeg"),
  Personne("Nikanor", "ProBen", "lib/image/personneNikanor.jpeg"),
  Personne("Akoho", "Mandigo", "lib/image/personneSoleil.jpg"),
  Personne("Joly", "Judith", "lib/image/personneSouriante.jpg"),
  Personne("Moukber", "Fernande",
      "lib/image/positive-thoughts-woman-happy-thinking-scaled.jpg"),
  Personne("Sekgod", "Prudencia",
      "lib/image/Prudence-Sekgodiso-Diamond-League-Rabat-800m.jpg")
];

//Listes des  options au niveau de l'AppBar
List<tache> taches = <tache>[
  tache("Outils professionnels"),
  tache("Nouveau groupe"),
  tache("Nouvelle Difusion"),
  tache("Étiquettes"),
  tache("Messages Importants"),
  tache("Paramètres")
];

/*taches.map((tache options ){
                return PopupMenuItem <tache>(
                  value: options,
                  child: custumText(options.option),
                  );
              })*/

