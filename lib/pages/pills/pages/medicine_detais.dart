// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aulerta_final/controller/Medicine/deleteMedicineController.dart';
import 'package:aulerta_final/controller/login/login_controller.dart';
import 'package:aulerta_final/pages/pills/constants.dart';
import 'package:aulerta_final/pages/pills/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';


class MedicineDetails extends StatefulWidget {
  const MedicineDetails({super.key, required this.id, required this.name, required this.dose, required this.frequency, required this.type, required this.pet_id});

  final int id;
  final String name;
  final String frequency;
  final String type;
  final int pet_id;
  final String dose;

  @override
  State<MedicineDetails> createState() => _MedicineDetailsState();
}

class _MedicineDetailsState extends State<MedicineDetails> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<LoginController, DeleteMedicineController>(
      builder: (context, loginController, deleteMedicineController, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Detalhes"),
          ),
          body: Padding(
            padding: EdgeInsets.all(2.h),
            child: Column(
              children: [
                MainSection(id: widget.id, name: widget.name.toString(), dose: widget.dose, frequency: widget.frequency, type: widget.type, pet_id: widget.pet_id),
                ExtendedSection(id: widget.id, name: widget.name.toString(), dose: widget.dose, frequency: widget.frequency, type: widget.type, pet_id: widget.pet_id),
                const Spacer(),
                SizedBox(
                  width: 100.w,
                  height: 7.h,
                  child: TextButton(
                    onPressed: () async{
                      String token = loginController.token!;
                          await deleteMedicineController.deleteMedicine(widget.id.toString(), token);
                          bool response = deleteMedicineController.response;
                          print(response);
                          if(response != false) {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => const PillsPage()),
                              (Route<dynamic> route) => false);
                          }
                        },
                    style: TextButton.styleFrom(
                        backgroundColor: pkSecondaryColor,
                        shape: const StadiumBorder()),
                    child: Text(
                      'Deletar',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                )
              ],
            ),
          ),
        );
      }
    );
  }
}

class MainSection extends StatefulWidget {
  const MainSection({super.key, required this.id, required this.name, required this.dose, required this.frequency, required this.type, required this.pet_id});

  final int id;
  final String name;
  final String frequency;
  final String type;
  final int pet_id;
  final String dose;

  @override
  State<MainSection> createState() => _MainSectionState();
}

class _MainSectionState extends State<MainSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgPicture.asset(
          widget.type == "pílula" ? 'assets/icons/pill.svg' : widget.type == "vacina" ? "assets/icons/syringe.svg" : widget.type == "cápsula" ? "assets/icons/tablet.svg" : widget.type == "xarope" ? "assets/icons/bottle.svg" : 'assets/icons/pill.svg',
          height: 12.h,
          color: pkOtherColor,
        ),
        Column(
          children: [
            MainInfoTab(
              fieldTitle: "Nome:",
              fieldInfo: widget.name.toString(),
            ),
            MainInfoTab(
              fieldTitle: "Dosagem:",
              fieldInfo: widget.dose.toString(),
            )
          ],
        ),
      ],
    );
  }
}

class MainInfoTab extends StatefulWidget {
  const MainInfoTab({
    Key? key,
    required this.fieldTitle,
    required this.fieldInfo,
  }) : super(key: key);
  final String fieldTitle;
  final String fieldInfo;

  @override
  State<MainInfoTab> createState() => _MainInfoTabState();
}

class _MainInfoTabState extends State<MainInfoTab> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.w,
      height: 10.h,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.fieldTitle,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(
              height: 0.3.h,
            ),
            Text(
              widget.fieldInfo,
              style: Theme.of(context).textTheme.headlineSmall,
            )
          ],
        ),
      ),
    );
  }
}

class ExtendedInfoTab extends StatelessWidget {
  const ExtendedInfoTab(
      {super.key, required this.fieldTitle, required this.fieldInfo});
  final String fieldTitle;
  final String fieldInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 1.h),
            child: Text(
              fieldTitle,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: pkTextColor),
            ),
          ),
          Text(
            fieldInfo,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: pkSecondaryColor,
                ),
          ),
        ],
      ),
    );
  }
}

class ExtendedSection extends StatefulWidget {
  const ExtendedSection({super.key, required this.id, required this.name, required this.dose, required this.frequency, required this.type, required this.pet_id});

  final int id;
  final String name;
  final String frequency;
  final String type;
  final int pet_id;
  final String dose;

  @override
  State<ExtendedSection> createState() => _ExtendedSectionState();
}

class _ExtendedSectionState extends State<ExtendedSection> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children:  [
        ExtendedInfoTab(
          fieldTitle: 'Tipo do Medicamento:',
          fieldInfo: widget.type.toString(),
        ),
        ExtendedInfoTab(
          fieldTitle: 'Intervalo:',
          fieldInfo: 'A cada ' + widget.frequency.toString() + ' horas',
        ),
        ExtendedInfoTab(
          fieldTitle: 'Hora Inicial:',
          fieldInfo: '01:20',
        ),
      ],
    );
  }
}
