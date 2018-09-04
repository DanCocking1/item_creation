import 'package:flutter/material.dart';
import 'package:item_creation/models/remnant_items.dart';
import 'package:item_creation/ui/add_item.dart';
import 'package:item_creation/ui/show_item.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.green,
          accentColor: Colors.pinkAccent),
      title: ('Item Creation'),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Item Creator'),
        ),
        body: Container(
          child: ItemList(),
        ),
      ),
    );
  }
}

class ItemList extends StatefulWidget {
  final RemnantItem battleSkirt =
      RemnantItem('Battle Skirt', 'Battle dress + 1 ac', true, false, 1, 1);
  final RemnantItem battleBoots =
      RemnantItem('Battle Boots', '+1 AC + 5 speed', true, false, 1, 3);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  List itemsToList = new List<RemnantItem>();
  List itemsToList2 = new List<RemnantItem>();
  TextEditingController _name = new TextEditingController();
  String testString = " ";

  @override
  void initState() {
    super.initState();
    itemsToList.add(widget.battleSkirt);
    print('Added Item');
    itemsToList.add(widget.battleBoots);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      Flexible(
          child: ListView.builder(
              itemCount: itemsToList.length,
              itemBuilder: (BuildContext context, int index) => Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.indigo,
                        child: Text(itemsToList[index].armorLocation[0] +
                            itemsToList[index].armorLocation[1]),
                      ),
                      title: Text('${itemsToList[index].name}'),
                      subtitle: Text('${itemsToList[index].description}'),
                      onTap: () {
                        _showItemDetail(context, itemsToList[index]);
                      },
                      onLongPress: () =>
                          debugPrint('Removing ${itemsToList[index].name}'),
                    ),
                  ))),
          Text(testString),
      RaisedButton(
        child: Text('Add Item'),
          onPressed:(){
            _goToNextString(context);
          }
      )
    ]
        )

    );
  }
  _showItemDetail(BuildContext context, RemnantItem item) async{
    String a = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ShowItem(item)),
    );
    if(a == 'Delete' && itemsToList.length>1){
      print(itemsToList.length.toString());
      setState(() {
        itemsToList.remove(item);
        print(itemsToList.length.toString());
        print('Removed ${item.name}');
      });

    }else{
      if(a == 'Delete'){
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text('Cannot Delete Last Item')));
      }
    }
  }

  _goToNextString(BuildContext context) async {
    itemsToList2 = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddItem(itemsToList)),
    );
    if (itemsToList2.length != null) {
      setState(() {
        itemsToList = itemsToList2;
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text("${itemsToList[0].toString()}")));
      });
    }
  }
}
