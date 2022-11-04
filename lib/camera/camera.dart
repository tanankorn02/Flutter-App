import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:aqua/login_register/login.dart';
import 'package:aqua/webview/allanime.dart';
import 'package:aqua/contact/dev.dart';
import 'package:aqua/camera/camera.dart';
import 'package:aqua/contact/contact.dart';

class camera extends StatelessWidget {
  final String title;

  const camera({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera'),
      ),
      // drawer: Drawer(
      //   child: Drawer(
      //     child: ListView(
      //       padding: EdgeInsets.zero,
      //       children: <Widget>[
      //         DrawerHeader(
      //           child: Text('Drawer Header'),
      //           decoration: BoxDecoration(
      //             color: Colors.blue,
      //           ),
      //         ),
      //         UserAccountsDrawerHeader(
      //           accountName: Text('Ruangrit'),
      //           accountEmail: Text('rockyzaza10@gmail.com'),
      //           currentAccountPicture: CircleAvatar(
      //             child: FlutterLogo(
      //               size: 42,
      //             ),
      //           ),
      //           otherAccountsPictures: [
      //             CircleAvatar(
      //               child: Text('R'),
      //             )
      //           ],
      //         ),
      //         ListTile(title: Text('item 1'), onTap: () {}),
      //         ListTile(
      //           title: Text('Item 2'),
      //           onTap: () {},
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      body: Center(
          child: ListView(children: const <Widget>[
            MyRadio(),
          ])),
    );
  }
}

class MyRadio extends StatefulWidget {
  const MyRadio({Key? key}) : super(key: key);

  @override
  _MyRadioState createState() => _MyRadioState();
}

class _MyRadioState extends State<MyRadio> {
  dynamic sex;
  bool checkboxValueA = true;
  bool checkboxValueB = true;
  List<String> provices = ['', 'BKK', 'Outbound'];
  dynamic provice = '';
  final _format = DateFormat('dd/MM/yyyy');
  File? _avatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //NameField(),
            //RadioSex(),
            // Row(children: [
            //   Text('$sex'),
            // ]),
            // CheakboxValue(),
            // Row(children: [
            //   Text('$checkboxValueA'),
            //   Text('$checkboxValueB'),
            // ]),
            //buildSelectField(),
            //buildDateField(),
            _avatar == null
                ? ElevatedButton(
              onPressed: () {
                onChooseImage();
              },
              child: Text('Choose avatar'),
            )
                : Image.file(_avatar!),
          ]),
    );
  }

  onChooseImage() async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _avatar = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  InputDecorator buildSelectField() {
    return InputDecorator(
      decoration: const InputDecoration(labelText: 'Province'),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: provice,
          onChanged: (value) {
            setState(() {
              provice = value;
            });
          },
          items: provices
              .map(
                (value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            ),
          )
              .toList(),
        ),
      ),
    );
  }

  TextFormField NameField() {
    return TextFormField(
      initialValue: 'Mr.A',
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
      ),
    );
  }

  Row CheakboxValue() {
    return Row(children: [
      Checkbox(
        value: checkboxValueA,
        onChanged: (bool? value) {
          setState(() {
            checkboxValueA = value!;
          });
        },
      ),
      const Text('CheckBox A'),
      Checkbox(
        value: checkboxValueB,
        onChanged: (bool? value) {
          setState(() {
            checkboxValueB = value!;
          });
        },
      ),
      const Text('CheckBox B'),
    ]);
  }

  Row RadioSex() {
    return Row(children: [
      Radio(
        value: 'M',
        groupValue: sex,
        onChanged: (value) {
          setState(() {
            sex = value;
          });
        },
      ),
      const Text('Male'),
      Radio(
        value: 'F',
        groupValue: sex,
        onChanged: (value) {
// _handleTapboxChanged(value);

          setState(() {
            sex = value;
          });
        },
      ),
      const Text('Female'),
    ]);
  }
}