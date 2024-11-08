import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/history_controller.dart';

class HistoryPage extends StatelessWidget {
  final HistoryController controller = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Color(0xFFDCEBFF),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      onChanged: (query) {
                        controller.updateSearchQuery(query);
                      },
                      decoration: InputDecoration(
                        hintText: 'Cari item...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // List items
            Expanded(
              child: Obx(() => ListView.separated(
                itemCount: controller.displayedItems.length,
                separatorBuilder: (context, index) => Divider(color: Colors.black),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.access_time, color: Colors.grey),
                    title: Text(
                      controller.displayedItems[index],
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}
