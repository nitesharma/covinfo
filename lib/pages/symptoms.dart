import 'package:covinfo/pages/info.dart';
import 'package:covinfo/provider/nav_provider.dart';
import 'package:covinfo/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Symptoms extends StatelessWidget {
  Symptoms({Key? key}) : super(key: key);

  final List<Widget> pages = [];

  @override
  Widget build(BuildContext context) {
    pages.clear();

    if (pages.isEmpty) {
      pages.add(buildSymptoms(context));
      pages.add(buildPrevention());
    }
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        titleSpacing: 10.0,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Provider.of<NavProvider>(context, listen: false).selectTab(0);
              },
              icon: Icon(
                CupertinoIcons.back,
                color: kSecondry,
              ),
            ),
            Text(
              'Symtopms & Prevention',
              style: TextStyle(
                fontSize: 18,
                color: kSecondry,
                fontFamily: 'Typo Round',
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            buildDivider(),
            Padding(
              padding: const EdgeInsets.only(
                left: 25.0,
                right: 25.0,
                top: 20,
                bottom: 20,
              ),
              child: Consumer<NavProvider>(builder: (context, value, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildButton(
                      context,
                      gradient: (value.btnSelected == 0)
                          ? btn
                          : LinearGradient(colors: [kPrimary, kPrimary]),
                      title: "Symtomps",
                      onTap: () {
                        value.selectBtn(0);
                      },
                      txtColor: (value.btnSelected == 0) ? Colors.white : kText,
                    ),
                    buildButton(
                      context,
                      gradient: (value.btnSelected == 1)
                          ? btn
                          : LinearGradient(colors: [kPrimary, kPrimary]),
                      title: "Preventions",
                      onTap: () {
                        value.selectBtn(1);
                      },
                      txtColor: (value.btnSelected == 1) ? Colors.white : kText,
                    ),
                  ],
                );
              }),
            ),
            buildDivider(),
            Consumer<NavProvider>(builder: (context, value, _) {
              if (value.btnSelected == 0) {
                return buildSymptoms(context);
              } else {
                return buildPrevention();
              }
            }),
          ],
        ),
      ),
    );
  }

  Column buildPrevention() {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        buildListTile(
          title: 'Wash Your Hands',
          subTitle:
              'Clean your hands often. Use soap and water, or an alcohol-based hand rub.',
          image: 'assets/icons/hands.png',
        ),
        SizedBox(
          height: 10,
        ),
        buildDivider(),
        SizedBox(
          height: 10,
        ),
        buildListTile(
          title: 'Wear a Mask',
          subTitle:
              'Wear a mask in public, especially indoors or when physical distancing is not possible.',
          image: 'assets/icons/mask.png',
        ),
        SizedBox(
          height: 10,
        ),
        buildDivider(),
        SizedBox(
          height: 10,
        ),
        buildListTile(
          title: 'Social Distancing',
          subTitle:
              'Maintain a safe distance from others (at least 1 metre), even if they don’t appear to be sick.',
          image: 'assets/icons/social.png',
        ),
        SizedBox(
          height: 10,
        ),
        buildDivider(),
        SizedBox(
          height: 10,
        ),
        buildListTile(
          title: 'Get Vaccination',
          subTitle:
              'Get vaccinated when it’s your turn. Follow local guidance about vaccination.',
          image: 'assets/icons/vaccination.png',
        ),
        SizedBox(
          height: 10,
        ),
        buildDivider(),
      ],
    );
  }

  Column buildSymptoms(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
          ),
          child: Text(
            'COVID-19 affects different people in different ways.Most infected people will develop mild to moderate illness and recover without hospitalization.',
            style: TextStyle(
              color: kText,
              fontSize: 11,
              fontFamily: 'Gotham Book',
            ),
          ),
        ),
        buildDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildDividerV(context),
            buildCard(context, image: 'assets/icons/fever.png', title: 'Fever'),
            buildDividerV(context),
            buildCard(context,
                image: 'assets/icons/pain.png', title: 'Headache'),
            buildDividerV(context),
            buildCard(
              context,
              image: 'assets/icons/throat.png',
              title: 'Sore throat',
            ),
            buildDividerV(context),
          ],
        ),
        buildDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildDividerV(
              context,
            ),
            buildCard(
              context,
              image: 'assets/icons/cough.png',
              title: 'Cough',
            ),
            buildDividerV(context),
            buildCard(
              context,
              image: 'assets/icons/chest.png',
              title: 'Chest Pain',
            ),
            buildDividerV(context),
            buildCard(
              context,
              image: 'assets/icons/weakness.png',
              title: 'Weakness',
            ),
            buildDividerV(context),
          ],
        ),
        buildDivider(),
        SizedBox(
          height: 10,
        ),
        Text(
          'On average it takes 5–6 days from when someone is infected with the virus for symptoms to show, however it can take up to 14 days.',
          style: TextStyle(
            color: kText,
            fontSize: 11,
            fontFamily: 'Gotham Book',
          ),
        ),
        SizedBox(
          height: 10,
        ),
        buildDivider(),
      ],
    );
  }

  Widget buildListTile({
    required String title,
    required String subTitle,
    required String image,
  }) {
    return ListTile(
      minVerticalPadding: 0,
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(20),
      //     side: BorderSide(color: kSecondry)),
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Gotham Medium',
            color: Colors.white,
          ),
        ),
      ),
      subtitle: Text(
        subTitle,
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'Gotham Book',
          color: kText,
        ),
      ),
      trailing: Image.asset(
        image,
        color: kSecondry,
        // height: 80,
      ),
    );
  }

  Container buildCard(BuildContext context,
      {required String title, required String image}) {
    return Container(
      height: MediaQuery.of(context).size.width / 2 - 40,
      width: MediaQuery.of(context).size.width / 4,
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 9,
              fontFamily: 'Gotham Medium',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset(
            image,
            color: kSecondry,
            height: 60,
          )
        ],
      ),
    );
  }

  Container buildDividerV(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 2 - 40,
      width: 1,
      decoration: BoxDecoration(
        color: Colors.black12,
        boxShadow: [
          BoxShadow(
            offset: Offset(-2, -2),
            color: Colors.black.withOpacity(0.2),
          ),
          BoxShadow(
            offset: Offset(-1, -1),
            color: Colors.black12.withOpacity(0.1),
          ),
          BoxShadow(
            offset: Offset(2, 2),
            color: Colors.black.withOpacity(0.3),
          ),
          BoxShadow(
            offset: Offset(1, 1),
            color: Colors.black12.withOpacity(0.2),
          ),
        ],
      ),
    );
  }

  Widget buildButton(
    context, {
    void Function()? onTap,
    required String title,
    required Gradient gradient,
    required Color txtColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: MediaQuery.of(context).size.width / 2 - 40,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          gradient: gradient,
          boxShadow: [
            BoxShadow(
              offset: Offset(-2, -2),
              color: kText.withOpacity(0.4),
              blurRadius: 8,
            ),
            BoxShadow(
                offset: Offset(6, 6),
                color: Colors.black.withOpacity(0.8),
                blurRadius: 16)
          ],
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: txtColor,
            fontFamily: 'Gotham Medium',
          ),
        ),
      ),
    );
  }

  Widget buildDivider() {
    return Container(
      height: 2,
      decoration: BoxDecoration(
        color: Colors.black12,
        boxShadow: [
          BoxShadow(
            offset: Offset(-1, -1),
            color: Colors.black12.withOpacity(0.1),
            blurRadius: 10,
          ),
          BoxShadow(
            offset: Offset(1, 1),
            color: Colors.black12.withOpacity(0.1),
          ),
          BoxShadow(
            offset: Offset(2, 2),
            color: Colors.black.withOpacity(0.1),
          ),
          BoxShadow(
            offset: Offset(-2, -2),
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
    );
  }
}
