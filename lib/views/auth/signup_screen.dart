import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:l3_ipp_app/models/my_user_model.dart';
import 'package:l3_ipp_app/services/users_service.dart';
import 'package:l3_ipp_app/state_managment/provider/authentification_service.dart';

import '../../common/constants_color.dart';
import '../../common/size_config.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final authentificationService = AuthentificationService();
  final userService = UserService();

  bool isLoading = false;
  String? errorMessage = '';

  _signUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);
      try {
        //Création user dans firebaseAuth
        await authentificationService.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        // Sauvegarder sur la base FireStore
        MyUserModel userModel = MyUserModel(
            uuid: authentificationService.user!.uid,
            email: _emailController.text,
            nom: _nomController.text,
            prenom: _prenomController.text
        );

        await userService.createUser(userModel);

        setState(() {
          isLoading = false;
        });
        Navigator.of(context).pop();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Inscription réussi !',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            duration: Duration(seconds: 5),
            backgroundColor: kSuccessColor,
          ),
        );
      } on FirebaseAuthException catch (ex) {
        setState(() {
          isLoading = false;
          errorMessage = ex.message;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              errorMessage!,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            duration: Duration(seconds: 5),
            backgroundColor: kErrorColor,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: SizeConfig.getProportionateScreenHeight(150),
                    height: SizeConfig.getProportionateScreenHeight(150),
                    decoration: BoxDecoration(
                        color: kPrimaryColor.withAlpha(100),
                        shape: BoxShape.circle
                    ),
                    child: Icon(
                      Icons.perm_contact_cal_outlined,
                      size: 50,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Text(
                  'Dalal Ak Diam',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 8,),
                Text(
                  'Créez un compte pour continuer',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 20,),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nomController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          label: Text('Nom'),
                          hintText: "Entrez votre nom",
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0)
                          ),
                          //floatingLabelBehavior: FloatingLabelBehavior.always
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: _prenomController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          label: Text('Prénom'),
                          hintText: "Entrez votre prénom",
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0)
                          ),
                          //floatingLabelBehavior: FloatingLabelBehavior.always
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          label: Text('Email'),
                          hintText: "Entrez votre email",
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0)
                          ),
                          //floatingLabelBehavior: FloatingLabelBehavior.always
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            label: Text('Mot de passe'),
                            hintText: "Entrez votre mot de passe",
                            prefixIcon: Icon(Icons.lock_outline),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0)
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  height: SizeConfig.getProportionateScreenHeight(50),
                  child: ElevatedButton(
                      onPressed:_signUp,
                      style: ElevatedButton.styleFrom(
          
                      ),
                      child: Text(
                        'S\'inscrire',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                          //color: kWhiteColor
                        ),
                      )
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Vous avez un compte ?',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                          'Se connecter',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}