import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/core/controllers/edit_profile_controller.dart';
import 'package:instagram/core/controllers/user_controller.dart';
import 'package:instagram/core/models/user_model.dart';
import 'package:instagram/core/services/database.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/ui/styles/colors.dart';
import 'package:instagram/ui/styles/textstyles.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class EditProfilePage extends StatefulWidget {
  final UserModel user;
  const EditProfilePage({@required this.user});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _bioTextController = TextEditingController();
  TextEditingController _websiteTextController = TextEditingController();
  final picker = ImagePicker();
  EditProfileController _controller = Get.put(EditProfileController());
  bool isUpdating = false;

  @override
  Widget build(BuildContext context) {
    _nameTextController.text = widget.user.name;
    _bioTextController.text = widget.user.bio;
    _websiteTextController.text = widget.user.website;

    return isUpdating
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.black),
              title: const Text(
                "Edit Profile",
                style: TextStyle(color: Colors.black),
              ),
              leading: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Get.back();
                  }),
              actions: [
                IconButton(
                    icon: const Icon(Icons.done, color: primaryColor),
                    onPressed: () {
                      _updateProfile();
                    })
              ],
            ),
            body: Container(
              width: SizeConfig.screenWidth,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: GetBuilder<EditProfileController>(
                        builder: (value) {
                          return CircleAvatar(
                            radius: 50,
                            backgroundImage: value.file == null
                                ? CachedNetworkImageProvider(widget
                                        .user.userDp ??
                                    "https://thumbs.dreamstime.com/b/default-avatar-profile-vector-user-profile-default-avatar-profile-vector-user-profile-profile-179376714.jpg")
                                : AssetImage(value.file.path),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Center(
                      child: GestureDetector(
                          onTap: () {
                            _showImagePicker(context);
                          },
                          child: const Text(
                            "Change profile photo",
                            style: TextStyle(color: primaryColor, fontSize: 20),
                          )),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    _inputField(
                      label: "Name",
                      hint: widget.user.name,
                      controller: _nameTextController,
                    ),
                    _inputField(
                      label: "Website",
                      hint: widget.user.website,
                      controller: _websiteTextController,
                    ),
                    _inputField(
                      label: "Bio",
                      hint: widget.user.bio,
                      controller: _bioTextController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Switch to Professional account",
                      style: TextStyle(color: primaryColor, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Personal information settings",
                      style: TextStyle(color: primaryColor, fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
          );
  }

  _updateProfile() async {
    if (_nameTextController.text == widget.user.name &&
        _bioTextController.text == widget.user.bio &&
        _websiteTextController.text == widget.user.website &&
        _controller.file == null) {
      Get.back();
    } else {
      setState(() {
        isUpdating = true;
      });
      String newImage;
      if (_controller.file != null) {
        newImage = await Database()
            .uploadFile(file: _controller.file, id: widget.user.username);
        print("new image: " + newImage.toString());
      }

      await Database().updateUserData(
          userModel: UserModel(
        userDp: _controller.file != null ? newImage : widget.user.userDp,
        email: widget.user.email,
        name: _nameTextController.text,
        website: _websiteTextController.text,
        bio: _bioTextController.text,
      ));
      _controller.updateImageFile(null);
      setState(() {
        isUpdating = false;
      });
      Get.back();
    }
  }

  _showImagePicker(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text("Change Profile Photo"),
            children: [
              SimpleDialogOption(
                child: const Text("Photo with Camera"),
                onPressed: _handleTakePhoto,
              ),
              SimpleDialogOption(
                child: const Text("Image from Gallery"),
                onPressed: _handleChooseImageFromGallery,
              ),
              SimpleDialogOption(
                child: const Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        });
  }

  _handleTakePhoto() async {
    Get.back();
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile.path != null) {
      _controller.updateImageFile(File(pickedFile.path));
    }
  }

  _handleChooseImageFromGallery() async {
    Get.back();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile.path != null) {
      _controller.updateImageFile(File(pickedFile.path));
    }
  }

  _inputField(
      {@required String label,
      @required String hint,
      @required TextEditingController controller}) {
    return Container(
      width: SizeConfig.screenWidth,
      margin: const EdgeInsets.only(
        bottom: 22,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label ?? "Label",
            style: captionTextStyle,
          ),
          TextFormField(
            minLines: 1,
            maxLines: label == "Bio" ? 4 : 1,
            controller: controller,
            // initialValue: hint,
            // obscureText: isPassField != null ? true : false,
            style: bodyTextStyle.copyWith(fontSize: 16),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: bodyTextStyle.copyWith(fontSize: 16),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 0,
                ),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
