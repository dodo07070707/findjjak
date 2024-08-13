import 'package:findjjak/screens/start_screen.dart';
import 'package:findjjak/theme/text_theme.dart';
import 'package:findjjak/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:math';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  List<String> nowlist = [];
  List<List<String>> allLists = [];

  @override
  void initState() {
    super.initState();
    _loadLists();
  }

  Future<void> _loadLists() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nowlist = prefs.getStringList('nowlist') ?? [];
    List<String> storedLists = prefs.getStringList('allLists') ?? [];
    allLists =
        storedLists.map((list) => List<String>.from(jsonDecode(list))).toList();
    setState(() {});
    print(allLists);
  }

  String? findMatchingUser(List<List<String>> users) {
    // 두 번째 속성이 같은 사용자 그룹을 찾기
    final Map<String, List<List<String>>> groups = {};
    for (var user in users) {
      final key = user[1]; // 두 번째 속성
      if (!groups.containsKey(key)) {
        groups[key] = [];
      }
      groups[key]!.add(user);
    }

    // 조건을 만족하는 사용자 그룹을 필터링
    final List<String> matchingUsers = [];
    for (var group in groups.values) {
      if (group.length < 2) continue;

      for (int i = 0; i < group.length; i++) {
        for (int j = i + 1; j < group.length; j++) {
          final user1 = group[i];
          final user2 = group[j];
          final commonAttributes = Set.from(user1.sublist(2))
              .intersection(Set.from(user2.sublist(2)));
          if (commonAttributes.length >= 2) {
            matchingUsers.add(user1[0]); // 첫 번째 속성만 필요
          }
        }
      }
    }

    if (matchingUsers.isNotEmpty) {
      final random = Random();
      return matchingUsers[random.nextInt(matchingUsers.length)];
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double screenHeight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double screenWidth = MediaQuery.of(context).size.width;
    //1440 1024
    final randomUser = findMatchingUser(allLists);
    return Scaffold(
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screenWidth / 1440 * 500,
              height: screenHeight / 1080 * 400,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: CustomText(
                    text: randomUser != null
                        ? '랜덤으로 선택된 사용자: $randomUser'
                        : '조건을 만족하는 사용자가 없습니다.',
                    style: FindjjakTextTheme.SelectGender),
              ),
            ),
            SizedBox(height: screenHeight / 1024 * 50),
            GestureDetector(
              onTap: () {
                Get.offAll(() => const StartScreen());
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
            ),
          ],
        ),
      ),
    );
  }
}
