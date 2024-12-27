import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Sample notifications with read status
  final List<Map<String, dynamic>> _notifications = [
    {
      "title": "Welcome to Our Gym!",
      "subtitle": "Start your fitness journey with us today!",
      "time": "Just now",
      "isRead": false,
    },
    {
      "title": "Membership Renewal",
      "subtitle": "Your membership expires in 3 days. Renew now!",
      "time": "2 hours ago",
      "isRead": false,
    },
    {
      "title": "Special Offer",
      "subtitle": "Get 20% off on our VIP membership for a limited time.",
      "time": "1 day ago",
      "isRead": true,
    },
    {
      "title": "New Classes Added",
      "subtitle": "Check out the new Yoga and HIIT classes available now.",
      "time": "2 days ago",
      "isRead": true,
    },
    {
      "title": "Workout Reminder",
      "subtitle": "Don’t forget to complete your daily workout!",
      "time": "3 days ago",
      "isRead": false,
    },
  ];

  // Method to mark all as read
  void _markAllAsRead() {
    setState(() {
      for (var notification in _notifications) {
        notification['isRead'] = true;
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('All notifications marked as read')),
    );
  }

  // Method to clear all notifications
  void _clearNotifications() {
    setState(() {
      _notifications.clear();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('All notifications cleared')),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Count unread notifications
    int unreadCount = _notifications.where((n) => !n['isRead']).length;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Notifications (${unreadCount} unread)"),
          backgroundColor: Colors.blueAccent,
          actions: [
            if (_notifications.isNotEmpty)
              IconButton(
                onPressed: _markAllAsRead,
                icon: Icon(Icons.check_circle),
                tooltip: "Mark All as Read",
              ),
            IconButton(
              onPressed: _clearNotifications,
              icon: Icon(Icons.delete),
              tooltip: "Clear All",
            )
          ],
        ),
        backgroundColor: Colors.black,
        body: _notifications.isEmpty
            ? Center(
          child: Text(
            "No new notifications",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        )
            : ListView.builder(
          itemCount: _notifications.length,
          itemBuilder: (context, index) {
            final notification = _notifications[index];
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: notification['isRead']
                  ? Colors.grey[850]
                  : Colors.blueGrey[700],
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: notification['isRead']
                      ? Colors.grey
                      : Colors.blueAccent,
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  notification['title']!,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  notification['subtitle']!,
                  style: TextStyle(color: Colors.white70),
                ),
                trailing: Text(
                  notification['time']!,
                  style: TextStyle(
                      fontSize: 12,
                      color: notification['isRead']
                          ? Colors.grey
                          : Colors.white),
                ),
                onTap: () {
                  setState(() {
                    notification['isRead'] = true;
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
