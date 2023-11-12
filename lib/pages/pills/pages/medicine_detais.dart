// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aulerta_final/pages/pills/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';


class MedicineDetails extends StatefulWidget {
  const MedicineDetails({super.key});

  @override
  State<MedicineDetails> createState() => _MedicineDetailsState();
}

class _MedicineDetailsState extends State<MedicineDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Detalhes"),
      ),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          children: [
            const MainSection(),
            const ExtendedSection(),
            const Spacer(),
            SizedBox(
              width: 100.w,
              height: 7.h,
              child: TextButton(
                onPressed: () {},
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
}

class MainSection extends StatelessWidget {
  const MainSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgPicture.asset(
          "assets/icons/bottle.svg",
          height: 12.h,
          color: pkOtherColor,
        ),
        const Column(
          children: [
            MainInfoTab(
              fieldTitle: "Nome:",
              fieldInfo: "Catapol",
            ),
            MainInfoTab(
              fieldTitle: "Dosagem:",
              fieldInfo: "500mg",
            )
          ],
        ),
      ],
    );
  }
}

class MainInfoTab extends StatelessWidget {
  const MainInfoTab({
    Key? key,
    required this.fieldTitle,
    required this.fieldInfo,
  }) : super(key: key);
  final String fieldTitle;
  final String fieldInfo;

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
              fieldTitle,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(
              height: 0.3.h,
            ),
            Text(
              fieldInfo,
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

class ExtendedSection extends StatelessWidget {
  const ExtendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: const [
        ExtendedInfoTab(
          fieldTitle: 'Tipo do Medicamento:',
          fieldInfo: 'Xarope',
        ),
        ExtendedInfoTab(
          fieldTitle: 'Intervalo:',
          fieldInfo: 'A cada 8 horas | 3 vezes ao dia',
        ),
        ExtendedInfoTab(
          fieldTitle: 'Hora Inicial:',
          fieldInfo: '01:20',
        ),
      ],
    );
  }
}
