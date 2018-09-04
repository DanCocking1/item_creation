import 'package:flutter/material.dart';
import 'package:item_creation/models/remnant_items.dart';

class ShowItem extends StatelessWidget {
  final RemnantItem item;
  ShowItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Center(
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        item.description
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded( 
                    child: Card(
                      child: ListTile(
                        title:  Text('Is the ${item.name} Equipped?'),
                        subtitle: Text('${item.isEquipped.toString()}'),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Card(
                      child: ListTile(
                        title: Text('Is the ${item.name} magical? '),
                        subtitle: Text('${item.isMagical.toString()}')
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Card(
                      child: ListTile(
                          title:  Text('Equip Location:      ${item.armorLocation}'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton(onPressed:(){
                    Navigator.pop(context, "Keep");
                  },
                      color: Colors.greenAccent,
                      child: Text('Ok')),
                ),
              ),
              SizedBox(width: 16.0,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton(onPressed: (){
                    Navigator.pop(context, 'Delete');
                  }, child: Text('Delete'),
                    color: Colors.red,),
                ),
              )
            ],
          )
        ],
      ),

    );
  }
}
