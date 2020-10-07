import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}


class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle chatContact = TextStyle(fontSize: 19);
  static List<String> entries = <String>['Contact 1', 'Contact 2', 'Contact 3', 'Contact 4', 'Contact 5', 'Contact 6', 'Contact 7', 'Contact 8', 'Contact 9', 'Contact 10'];
  static List<String> entriesSettings1 = <String>['Saved messages', 'Recent Calls', 'Devices', 'Chat Folders'];
  static List<Icon> settingsIcons = <Icon>[Icon(Icons.save), Icon(Icons.call), Icon(Icons.devices), Icon(Icons.folder)];
  static List<String> entriesSettings2 = <String>['Notifications', 'Privacy', 'Data and Storage', 'Appearance', 'Language', 'Stickers'];
  static List<Icon> settingsIcons2 = <Icon>[Icon(Icons.notifications), Icon(Icons.lock), Icon(Icons.data_usage), Icon(Icons.art_track), Icon(Icons.language), Icon(Icons.album)];
  //static List<int> colorCodes = <int>[600, 500, 100];

  static List<Widget> _widgetOptions = <Widget>[
    ListView.separated(
      padding: const EdgeInsets.all(10),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            height: 50,
            //color: Colors.white,
            child: Row(
              children: <Widget>[
                Expanded(child: Icon(Icons.face)),
                Expanded(child: Text('${entries[index]}'))
              ],
            ));
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    ),
    ListView.separated(
      padding: const EdgeInsets.all(10),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            height: 50,
            //color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Expanded(child: Icon(Icons.contacts)),
                Expanded(
                  flex: 1,
                  child: Icon(Icons.call),
                ),
                Expanded(
                    flex: 3,
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[Text('${entries[index]}', style: chatContact,),
                        Text('Missed call from ${entries[index]}', style: TextStyle(color: Colors.red),)],
                    )
                )
              ],
            ));
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    ),
    ListView.separated(
      padding: const EdgeInsets.all(10),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            height: 50,
            //color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Expanded(child: Icon(Icons.contacts)),
                Expanded(
                  flex: 1,
                  child: Icon(Icons.face),
                ),
                Expanded(
                  flex: 3,
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[Text('${entries[index]}', style: chatContact,),
                        Text('last message from ${entries[index]}')],
                    )
                )
              ],
            ));
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    ),
    ListView(
      padding: const EdgeInsets.all(10),
      children: <Widget>[
        Column(children: [
          Icon(Icons.face, size: 90,),
          Text('Name', style:TextStyle(fontSize: 30)),
          Text('+380999999999', style:TextStyle(fontSize: 20)),
          Text('userName', style:TextStyle(fontSize: 20)),
          SizedBox(height: 30,),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: entriesSettings1.length,
            itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 30,
                  child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 1,
                        child: settingsIcons[index]
                    ),
                    Expanded(
                        flex: 3,
                        child: Text('${entriesSettings1[index]}')
                    ),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.arrow_right)
                    ),
                  ],),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
          ),
          SizedBox(height: 30,),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: entriesSettings1.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 30,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 1,
                        child: settingsIcons2[index]
                    ),
                    Expanded(
                        flex: 3,
                        child: Text('${entriesSettings2[index]}')
                    ),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.arrow_right)
                    ),
                  ],),
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
          ),
        ],),
      ],
    ),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff47356c),
        title: const Text('ApepsGramm'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            title: Text('contacts'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            title: Text('calls'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('chats'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('settings'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff47356c),
        onTap: _onItemTapped,
      ),
    );
  }
}

