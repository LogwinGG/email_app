import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Timur'),
            accountEmail: Text('imomov_t@mail.ru'),
            decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.blue[800], Colors.grey[900]])), //begin: Alignment.topCenter ,end: Alignment.bottomCenter,
            currentAccountPicture: CircleAvatar(backgroundColor: Colors.black, child: Text('IT'),foregroundColor: Colors.amber,),
            otherAccountsPictures: <Widget>[
              GestureDetector(
                child: CircleAvatar(
                  child: Icon(Icons.add),
                  backgroundColor: Color.fromRGBO(255, 255, 255, 0.08),
                  foregroundColor: Colors.white54,
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Добавление еще одного аккаунта '),
                    ),
                  );
                },
              ),
            ],
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.inbox),
            title: Text('Входящие'),
            trailing: Chip(
              label: Text('0', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold), ),
              backgroundColor: Colors.yellow[700],
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.paperPlane),
            title: Text('Отправленные'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.edit),
            title: Text('Черновики'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.archive),
            title: Text('Архив'),
            onTap: () => {},
          ),
          Divider(),
          ListTile(
            leading: Icon(FontAwesomeIcons.trash),
            title: Text('Корзина'),
            onTap: () => {},
          ),
          Divider(),

          Expanded(child: Align(alignment: FractionalOffset.bottomCenter, child: ListTile(
            leading: Icon(FontAwesomeIcons.cog),
            title: Text('Настройки'),
            onTap: () => {},
          ))),
        ],
      ),
    );
  }
}
