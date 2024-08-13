import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'dart:convert';

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
    print(allLists);
  }

  Future<void> _loadLists() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nowlist = prefs.getStringList('nowlist') ?? [];
    List<String> storedLists = prefs.getStringList('allLists') ?? [];
    allLists =
        storedLists.map((list) => List<String>.from(jsonDecode(list))).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
