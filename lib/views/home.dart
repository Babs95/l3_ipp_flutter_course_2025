import 'package:flutter/material.dart';
import 'package:l3_ipp_app/common/constants_color.dart';
import 'package:l3_ipp_app/views/auth/login_screen.dart';

import '../common/size_config.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
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
        child: Container(
          width: double.infinity,
          height: SizeConfig.getProportionateScreenHeight(200),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(60),
                spreadRadius: 7,
                blurRadius: 8,
                offset: Offset(0, 2)
              )
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bienvenue',
                style: TextStyle(
                  fontSize: 45
                ),
              ),
              SizedBox(height: 8,),
              Text(
                'Que souhaitez-vous faire aujourd\'hui ?',
                style: TextStyle(
                    fontSize: 20
                ),
              ),
              SizedBox(height: 15,),
              SizedBox(
                width: double.infinity,
                height: SizeConfig.getProportionateScreenHeight(50),
                child: ElevatedButton(
                    onPressed:() {

                    },
                    style: ElevatedButton.styleFrom(

                    ),
                    child: Text(
                      'Se déconnecter',
                      style: TextStyle(
                          fontSize: 16,
                        //color: kWhiteColor
                      ),
                    )
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        iconSize: 30,
        onTap: (index) {
          switch(index) {
            case 0:
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Home()),
              );
            case 1:
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
          }
        },
        items: [
          BottomNavigationBarItem(label: 'Accueil', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Profil', icon: Icon(Icons.person)),
          BottomNavigationBarItem(label: 'Paramètres', icon: Icon(Icons.settings))
        ],
      ),
    );
  }
}