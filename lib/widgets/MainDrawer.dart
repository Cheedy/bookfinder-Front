import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _createHeader(),
          Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Facilitez vos recherches :",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          _createDrawerItem((Icons.download), "Le + téléchargé", () {
            print("test");
          }),
          _createDrawerItem((Icons.flag), "Français", () {
            print("test");
          }),
          _createDrawerItem((Icons.category), "Catégories", () {
            print("test");
          }),
          Divider(),
          _createDrawerItem((Icons.visibility), "Contact", () {
            print("test");
          }),
          _createDrawerItem((Icons.visibility), "Contact", () {
            print("test");
          }),
          _createDrawerItem((Icons.visibility), "Contact", () {
            print("test");
          }),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill, image: AssetImage("assets/livres.jpeg")),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Container(
              color: Colors.black.withOpacity(0.7),
              padding: EdgeInsets.all(10),
              child: Text(
                "BookFinder",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _createDrawerItem(
      IconData icon, String text, GestureTapCallback onTap) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
