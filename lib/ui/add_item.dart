import 'package:flutter/material.dart';
import 'package:item_creation/models/remnant_items.dart';


class AddItem extends StatelessWidget {
  final List<RemnantItem> itemList;
  AddItem(this.itemList);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create new Item and add to Character'),
      ),
      body: AddItemForm(itemList),
    );
  }
}

class AddItemForm extends StatefulWidget {
  final List<RemnantItem> itemList;
  AddItemForm(this.itemList);
  @override
  _AddItemFormState createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  List<RemnantItem> listToAdd;
  TextEditingController _name = new TextEditingController();
  TextEditingController _description = new TextEditingController();
  int _armorValue;
  int armorLocationValue = 0;
  bool isItemEquipped = false;
  bool isItemMagical = false;

@override
  void initState() {
    super.initState();
    listToAdd = widget.itemList;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[

              Card(
                child: Column(
                  children: <Widget>[
                    Text('${listToAdd[0].name}'
                    ),  
                    TextField(
                      controller: _name,
                      decoration: InputDecoration(
                        icon: Icon(Icons.note_add),
                        labelText: "Item's Name"
                      ),
                    ),
                    TextField(
                      controller: _description,
                      decoration: InputDecoration(
                        icon: Icon(Icons.description),
                        labelText: "Item's Description"
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (val) =>
                      !int.parse(val).isNaN ? 'not a number' : null,
                      onSaved: (val) => _armorValue = int.parse(val),
                      //controller: _armorValue,
                      decoration: InputDecoration(
                        icon: Icon(Icons.show_chart),
                        labelText: 'Armor Value, 0 if not armor'
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Card(
                            child: CheckboxListTile(
                              title: Text('is Equipped?'),
                              value: isItemEquipped,
                              onChanged: (bool value) {
                                setState(() {
                                  isItemEquipped = value;
                                });
                              },

                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            child: CheckboxListTile(value: isItemMagical,
                                onChanged: (bool value) {
                        setState(() {
                        isItemMagical = value;
                        });
                        },
                              title: Text("is Magical?"),
                        ),
                          ),
                        )
                      ],
                    ),

                    Container(
                      color: Colors.green,
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Equip Location',
                                style: TextStyle(
                                  fontSize: 16.2,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,),
                            ),
                            Row(
                              children: <Widget>[
                               Expanded(
                                 child: RadioListTile<int>(
                                   title: Text("Can't Equip"),
                                   value: 0,
                                   groupValue: armorLocationValue,
                                   onChanged: _handleRadioValueChanged,),
                               ),
                                Expanded(
                                  child: RadioListTile<int>(
                                    title: Text("Body"),
                                    value: 1,
                                    groupValue: armorLocationValue,
                                    onChanged: _handleRadioValueChanged,),
                                ),
                               Expanded(
                                 child: RadioListTile<int>(
                                   title: Text("Back"),
                                   value: 2,
                                   groupValue: armorLocationValue,
                                   onChanged: _handleRadioValueChanged,),
                               ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: RadioListTile<int>(
                                    title: Text("Feet"),
                                    value: 3,
                                    groupValue: armorLocationValue,
                                    onChanged: _handleRadioValueChanged,),
                                ),
                                Expanded(
                                  child: RadioListTile<int>(
                                    title: Text("Neck"),
                                    value: 4,
                                    groupValue: armorLocationValue,
                                    onChanged: _handleRadioValueChanged,),
                                ),
                                Expanded(
                                  child: RadioListTile<int>(
                                    title: Text("Right Hand"),
                                    value: 5,
                                    groupValue: armorLocationValue,
                                    onChanged: _handleRadioValueChanged,),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Center(
                                    child: RadioListTile<int>(
                                      title: Text("Left Hand"),
                                      value: 6,
                                      groupValue: armorLocationValue,
                                      onChanged: _handleRadioValueChanged,),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),

                    ),


                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FlatButton(
                                  color: Colors.indigo,
                                  child: Text('Save Item'),
                                  onPressed: (){
                                    if(_name.text!=null && _name.text.isNotEmpty
                                        && _description.text!=null && _description.text.isNotEmpty
                                    ){
                                      setState(() {
                                        listToAdd.add(RemnantItem(_name.text,
                                            _description.text,
                                            isItemEquipped,
                                            isItemMagical, 
                                            _armorValue,
                                            armorLocationValue));
                                      });
                                      print(listToAdd.length.toString());
                                      Navigator.pop(context, listToAdd);

                                    }else{
                                      Scaffold
                                          .of(context)
                                          .showSnackBar(
                                          SnackBar(content: Text('Please Create Item With a name a description')));
                                    }

                                  },
                                ),
                              ),
                            ),
                            SizedBox(width: 20.2),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FlatButton(

                                  color: Colors.red,
                                  onPressed:() {
                                    Navigator.pop(context, widget.itemList);

                                  },
                                  child: Text('Cancel'),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              )
            ],

          ),
        ],
      ),
    );
  }
  void _handleRadioValueChanged(int value) {
    setState(() {
      armorLocationValue = value;
    });
    debugPrint(armorLocationValue.toString());

  }


}
