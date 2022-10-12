import 'package:flutter/material.dart';
import 'package:transport_expense_tracker/main.dart';
import 'package:transport_expense_tracker/screens/app_browser.dart';
import 'package:transport_expense_tracker/screens/expense_list_screen.dart';
import 'package:transport_expense_tracker/screens/local_notifications.dart';
import 'package:transport_expense_tracker/screens/notifications_page.dart';
import 'package:transport_expense_tracker/screens/profile_screen.dart';
import 'package:transport_expense_tracker/services/auth_service.dart';

import '../screens/share_screen.dart';

class AppDrawer extends StatelessWidget {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          title: FittedBox(child: Text('Hello ' +
              authService.getCurrentUser()!.email! + '!')),
          automaticallyImplyLeading: false,
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(MainScreen.routeName),
        ),
        Divider(height: 3, color: Colors.blueGrey),
        ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text('My Expenses'),
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(ExpenseListScreen.routeName),
        ),
        Divider(height: 3, color: Colors.blueGrey),
        Divider(height: 3, color: Colors.blueGrey),
        ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text('My Profile'),
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(ProfileScreen.routeName),
        ),
        Divider(height: 3, color: Colors.blueGrey),
        ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text('Notifications'),
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(LocalNotifications.routeName),
        ),
        Divider(height: 3, color: Colors.blueGrey),
        ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text('Share'),
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(Share1.routeName),
        ),
        Divider(height: 3, color: Colors.blueGrey),
        ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text('Notifications Page'),
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(NotificationsPage.routeName),
        ),
        Divider(height: 3, color: Colors.blueGrey),
      ]),
    );
  }
}
