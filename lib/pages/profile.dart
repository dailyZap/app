import 'dart:io';

import 'package:dailyzap/helpers/api/home_server.dart';
import 'package:dailyzap/helpers/api/urls.dart';
import 'package:dailyzap/helpers/navigation/navigation.dart';
import 'package:dailyzap/helpers/widgets/profile_picture.dart';
import 'package:dailyzap_api/api.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:june/june.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileResponseProps? profile;

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  void loadProfile() async {
    setState(() {
      profile = null;
    });
    final profileR = await profileApi.getProfile();
    setState(() {
      profile = profileR;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("My Profile"),
        ),
        body: profile == null
            ? const Center(child: CircularProgressIndicator())
            : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ProfilePicture(url: getMyProfilePictureUrl()),
                    ),
                    TextButton(
                        onPressed: () async {
                          final file = await pickImage(ImageSource.gallery);
                          if (file == null) {
                            return;
                          }
                          final uploadUrl =
                              (await profileApi.setProfilePicture())!;
                          final response = await http.put(
                              Uri.parse(uploadUrl.uploadUrl),
                              body: file.readAsBytesSync());
                          if (response.statusCode != 200) {
                            print("🚨 Error uploading image");
                          } else {
                            print("🎉 Image uploaded");
                          }
                          await FastCachedImageConfig.deleteCachedImage(
                              imageUrl: getMyProfilePictureUrl());
                          myProfilePictureVersion++;
                          final cacheState = June.getState(() => CacheState());
                          cacheState.setState();
                          loadProfile();
                        },
                        child: const Text("Change Picture")),
                    TextButton(
                      onPressed: () async {
                        await logout();
                        navigate('/');
                      },
                      child: const Text("Logout"),
                    ),
                  ],
                )
              ]));
  }

  File? pickedImage;

  Future<File?> pickImage(ImageSource imageType) async {
    File? tempImage;
    try {
      final photo =
          await ImagePicker().pickImage(source: imageType, imageQuality: 100);
      if (photo == null) return null;
      tempImage = File(photo.path);
      tempImage = await _cropImage(imageFile: tempImage);
      setState(() {
        pickedImage = tempImage;
      });
    } catch (error) {
      print(error.toString());
    }
    return tempImage;
  }

// Method for cropping the image file passed through a parameter.
  Future<File?> _cropImage({required File imageFile}) async {
    try {
      CroppedFile? croppedImg = await ImageCropper().cropImage(
          sourcePath: imageFile.path,
          compressQuality: 100,
          aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1));
      if (croppedImg == null) {
        return null;
      } else {
        return File(croppedImg.path);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
