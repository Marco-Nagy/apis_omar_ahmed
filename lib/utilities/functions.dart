// ! Profile Image
import 'dart:convert';
import 'dart:io';

import 'package:apis_omar_ahmed/config/media_query_values.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

String base64Image = " ";

Future getMobImage() async {
  // Pick an image
  final imageProfile =
      await ImagePicker().pickImage(source: ImageSource.gallery);
  print('Image Path ==>> ${imageProfile!.path}');
  File profileImage = File(imageProfile.path);
  List<int> imageBytes = profileImage.readAsBytesSync();
  base64Image = base64.encode(imageBytes);

  return profileImage;
}

Future getWebImage() async {
  // Pick an image
  final imageProfile =
      await ImagePicker().pickImage(source: ImageSource.gallery);

  List<int> webImage = await imageProfile!.readAsBytes();
  base64Image = base64.encode(webImage);
  print('Image web ==>> ${base64.decode(base64Image)}');
  print('Image web ==>> ${base64Image}');

  return base64Image;
}

Future getCamImage() async {
  final imageProfile =
      await ImagePicker().pickImage(source: ImageSource.camera);
  print('Image Path ==>> ${imageProfile?.path}');
  File profileImage = File(imageProfile!.path);
  List<int> imageBytes = profileImage.readAsBytesSync();
  base64Image = base64.encode(imageBytes);
  return profileImage;
}

Future uploadImageMenu(
    {required BuildContext context, required Offset offset}) async {
  double top = offset.dy;
  return await showMenu<String>(
    color: Colors.grey.shade100,
    constraints: const BoxConstraints(maxWidth: 150, minWidth: 150),
    context: context,
    position: RelativeRect.fromLTRB(
        context.width / 1.5, context.height / 2.3, context.width * .095, 0),
    // position: const RelativeRect.fromLTRB(100, 360, 0, 100),
    //position where you want to show the menu on screen
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: Colors.grey,
        width: 2,
        style: BorderStyle.solid,
      ),
    ),
    items: [
      kIsWeb
          ? const PopupMenuItem(
              value: '1',
              height: 0,
              child: SizedBox(
                height: 0,
                width: 0,
              ))
          : PopupMenuItem<String>(
              value: '1',
              child: Row(
                children: [
                  Text(
                    'Camera',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const Spacer(),
                  const SizedBox(
                    width: 8,
                  ),
                  const Icon(Icons.camera_alt_rounded, color: Colors.grey),
                ],
              ),
            ),
      PopupMenuItem<String>(
        value: '2',
        child: Expanded(
          child: Row(
            children: [
              Text(
                'Gallery',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const Spacer(),
              const Icon(Icons.photo_album_outlined, color: Colors.grey),
            ],
          ),
        ),
      ),
      PopupMenuItem<String>(
        value: '3',
        child: Expanded(
          child: Row(
            children: [
              Text(
                'Remove Image',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const Spacer(),
              const Icon(Icons.highlight_remove_rounded, color: Colors.grey),
            ],
          ),
        ),
      ),
    ],
    elevation: 8.0,
  ).then((String? itemSelected) {
    if (itemSelected == null) return Container();

    if (itemSelected == "1") {
      return getCamImage();
    } else if (itemSelected == "2") {
      return kIsWeb ? getWebImage() : getMobImage();
    } else if (itemSelected == "3") {
      return null;
    }
  });
}
