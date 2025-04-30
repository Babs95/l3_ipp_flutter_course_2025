import 'package:flutter/material.dart';

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
                      onPressed:() {
          
                      },
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