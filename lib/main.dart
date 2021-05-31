import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'dart:async';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale("en"),
          const Locale("ja"),
        ],
        home: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyApp> {
  var _labelText = '-- 年 -- 月 -- 日';

  Future<void> _selectDate(BuildContext context) async {
    DateTime now = DateTime.now();
    final DateTime? selected = await showDatePicker(
      context: context,
      locale: const Locale("ja"),
      initialDate: now,
      firstDate: now,
      lastDate: now.add(Duration(days: 31)),
    );
    if (selected != null) {
      setState(() {
        _labelText = (DateFormat.yMMMd('ja')).format(selected);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DatePicker Test'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            ElevatedButton(
              child: Text('日付を選択'),
              onPressed: () => _selectDate(context),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                _labelText,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
