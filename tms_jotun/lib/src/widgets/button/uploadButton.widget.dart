import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tms_jotun/src/utils/appLocalizations.utils.dart';
import 'package:tms_jotun/src/utils/colorManager.utils.dart';
import 'package:tms_jotun/src/widgets/emptyWidget.dart';

class Uploadbutton extends StatefulWidget {
  final bool allowCamera;
  final bool allowGallery;
  final bool allowFile;

  const Uploadbutton({
    super.key,
    this.allowCamera = true,
    this.allowGallery = true,
    this.allowFile = true,
  });

  @override
  _UploadbuttonState createState() => _UploadbuttonState();
}

class _UploadbuttonState extends State<Uploadbutton> {
  List<File> _imageFiles = [];

  // Fungsi untuk memilih gambar dari galeri
  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFiles.add(File(pickedFile.path));
      });
    }
  }

  // Fungsi untuk mengambil gambar dari kamera
  Future<void> pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _imageFiles.add(File(pickedFile.path));
      });
    }
  }

  // Fungsi untuk memilih file
  Future<void> pickFile() async {
    // Tambahkan implementasi untuk memilih file (misalnya menggunakan file picker package)
  }

  void showImageSourceOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(16),
          child: Wrap(
            children: [
              Text(
                AppLocalizations.of(context)!.translate('TAKE_PICTURE_FROM'),
                style: TextStyle(
                  fontFamily: 'Lato',
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              if (widget.allowGallery)
                ListTile(
                  title: Text('Galeri'),
                  onTap: () {
                    Navigator.pop(context);
                    pickImageFromGallery();
                  },
                ),
              if (widget.allowCamera)
                ListTile(
                  title: Text('Kamera'),
                  onTap: () {
                    Navigator.pop(context);
                    pickImageFromCamera();
                  },
                ),
              if (widget.allowFile)
                ListTile(
                  title: Text('File'),
                  onTap: () {
                    Navigator.pop(context);
                    pickFile();
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showImageSourceOptions(context);
          },
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(12),
            color: Colors.black26,
            child: Container(
              width: double.infinity,
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    'Upload POD',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.camera_alt,
                    size: 20,
                    color: ColorManager.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
        _imageFiles.isNotEmpty
            ? DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(12),
                color: Colors.black26,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.start,
                    children: _imageFiles.map((imageFile) {
                      int index = _imageFiles.indexOf(imageFile);
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              imageFile,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _imageFiles.removeAt(index);
                                });
                              },
                              child: Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              )
            : EmptyWidget(),
      ],
    );
  }
}
