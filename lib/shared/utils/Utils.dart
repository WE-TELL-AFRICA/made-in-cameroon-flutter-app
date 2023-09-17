import 'package:dio/dio.dart';

class Utils {
  static String extracMessage(dynamic e) {
    if (e is DioError) {
      print("****** Erreur DioError retourné ... ${e.response?.toString()}");
      // Gérer les erreurs spécifiques à Dio
      if (e.response?.statusCode == 404) {
        return "La ressource demandée n'a pas été trouvée.";
      } else if (e.response?.statusCode == 401) {
        return "Non autorisé. Veuillez vérifier vos informations d'identification.";
      } else if (e.response?.statusCode == 500) {
        print("****** Erreur DioError 500 ... ${e.response?.toString()}");
        return "Un problème interne est survenue.";
      } else {
        return "Une erreur s'est produite lors de la requête.";
      }
    } else {
      // Gérer les autres erreurs d'exception
      return "Une erreur s'est produite lors de la requête.";
    }
  }

  static String oldExtracMessage(dynamic e) {
    try {
      if (e is DioException) {
        if (e.response?.data is String) {
          return e.response!.data;
        }
        var data = e.response?.data;
        var error = data['error'];
        if (error is String) {
          return error;
        }
      }
    } catch (e) {
      print(e);
      return e.toString();
    }
    return e.toString();
  }
}
