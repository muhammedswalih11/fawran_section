import 'package:flutter/material.dart';
import '../data/lists.dart';
import 'request_tabs.dart';
import 'request_card.dart';

class RequestSection extends StatefulWidget {
  const RequestSection({super.key});

  @override
  State<RequestSection> createState() => _RequestSectionState();
}

class _RequestSectionState extends State<RequestSection> {
  int selectedTab = 0; // 0 = Received, 1 = Sent

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ------- TWO BARS -------
        RequestTabs(
          selectedIndex: selectedTab,
          receivedCount: receivedRequests.length,
          sentCount: sentRequests.length,
          onTabChange: (index) {
            setState(() {
              selectedTab = index;
            });
          },
        ),

        const SizedBox(height: 16),

        // ------- LIST VIEW ------
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.20, // card height
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: selectedTab == 0
                ? receivedRequests.length
                : sentRequests.length,
            itemBuilder: (_, index) {
              final item = selectedTab == 0
                  ? receivedRequests[index]
                  : sentRequests[index];

              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: RequestCard(item: item),
              );
            },
          ),
        ),
      ],
    );
  }
}
