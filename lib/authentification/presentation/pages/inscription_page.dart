import 'package:flutter/material.dart';

import '../../../shared/utils/appColor.dart';
import '../../../shared/utils/dimens.dart';
import '../styles/space12.dart';
import '../styles/space25.dart';
import '../views/bouton_primary.dart';
import '../views/form_title_logo.dart';
import '../views/password_text_field.dart';
import '../views/text_field_custorm.dart';
import '../views/text_label_form.dart';
import 'connexion_page.dart';

class InscriptionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InscriptionPage();
}

class _InscriptionPage extends State<InscriptionPage> {
  TextEditingController _textEditingControllerNoms = TextEditingController();
  TextEditingController _textEditingControllerEmail = TextEditingController();
  TextEditingController _textEditingControllerPassword =
      TextEditingController();
  TextEditingController _textEditingControllerConfirmPassword =
      TextEditingController();

  String? valueChoose;

  List listItem = ["Douala", "Yaoundé", "Garoua", "Bertoua", "Kribi"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.white),
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding,
                            vertical: defaultPadding),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FormTitleLogo(titre: "Inscription"),
                            Space25(),
                            TextFieldCustorm(
                              hintText: "Noms",
                              icon: Icons.person,
                              textEditingController: _textEditingControllerNoms,
                            ),
                            Space12(),
                            TextFieldCustorm(
                              hintText: "Email",
                              icon: Icons.email,
                              textEditingController:
                                  _textEditingControllerEmail,
                            ),
                            Space12(),
                            Align(
                              alignment: Alignment.topLeft,
                              child: TextlabelForm("Ville", color: colorText),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 2,
                                          offset: Offset(0, 1)),
                                    ],
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButton(
                                    isExpanded: true,
                                    iconSize: 30,
                                    underline: SizedBox(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: defaultTextSize),
                                    hint: Text("Ville "),
                                    value: valueChoose,
                                    onChanged: (newValue) {
                                      setState(() {
                                        valueChoose = newValue as String?;
                                        print("new value set :  $newValue ");
                                      });
                                    },
                                    items: listItem.map((valueItem) {
                                      return DropdownMenuItem(
                                        value: valueItem,
                                        child: Text(valueItem),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                            Space12(),
                            PasswordTextField(
                              hintText: "Mot de passe ",
                              textEditingController:
                                  _textEditingControllerPassword,
                            ),
                            Space12(),
                            PasswordTextField(
                              hintText: "Confirm mot de passe ",
                              textEditingController:
                                  _textEditingControllerConfirmPassword,
                            ),
                            Space12(),
                            BoutonPrimary(
                              titre: "Inscription",
                              onClick: () {
                                setState(() {
                                  print(
                                      "noms : ${_textEditingControllerNoms.text}, email :${_textEditingControllerEmail.text}, Ville : ${valueChoose} , motdepasse : ${_textEditingControllerPassword.text}, confirmmotdepasse : ${_textEditingControllerConfirmPassword.text} ");
                                });
                              },
                            ),
                            Space12(),
                            TextButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ConnexionPage())),
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "Déjà un compte ?  ",
                                      style: TextStyle(
                                          color: colorText,
                                          fontSize: defaultTextSize,
                                          fontWeight: FontWeight.w600)),
                                  TextSpan(
                                      text: "Connexion",
                                      style: TextStyle(
                                        color: colorPrimary,
                                        fontSize: defaultTextSize,
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold,
                                      ),),
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
          ],
        ),
      ),
    );
  }
}
