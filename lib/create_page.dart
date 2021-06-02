

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();
  File _image;
  final picker =ImagePicker();

  @override
  void dispose(){
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed:_getImage,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

 AppBar _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
            onPressed: () {

        },
            icon: Icon(Icons.send)
        ),
      ],
    );
  }

 Widget _buildBody() {
    return Column(
      children: <Widget>[
        _image ==null ? Text('No Image'): Image.file(_image),
        TextField(
          decoration: InputDecoration(hintText: '내용을 입력하세요'),
          controller: textEditingController,
        )

      ],
    );
 }



  Future _getImage() async {
    // ImagePicker.pickImage(source: ImageSource.gallery);
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if(pickedFile != null){
        _image =File(pickedFile.path);
      }else{
        Text('no Image');
      }
    });
  }
}
