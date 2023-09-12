import 'package:flutter/material.dart';
import 'package:madeincameroon/shared/presentation/pages/home_page.dart';
import '../../../shared/utils/appColor.dart';
import '../../../shared/utils/dimens.dart';
import '../styles/space12.dart';
import '../styles/space25.dart';
import '../views/bouton_primary.dart';
import '../views/form_title_logo.dart';
import '../views/password_text_field.dart';
import '../views/text_field_custorm.dart';
import 'inscription_page.dart';

class ConnexionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ConnexionPage();
}

class _ConnexionPage extends State<ConnexionPage> {
  TextEditingController _textEditingControllerEmail = TextEditingController();
  TextEditingController _textEditingControllerPassword =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print("height : ${MediaQuery.of(context).size.height} , width : ${MediaQuery.of(context).size.width} , ");
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Stack(
        children: [
          GestureDetector(
            child: SafeArea(
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding),
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.white),
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FormTitleLogo(titre: "Connexion"),
                            Space25(),
                            TextFieldCustorm(
                              hintText: "Email",
                              icon: Icons.email,
                              textEditingController: _textEditingControllerEmail,
                            ),
                            Space12(),
                            PasswordTextField(
                              hintText: "Mot de passe ",
                              textEditingController:
                                  _textEditingControllerPassword,
                            ),
                            Space12(),
                            Container(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Mot de passe oublié ?",
                                  style: TextStyle(
                                      fontSize: defaultTextSize,
                                      decoration: TextDecoration.underline,
                                      color: colorText,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Space12(),
                            BoutonPrimary(
                              titre: "Connexion",
                              onClick: () {
                                setState(() {
                                  //print("noms : ${_textEditingControllerEmail.text}, motdepasse : ${_textEditingControllerPassword.text} ");
                                  if (_textEditingControllerEmail.text ==
                                      "vendeur") {

                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomePage()));
                                  }
                                });
                              },
                            ),
                            Space12(),
                            TextButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InscriptionPage())),
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "Pas de compte ?  ",
                                      style: TextStyle(
                                          color: colorText,
                                          fontSize: defaultTextSize,
                                          fontWeight: FontWeight.w600)),
                                  TextSpan(
                                      text: "Inscription",
                                      style: TextStyle(
                                        color: colorPrimary,
                                        fontSize: defaultTextSize,
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ]),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
