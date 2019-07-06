import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/src/material/dropdown.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Zoom',
    home: SIForm(),
    theme: ThemeData(
      primaryColor: Colors.blueAccent,
      accentColor: Colors.lightBlueAccent,
    ),
  ));
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  var _currencies = ['Select', 'Male', 'Female'];
  var _formKey = GlobalKey<FormState>();
   var _currentItemSelected='Select';

  final _minimumPadding = 5.0;
TextEditingController nameController = TextEditingController();
TextEditingController cityController = TextEditingController();
TextEditingController ageController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Form Validation"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(_minimumPadding * 2),
          child: Column(
            children: <Widget>[
              getImageAsset(),
              Padding(
                  padding: EdgeInsets.all(5.0),
                  child: TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter the values !";
                      }
                    },
                    controller: nameController,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(
                          fontSize: 19.0,
                        ),
                        labelText: 'Name',
                        hintText: 'Type here',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              Padding(
                  padding: EdgeInsets.all(5.0),
                  child: TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter the vales  ';
                        }
                      },
                      controller: cityController,
                      decoration: InputDecoration(
                          errorStyle: TextStyle(fontSize: 19.0),
                          labelText: 'City',
                          // hintText: 'BB',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))))),
              Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: TextFormField(
                        keyboardType: TextInputType.number,
                        keyboardAppearance: Brightness.light,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please enter the value';
                          }
                        },
                        controller: ageController,
                        decoration: InputDecoration(
                            errorStyle: TextStyle(fontSize: 19.0),
                            labelText: 'Age',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                      Container(
                        width: 10.0,
                      ),
                      Expanded(
                          child: new Theme(
                              data: Theme.of(context).copyWith(
                                  canvasColor: Colors.blue.shade200,
                                  highlightColor: Colors.blueAccent),
                              child: DropdownButton<String>(
                              
                                items: _currencies.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                isExpanded: true,
                                value: _currentItemSelected,
                                onChanged: (String newValueSelected) {
                                _onDropDownSelected(newValueSelected);
                                //  _currentItemSelected=newValueSelected;
                                },
                              ))),
                    ],
                  )),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      splashColor: Colors.blue,
                      elevation: 30.0,
                      textColor: Colors.white,
                      color: Colors.blueAccent,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      child: Text(
                        "Submit",
                        textScaleFactor: 1.4,
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {}
                      },
                    ),
                  ),
                  Container(
                    width: 8.0,
                  ),
                  Expanded(
                    child: RaisedButton(
                      textColor: Colors.white,
                      elevation: 30.0,
                      color: Colors.blueAccent,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      child: Text(
                        "Reset",
                        textScaleFactor: 1.4,
                      ),
                      onPressed: () {
                        setState(() {
                          _reset();
                        });
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/flu.jpg');
    Image image = Image(
      image: assetImage,
      width: 125.0,
      height: 125.0,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(_minimumPadding * 10),
    );
  }

  void _reset() { 
    nameController.text="";
    cityController.text="";
    ageController.text="";

  _currentItemSelected=_currencies[0];
  }

  void _onDropDownSelected(String newValueSelected){
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }
}
