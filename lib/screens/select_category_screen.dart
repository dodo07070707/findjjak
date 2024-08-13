import 'package:findjjak/theme/text_theme.dart';
import 'package:findjjak/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:findjjak/screens/name_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectCategoryScreen extends StatefulWidget {
  const SelectCategoryScreen({super.key});

  @override
  State<SelectCategoryScreen> createState() => _SelectCategoryScreenState();
}

List<String> tastelist = ['로코', '액션', '호러', 'SF'];
List<String> whymolist = ['고양이상', '강아지상', '토끼상', '여우상'];
List<String> personalitylist = ['다정한', '츤데레', '애교있는'];
List<String> jinlolist = ['이과', '문과', '예체능'];

class _SelectCategoryScreenState extends State<SelectCategoryScreen> {
  String taste = tastelist.first;
  String whymo = whymolist.first;
  String personality = personalitylist.first;
  String jinlo = jinlolist.first;

  Future<void> _saveValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('nowtaste', taste);
    await prefs.setString('nowwhymo', whymo);
    await prefs.setString('nowpersonality', personality);
    await prefs.setString('nowjinlo', jinlo);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double screenHeight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double screenWidth = MediaQuery.of(context).size.width;
    //1440 1024
    return Scaffold(
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: screenHeight / 1024 * 600,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: screenWidth / 1440 * 200,
                  height: screenHeight / 1080 * 600,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                          text: '영화취향 선택',
                          style: FindjjakTextTheme.SelectGender),
                      SizedBox(height: screenHeight / 1024 * 20),
                      SizedBox(
                        width: screenWidth / 1440 * 200,
                        child: DropdownButton(
                          value: taste,
                          isExpanded: true,
                          icon: const Icon(Icons.arrow_drop_down_sharp),
                          elevation: 16,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                          underline: Container(
                            height: 2,
                            color: Colors.black,
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              taste = value!;
                            });
                          },
                          items: tastelist
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: screenWidth / 1440 * 200,
                  height: screenHeight / 1080 * 600,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                          text: '외모 선택', style: FindjjakTextTheme.SelectGender),
                      SizedBox(height: screenHeight / 1024 * 20),
                      SizedBox(
                        width: screenWidth / 1440 * 200,
                        child: DropdownButton(
                          value: whymo,
                          isExpanded: true,
                          icon: const Icon(Icons.arrow_drop_down_sharp),
                          elevation: 16,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                          underline: Container(
                            height: 2,
                            color: Colors.black,
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              whymo = value!;
                            });
                          },
                          items: whymolist
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: screenWidth / 1440 * 200,
                  height: screenHeight / 1080 * 600,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                          text: '성격 선택', style: FindjjakTextTheme.SelectGender),
                      SizedBox(height: screenHeight / 1024 * 20),
                      SizedBox(
                        width: screenWidth / 1440 * 200,
                        child: DropdownButton(
                          value: personality,
                          isExpanded: true,
                          icon: const Icon(Icons.arrow_drop_down_sharp),
                          elevation: 16,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                          underline: Container(
                            height: 2,
                            color: Colors.black,
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              personality = value!;
                            });
                          },
                          items: personalitylist
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: screenWidth / 1440 * 200,
                  height: screenHeight / 1080 * 600,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                          text: '진로 선택', style: FindjjakTextTheme.SelectGender),
                      SizedBox(height: screenHeight / 1024 * 20),
                      SizedBox(
                        width: screenWidth / 1440 * 200,
                        child: DropdownButton(
                          value: jinlo,
                          isExpanded: true,
                          icon: const Icon(Icons.arrow_drop_down_sharp),
                          elevation: 16,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                          underline: Container(
                            height: 2,
                            color: Colors.black,
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              jinlo = value!;
                            });
                          },
                          items: jinlolist
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              _saveValue();
              Get.to(() => const NameScreen());
            },
            child: Container(
              width: screenWidth / 1440 * 80,
              height: screenWidth / 1440 * 80,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.black,
                size: screenWidth / 1440 * 26,
                weight: 0.5,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
