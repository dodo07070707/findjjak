import 'package:findjjak/screens/result_screen.dart';
import 'package:findjjak/theme/text_theme.dart';
import 'package:findjjak/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'dart:convert';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  String? gender;
  String? taste;
  String? whymo;
  String? personality;
  String? jinlo;
  final TextEditingController _controller = TextEditingController();
  String id = '';
  List<List<String>> allLists = [];

  @override
  void initState() {
    super.initState();
    _getValue();
    _loadLists();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _getValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      gender = prefs.getString('nowgender');
      taste = prefs.getString('nowtaste');
      whymo = prefs.getString('nowwhymo');
      personality = prefs.getString('nowpersonality');
      jinlo = prefs.getString('nowjinlo');
    });
  }

  Future<void> _loadLists() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> storedLists = prefs.getStringList('allLists') ?? [];
    allLists =
        storedLists.map((list) => List<String>.from(jsonDecode(list))).toList();
    setState(() {});
  }

  Future<void> _saveValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> info = [id, gender!, taste!, whymo!, personality!, jinlo!];
    List<String> storedLists = prefs.getStringList('allLists') ?? [];
    storedLists.add(jsonEncode(info));
    await prefs.setStringList('nowlist', info);
    await prefs.setStringList('allLists', storedLists);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double screenHeight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double screenWidth = MediaQuery.of(context).size.width;
    //1440 1024
    return Scaffold(
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight / 1024 * 150),
            Container(
              width: screenWidth / 1440 * 500,
              height: screenHeight / 1024 * 400,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        text: '성별 : ${gender!}',
                        style: FindjjakTextTheme.ReCheck),
                    CustomText(
                        text: '영화 취향 : ${taste!}',
                        style: FindjjakTextTheme.ReCheck),
                    CustomText(
                        text: '외모 취향 : ${whymo!}',
                        style: FindjjakTextTheme.ReCheck),
                    CustomText(
                        text: '성격 취향 : ${personality!}',
                        style: FindjjakTextTheme.ReCheck),
                    CustomText(
                        text: '진로 : ${jinlo!}',
                        style: FindjjakTextTheme.ReCheck),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight / 1024 * 100),
            SizedBox(
              width: screenWidth / 1440 * 500,
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: '인스타그램 아이디를 입력해주세요 (e.g. @d0_.yxn_)',
                ),
              ),
            ),
            SizedBox(height: screenHeight / 1024 * 40),
            GestureDetector(
              onTap: () {
                setState(() {
                  id = _controller.text;
                });
                _saveValue();
                Get.to(() => const ResultScreen());
              },
              child: Container(
                width: screenWidth / 1440 * 70,
                height: screenWidth / 1440 * 70,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.black,
                  size: screenWidth / 1440 * 22,
                  weight: 0.5,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
