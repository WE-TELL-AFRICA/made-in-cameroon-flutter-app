

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:madeincameroon/shared/utils/appColor.dart';


class MakeToast {


  static void show (String message, {Color? colorBackground = colorText}){

    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT, // Durée du toast
        gravity: ToastGravity.BOTTOM, // Position du toast
        timeInSecForIosWeb: 1, // Duréurée pour les appareils iOS et web
        backgroundColor: colorBackground, // Couleur de fond du toast
        textColor: Colors.white, // Couleur du texte du toast
        fontSize: 16.0 // Taille de police du texte du toast
    );

  }


}










