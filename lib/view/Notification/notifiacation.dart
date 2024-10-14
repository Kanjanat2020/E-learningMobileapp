import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart'; // Import for Slidable

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Size access

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          foregroundColor: Colors.black,
          backgroundColor: Colors.grey[100],
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz),
            ),
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text("Notifications"),
        ), // AppBar
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search notifications",
                  contentPadding: const EdgeInsets.all(16.0),
                  fillColor: Colors.black12,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ), // Padding
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Slidable(
                    endActionPane: ActionPane(
                      extentRatio: 0.3,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {},
                          icon: Icons.reply,
                          backgroundColor: Colors.grey[300]!,
                        ),
                        SlidableAction(
                          onPressed: (context) {},
                          icon: Icons.delete,
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red[700]!,
                        ),
                      ],
                    ),
                    child: ListTile(
                      isThreeLine: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.08,
                      ),
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage("assets/image/timi.jpeg"),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "George Antonio",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "2h Ago",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      subtitle: const Text(
                        "Please make the presentation before Friday. The next meeting agenda will be based on it.",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey[400],
                  indent: size.width * 0.08,
                  endIndent: size.width * 0.08,
                ),
                itemCount: 10,
              ),
            ), // Expanded
          ],
        ),
      ),
    );
  }
}
