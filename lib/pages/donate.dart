import 'package:covinfo/provider/nav_provider.dart';
import 'package:covinfo/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Donate extends StatefulWidget {
  const Donate({Key? key}) : super(key: key);

  @override
  State<Donate> createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  List<Widget> pages = [];

  @override
  void initState() {
    Provider.of<NavProvider>(context, listen: false).risk = 0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pages.clear();
    if (pages.isEmpty) {
      pages.add(buildStep1());
      pages.add(buildStep2());
      pages.add(buildStep3());
      pages.add(buildStep4());
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
              'Self Assessment Test',
              style: TextStyle(
                fontSize: 18,
                color: kSecondry,
                fontFamily: 'Typo Round',
              ),
            ),
          ],
        ),
      ),
      body: Consumer<NavProvider>(builder: (context, value, _) {
        return pages[value.stepSelcted];
      }),
    );
  }

  Widget buildStep1() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '1 out of 3',
            style: TextStyle(
              color: kText,
              fontSize: 22,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Are you experiencing any of the following?',
            style: TextStyle(
                fontSize: 22, color: Colors.white, fontFamily: 'Gotham Medium'),
          ),
          SizedBox(
            height: 30,
          ),
          buildTxt(title: 'Fever'),
          SizedBox(
            height: 10,
          ),
          buildTxt(title: 'Cough'),
          SizedBox(
            height: 10,
          ),
          buildTxt(title: 'Tiredness'),
          SizedBox(
            height: 10,
          ),
          buildTxt(title: 'Loss of taste or smell'),
          SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildBtn(
                  title: 'Yes',
                  onTap: () {
                    Provider.of<NavProvider>(context, listen: false)
                        .riskCount();
                    Provider.of<NavProvider>(context, listen: false)
                        .selectStep(1);
                  }),
              buildBtn(
                title: 'No',
                onTap: () {
                  Provider.of<NavProvider>(context, listen: false)
                      .selectStep(1);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildStep2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '2 out of 3',
            style: TextStyle(
              color: kText,
              fontSize: 22,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Are you experiencing any of the following?',
            style: TextStyle(
                fontSize: 22, color: Colors.white, fontFamily: 'Gotham Medium'),
          ),
          SizedBox(
            height: 30,
          ),
          buildTxt(title: 'Sore Throat'),
          SizedBox(
            height: 10,
          ),
          buildTxt(title: 'Headache'),
          SizedBox(
            height: 10,
          ),
          buildTxt(title: 'Aches and Pains'),
          SizedBox(
            height: 10,
          ),
          buildTxt(title: 'Diarrhoea'),
          SizedBox(
            height: 10,
          ),
          buildTxt(
              title: 'A rash on skin, or discolouration of fingers or toes'),
          SizedBox(
            height: 10,
          ),
          buildTxt(title: 'Red or irritated eyes'),
          SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildBtn(
                  title: 'Yes',
                  onTap: () {
                    Provider.of<NavProvider>(context, listen: false)
                        .riskCount();
                    Provider.of<NavProvider>(context, listen: false)
                        .selectStep(2);
                  }),
              buildBtn(
                title: 'No',
                onTap: () {
                  Provider.of<NavProvider>(context, listen: false)
                      .selectStep(2);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildStep3() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '3 out of 3',
            style: TextStyle(
              color: kText,
              fontSize: 22,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Are you experiencing any of the following?',
            style: TextStyle(
                fontSize: 22, color: Colors.white, fontFamily: 'Gotham Medium'),
          ),
          SizedBox(
            height: 30,
          ),
          buildTxt(title: 'difficulty breathing or shortness of breath'),
          SizedBox(
            height: 10,
          ),
          buildTxt(title: 'loss of speech or mobility, or confusion'),
          SizedBox(
            height: 10,
          ),
          buildTxt(title: 'chest pain'),
          SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildBtn(
                  title: 'Yes',
                  onTap: () {
                    Provider.of<NavProvider>(context, listen: false)
                        .riskCount();
                    Provider.of<NavProvider>(context, listen: false)
                        .selectStep(3);
                  }),
              buildBtn(
                title: 'No',
                onTap: () {
                  Provider.of<NavProvider>(context, listen: false)
                      .selectStep(3);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildStep4() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 40.0,
        horizontal: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<NavProvider>(
            builder: (context, value, _) {
              if (value.risk == 3) {
                return Text(
                  "Please call 108 for emergency or go to nearest health center.",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Gotham Medium',
                    color: kSecondry,
                  ),
                );
              } else if (value.risk == 2) {
                return Text(
                  "Please consult with any health assistant or go to nearest health center.",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Gotham Medium',
                    color: Colors.white,
                  ),
                );
              } else {
                return Text(
                  "People with mild symptoms who are otherwise healthy should manage their symptoms at home.",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Gotham Medium',
                    color: Colors.white,
                  ),
                );
              }
            },
          ),
          SizedBox(
            height: 60,
          ),
          buildBtn(
              title: 'Back To Home',
              onTap: () {
                Provider.of<NavProvider>(context, listen: false).selectTab(0);
                Provider.of<NavProvider>(context, listen: false).risk = 0;
                Provider.of<NavProvider>(context, listen: false).selectStep(0);
              }),
          SizedBox(
            height: 20,
          ),
          buildBtn(
              title: 'Try Again',
              onTap: () {
                Provider.of<NavProvider>(context, listen: false).risk = 0;
                Provider.of<NavProvider>(context, listen: false).selectStep(0);
              }),
        ],
      ),
    );
  }

  Widget buildBtn({
    required String title,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kPrimary,
          boxShadow: [
            BoxShadow(
                offset: Offset(-2, -2),
                color: kText.withOpacity(0.4),
                blurRadius: 12),
            BoxShadow(
                offset: Offset(6, 6),
                color: Colors.black.withOpacity(0.8),
                blurRadius: 16)
          ],
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: kText,
            fontFamily: "Gotham Medium",
          ),
        ),
      ),
    );
  }

  Widget buildTxt({required String title}) {
    return Row(
      children: [
        Container(
          height: 12,
          width: 12,
          decoration: BoxDecoration(
            color: kSecondry,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: Text(
            title,
            style: TextStyle(
              color: kSecondry,
              fontFamily: 'Typo Round',
              fontSize: 18,
            ),
          ),
        )
      ],
    );
  }
}
