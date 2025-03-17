import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zagel/core/constants/app_images.dart';
import 'package:zagel/core/functions/routing.dart';
import 'package:zagel/core/services/cach_keys.dart';
import 'package:zagel/core/services/locale_storage.dart';
import 'package:zagel/core/utils/colors.dart';
import 'package:zagel/core/utils/text_style.dart';
import 'package:zagel/core/widgets/custom_button.dart';
import 'package:zagel/core/widgets/custom_snackbar.dart';
import 'package:zagel/features/wrapper_widget.dart';

String imagePath = "";
String userName = "";

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "zagel",
          style: getTitleStyle(context,
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              // check userImage & userName
              //1- is done
              //2- no userImage
              //3- no userName
              //4-no userImage & no userName
              if (userName.isNotEmpty) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Please Confirm'),
                        content:
                            const Text('Are you sure you want to continue?'),
                        actions: [
                          // The "Yes" button
                          TextButton(
                              onPressed: () {
                                // cache data and navigate ..
                                AppLocaleStorage.setCachData(
                                    CachKeys.name, userName);
                                AppLocaleStorage.setCachData(
                                    CachKeys.image, imagePath);
                                AppLocaleStorage.setCachData(
                                    CachKeys.isUpload, true);
                                AppRouting.navigateWithReplacement(
                                    const WrapperWidget(), context);
                              },
                              child: const Text('Yes')),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('No'))
                        ],
                      );
                    });
              } else if (imagePath.isNotEmpty && userName.isNotEmpty) {
                customSnackBar(context, "please, Enter your image");
              } else if (userName.isEmpty) {
                customSnackBar(context, "please, Enter your name");
              } else {
                customSnackBar(context, "please, Enter your name & image");
              }
            },
            child: Text(
              "Done",
              style: getBodyStyle(context, color: AppColors.primary),
            ),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 90,
                  backgroundColor: AppColors.primary,
                  backgroundImage: (imagePath.isNotEmpty)
                      ? FileImage(File(imagePath)) as ImageProvider
                      : const AssetImage(
                          AppImages.user,
                        ),
                ),
                const Gap(20),
                CustomButtonWidget(
                  style: getBodyStyle(context,
                      color: AppColors.black, fontWeight: FontWeight.bold),
                  text: "upload from camera",
                  onPressed: () {
                    uploadImage(isCamera: true);
                  },
                ),
                const Gap(20),
                CustomButtonWidget(
                    style: getBodyStyle(context,
                        color: AppColors.black, fontWeight: FontWeight.bold),
                    text: "upload from Gallery",
                    onPressed: () {
                      uploadImage(isCamera: false);
                    }),
                const Gap(20),
                const Divider(),
                const Gap(20),
                TextFormField(
                  style: getBodyStyle(context),
                  decoration: const InputDecoration(
                      hintText: "Enter Your Name ",
                      hintStyle: TextStyle(color: AppColors.white)),
                  onChanged: (value) {
                    setState(() {
                      userName = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  uploadImage({required bool isCamera}) async {
    final pickedImage = await ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        imagePath = pickedImage.path;
      });
    }
  }
}
