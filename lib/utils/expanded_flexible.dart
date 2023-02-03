import 'package:flutter/material.dart';

import 'media_query.dart';

class ExpandedFlexibleLayout extends StatelessWidget {
  const ExpandedFlexibleLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: const [
                ExpandedWidget(),
                Text('text'),
              ],
            ),
            Row(
              children: const [
                Text('text'),
                FlexibleWidget(),
              ],
            ),
            Row(
              children: const [
                ExpandedWidget(),
                FlexibleWidget(),
              ],
            ),
            Row(
              children: const [
                ExpandedWidget(),
                ExpandedWidget(),
              ],
            ),
            Row(
              children: const [
                FlexibleWidget(),
                FlexibleWidget(),
              ],
            ),
            Row(
              children: const [
                FlexibleWidget(),
                ExpandedWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: CustomColors.android,
          border: Border.all(color: Colors.white),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Expanded',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}

class FlexibleWidget extends StatelessWidget {
  const FlexibleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: CustomColors.greenAccent,
          border: Border.all(color: Colors.white),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Flexible',
            style: TextStyle(color: CustomColors.android, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
