import 'package:findjjak/theme/text_theme.dart';
import 'package:findjjak/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'select_category_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _saveValue(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('nowgender', value);
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    _saveValue('랄프');
                    Get.to(() => const SelectCategoryScreen());
                  },
                  child: SizedBox(
                    width: screenWidth / 1024 * 511,
                    height: screenHeight,
                    child: const Center(
                      child: CustomText(
                        text: '랄프',
                        style: FindjjakTextTheme.SelectGender,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: screenWidth / 1024 * 1,
                  height: screenHeight,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _saveValue('바넬로피');
                    Get.to(() => const SelectCategoryScreen());
                  },
                  child: SizedBox(
                    width: screenWidth / 1024 * 511,
                    height: screenHeight,
                    child: const Center(
                      child: CustomText(
                        text: '바넬로피',
                        style: FindjjakTextTheme.SelectGender,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
