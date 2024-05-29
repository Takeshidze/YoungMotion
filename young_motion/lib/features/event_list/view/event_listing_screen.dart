import 'package:flutter/material.dart';
import 'package:young_motion/features/event_list/widgets/event_card.dart';
import '../widgets/search_bar.dart';
import '../widgets/filter_bar.dart';

class EventListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        title: Text(
          'Активности',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          children: [
            MySearchBar(),
            SizedBox(height: 16),
            Center(child: FilterBar()),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return EventCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
