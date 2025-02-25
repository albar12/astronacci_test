import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/path.dart';

class ChangeProfileContentTablet extends StatefulWidget {
  const ChangeProfileContentTablet({
    super.key,
    required this.size,
    required this.profileModel,
    required this.state,
  });
  final Size size;
  final ProfileModel? profileModel;
  final ChangeProfileState state;

  @override
  State<ChangeProfileContentTablet> createState() => _ChangeProfileContentTabletState();
}

class _ChangeProfileContentTabletState extends State<ChangeProfileContentTablet> {
  TextEditingController emailController = TextEditingController();
  TextEditingController namaLengkapController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController targetInstitutionController = TextEditingController();
  TextEditingController targetOccupationController = TextEditingController();
  TextEditingController tglLahirController = TextEditingController();

  String? universityValue;
  UniversityModel? universityInitialValue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              HeaderComponent(
                size: widget.size,
                profileModel: widget.profileModel,
              ),
              TextfieldComponent(
                readOnly: widget.profileModel?.email != null && widget.profileModel?.email != '' ? true : false,
                label: "Alamat Email",
                controller: emailController,
                suffixIcon: Icon(
                  Icons.lock_outline,
                  color: ColorConstant.greyColor1,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: Text(
                    "*Hubungi CS untuk mengubah email",
                    style: FontFamilyConstant.primaryFont.copyWith(
                      fontWeight: FontWeight.w900,
                      color: ColorConstant.primaryColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextfieldComponent(
                readOnly: widget.profileModel?.phone == null || widget.profileModel?.phone == '' ? false : true,
                label: "No. WhatsApp",
                hintText: "Masukkan No. Whatsapp",
                controller: phoneController,
                suffixIcon: Icon(
                  Icons.lock_outline,
                  color: ColorConstant.greyColor1,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: Text(
                    widget.profileModel?.phone == null || widget.profileModel?.phone == '' ? "" : "*Hubungi CS untuk mengubah nomor whatsapp",
                    style: FontFamilyConstant.primaryFont.copyWith(
                      fontWeight: FontWeight.w900,
                      color: ColorConstant.primaryColor,
                      fontSize: widget.profileModel?.phone == null || widget.profileModel?.phone == '' ? 0 : 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextfieldComponent(
                label: "Nama Lengkap",
                isMandatory: true,
                controller: namaLengkapController,
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: SvgPicture.asset(
                    "assets/icons/svg/ic_textfield_edit.svg",
                    height: 25,
                    width: 25,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: widget.size.width,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstant.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (namaLengkapController.text.isEmpty || emailController.text.isEmpty) {
                      snackbarError(
                        title: 'Perhatian',
                        message: 'Mohon isi semua data wajib',
                        context: context,
                      );
                    } else if (namaLengkapController.text.length > 50) {
                      snackbarError(
                        title: 'Perhatian',
                        message: 'Nama tidak boleh melebihi dari 50 huruf',
                        context: context,
                      );
                    } else {
                      ChangeProfileRequestDto requestDto = ChangeProfileRequestDto(
                        email: widget.profileModel?.email != null && widget.profileModel!.email != '' ? emailController.text : '',
                        name: namaLengkapController.text,
                        phone: phoneController.text,
                        target_institution: targetInstitutionController.text,
                        target_occupation: targetOccupationController.text,
                        institution: universityValue ?? '',
                      );

                      _backDialog(context, requestDto);
                    }
                  },
                  child: Text(
                    "Simpan Perubahan",
                    style: FontFamilyConstant.primaryFont.copyWith(
                      color: ColorConstant.whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _backDialog(
    BuildContext context,
    ChangeProfileRequestDto requestDto,
  ) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Icon(
          Icons.warning,
          color: ColorConstant.yellowColor,
          size: 50,
        ),
        content: Text(
          'Apa Anda yakin akan update data?',
          textAlign: TextAlign.center,
          style: FontFamilyConstant.primaryFont.copyWith(),
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
                    backgroundColor: ColorConstant.redColor, // Warna latar belakang tombol
                  ),
                  child: Text(
                    'Batal',
                    style: TextStyle(
                      color: ColorConstant.whiteColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);

                    context.read<ChangeProfileCubit>().changeProfile(requestDto);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstant.blueColor, // Warna latar belakang tombol
                  ),
                  child: Text(
                    'Update',
                    style: TextStyle(
                      color: ColorConstant.whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    setState(() {
      emailController.text = widget.profileModel?.email ?? "";
      namaLengkapController.text = widget.profileModel?.name ?? "";
      phoneController.text = widget.profileModel?.phone ?? "";
      targetOccupationController.text = widget.profileModel?.target_occupation ?? "";
      targetInstitutionController.text = widget.profileModel?.target_institution ?? "";
      universityInitialValue = widget.state.data.dataUniversity?.firstOrNull((e) => e.name == widget.profileModel?.institution);
      universityValue = widget.profileModel?.institution != null && widget.profileModel?.institution != 'null' ? widget.profileModel?.institution : null;
    });
    super.initState();
  }
}
