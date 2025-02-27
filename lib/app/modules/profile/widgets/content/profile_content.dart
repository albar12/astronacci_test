import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/path.dart';

class ProfileContent extends StatefulWidget {
  const ProfileContent({
    super.key,
    required this.size,
    required this.profileState,
    required this.namaController,
    required this.emailController,
    required this.phoneController,
  });
  final Size size;
  final ProfileState profileState;
  final TextEditingController namaController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _headerInputField("Nama Lengkap", isMandatory: true),
            const SizedBox(height: 8),
            CustomTextFormField(
              controller: widget.namaController,
              hint: "Masukkan Nama",
              cursorColor: ColorConstant.greyColor15,
              keyboardType: TextInputType.text,
              hintStyle: FontFamilyConstant.primaryFont.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            _headerInputField("Email"),
            const SizedBox(height: 8),
            CustomTextFormField(
              isReadOnly: true,
              controller: widget.emailController,
              hint: "Masukkan Email",
              cursorColor: ColorConstant.blueColor,
              keyboardType: TextInputType.emailAddress,
              hintStyle: FontFamilyConstant.primaryFont.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            _headerInputField("No. WhatsApp", isMandatory: true),
            const SizedBox(height: 8),
            CustomTextFormField(
              controller: widget.phoneController,
              hint: "Masukkan No. WhatsApp",
              cursorColor: ColorConstant.blueColor,
              keyboardType: TextInputType.phone,
              hintStyle: FontFamilyConstant.primaryFont.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstant.redColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async {
                        _backDialog(context, context.read<ProfileCubit>());
                      },
                      child: Text(
                        "Logout",
                        style: FontFamilyConstant.primaryFont.copyWith(
                          color: ColorConstant.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstant.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async {
                        if (widget.namaController.text.isEmpty ||
                            widget.phoneController.text.isEmpty) {
                          snackbarError(
                            title: 'Perhatian',
                            message: 'Mohon isi semua data wajib',
                            context: context,
                          );
                        } else {
                          _updateDialog(context, context.read<ProfileCubit>());
                        }
                      },
                      child: Text(
                        "Update",
                        style: FontFamilyConstant.primaryFont.copyWith(
                          color: ColorConstant.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.namaController.text = widget.profileState.data.user?.nama ?? '';
    widget.emailController.text = widget.profileState.data.user?.email ?? '';
    widget.phoneController.text =
        widget.profileState.data.user?.noWhatsapp ?? '';
  }

  Widget _headerInputField(String label, {bool isMandatory = false}) {
    return Row(
      children: [
        Text(
          label,
          style: FontFamilyConstant.primaryFont.copyWith(
            color: ColorConstant.blackColor3,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        if (isMandatory)
          Text(
            "*",
            style: FontFamilyConstant.primaryFont.copyWith(
              color: ColorConstant.redColor,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
      ],
    );
  }

  Future<dynamic> _updateDialog(
    BuildContext context,
    ProfileCubit cubit,
  ) async {
    return showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Icon(
              Icons.warning,
              color: ColorConstant.yellowColor,
              size: 50,
            ),
            content: const Text(
              'Apa Anda yakin ingin update profile?',
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            ColorConstant
                                .redColor, // Warna latar belakang tombol
                      ),
                      child: Text(
                        'Batal',
                        style: TextStyle(color: ColorConstant.whiteColor),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        ChangeProfileRequestDto requestDto =
                            ChangeProfileRequestDto(
                              email: widget.emailController.text,
                              nama: widget.namaController.text,
                              phone: widget.phoneController.text,
                            );
                        cubit.updateProfile(requestDto);
                        Navigator.of(context).pop(false);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            ColorConstant
                                .blueColor, // Warna latar belakang tombol
                      ),
                      child: Text(
                        'Iya',
                        style: TextStyle(color: ColorConstant.whiteColor),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
    );
  }

  Future<dynamic> _backDialog(BuildContext context, ProfileCubit cubit) async {
    return showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Icon(
              Icons.warning,
              color: ColorConstant.yellowColor,
              size: 50,
            ),
            content: const Text(
              'Apa Anda yakin ingin logout?',
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            ColorConstant
                                .redColor, // Warna latar belakang tombol
                      ),
                      child: Text(
                        'Batal',
                        style: TextStyle(color: ColorConstant.whiteColor),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        cubit.logout();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            ColorConstant
                                .blueColor, // Warna latar belakang tombol
                      ),
                      child: Text(
                        'Iya',
                        style: TextStyle(color: ColorConstant.whiteColor),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
    );
  }
}
