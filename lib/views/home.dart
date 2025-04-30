import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('IPP'),
          actions: [
            Icon(Icons.alarm),
            Icon(Icons.ac_unit),
          ],
        ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.orange
              ),
              child: Text(
                'En tête du menu',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24
                ),
              ),
            ),
            ListTile(
                title: Text('Element 1'),
                iconColor: Colors.orange,
                leading: Icon(Icons.person),
                trailing: Icon(Icons.delete)
            ),
            ListTile(
              title: Text('Element 2'),
              iconColor: Colors.orange,
              leading: Icon(Icons.account_balance_wallet_sharp),
            ),
            ListTile(
              title: Text('Element 3'),
              iconColor: Colors.orange,
              leading: Icon(Icons.photo_camera),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Nom",
                    hintText: 'Entrez votre nom',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return "Ce champ ne peut pas être vide";
                    }

                    if(value.length < 5){
                      return "Ce champ doit au moins contenir 5 caractères";
                    }

                    return null;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Prénom",
                      hintText: 'Entrez votre prénom',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)
                      )
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Formulaire valide !'))
                        );
                      }else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Formulaire invalide !'))
                        );
                      }
                    },
                    child: Text('Soumettre')
                )
              ],
            )
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(label: 'Accueil', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Profil', icon: Icon(Icons.person)),
          BottomNavigationBarItem(label: 'Paramètres', icon: Icon(Icons.settings))
        ],
      ),
    );
  }
}