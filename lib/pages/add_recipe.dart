import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:swaad_sansaar/services/database.dart';
import 'package:swaad_sansaar/widget/support_widget.dart';

class AddRecipe extends StatefulWidget {
  const AddRecipe({super.key});

  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  //! --------------------------------------------
  File? selectedImage;
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController detailcontroller = new TextEditingController();

  final ImagePicker _picker = ImagePicker();

  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    selectedImage = File(image!.path);
    setState(() {});
  }

  UploadItem() async {
    if (selectedImage != null &&
        namecontroller.text != "" &&
        detailcontroller.text != "") {
      String addId = randomAlphaNumeric(10);

      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child("blogImage").child(addId);

      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);
      var downloadurl = await (await task).ref.getDownloadURL();

      Map<String, dynamic> addrecipe = {
        "Name": namecontroller.text,
        "Detail": detailcontroller.text,
        "Image": downloadurl
      };

      DatabaseMethods().Addrecipe(addrecipe).then((value) {
        Fluttertoast.showToast(
            msg: "Your Recipe has been added Successfully!!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        namecontroller.text = "";
        detailcontroller.text = "";
        selectedImage = null;
      });
    }
  }
  //! --------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
            top: 50.0,
            left: 20.0,
            right: 20.0), //* ------ pure container ka hi margin hai ye ------
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Add Recipe",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            selectedImage != null
                ? GestureDetector(
                    onTap: () {
                      getImage();
                    },
                    child: Center(
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all()),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              selectedImage!,
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      getImage();
                    },
                    child: Center(
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all()),
                        child: Icon(Icons.camera_alt_outlined),
                      ),
                    ),
                  ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Recipe Name",
              style: AppWidget.boldfieldtextstyle(),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: namecontroller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Write Recipe Name Here"),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Recipe Details",
              style: AppWidget.boldfieldtextstyle(),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: detailcontroller,
                maxLines: 10,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Write Recipe Details Here"),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            GestureDetector(
              onTap: () {
                UploadItem();
              },
              child: Container(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    "Save",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
