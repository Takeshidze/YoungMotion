import 'dart:io';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:young_motion/core/models/record_model.dart';
import 'package:young_motion/core/repository/records_service/records_service_impl.dart';
import 'package:young_motion/core/widgets/nearest_entry_card.dart';

@RoutePage()
class RecordsScreen extends StatefulWidget {
  @override
  _RecordsScreenState createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  final RecordSeviceImpl _recordService = RecordSeviceImpl();
  List<RecordModel> _records = [];

  @override
  void initState() {
    super.initState();
    _loadRecords();
  }

  Future<void> _loadRecords() async {
    final records = await _recordService.getAllRecords();
    setState(() {
      _records = records;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ваши записи')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: _records.length,
          itemBuilder: (context, index) {
            return NearesEntryCard(recordModel: _records[index]);
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 8,
            );
          },
        ),
      ),
    );
  }
}
