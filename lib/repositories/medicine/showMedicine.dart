import 'dart:convert';
import 'dart:io';
import 'package:aulerta_final/models/medicines/showMedicine_model.dart';
import 'package:aulerta_final/utils/url.dart';
import 'package:http/http.dart' as http;

class ShowMedicineAPI {
  Future<List<showMedicine_model>> showMedicine(String idPet, String token) async {
    var url = Uri.parse('${VariaveisGlobais.baseUrl}/medicines/${idPet}');
    var headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: "Bearer " + token,
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> retorno = json.decode(utf8.decode(response.bodyBytes));

      if (retorno.containsKey('medicines')) {
        List<showMedicine_model> listaReserva = (retorno['medicines'] as List)
            .map((item) => showMedicine_model.fromJson(item))
            .toList();

        return listaReserva;
      } else {
        return [];
      }
    } else {
      throw Exception('Falha ao carregar os medicamentos');
    }
  }
}
