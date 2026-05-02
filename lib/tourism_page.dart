import 'package:flutter/material.dart';

class TourismPage extends StatelessWidget {
  const TourismPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("السياحة في موريتانيا"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              title: Text("شنقيط"),
              subtitle: Text("مدينة تاريخية جميلة في الصحراء"),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("وادان"),
              subtitle: Text("من أقدم المدن التاريخية"),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("آدرار"),
              subtitle: Text("منطقة سياحية طبيعية رائعة"),
            ),
          ),
        ],
      ),
    );
  }
}