import 'package:aulerta_final/models/medicines/showMedicine_model.dart';
import 'package:aulerta_final/repositories/medicine/showMedicine.dart';
import 'package:flutter/material.dart';

class ShowMedicineController extends ChangeNotifier {
  showMedicine_model? showMedicineModel;
  ShowMedicineAPI repository = ShowMedicineAPI();

  List<showMedicine_model> medicines = [];

  get response => null;

  Future<void> showMedicine(String idPet, String token) async {
    List<showMedicine_model> medicineList = await repository.showMedicine(idPet, token);

    if (medicineList.isNotEmpty) {
      medicines.addAll(medicineList);
    } else {
      medicines = [];
    }

    notifyListeners();
  }
}
