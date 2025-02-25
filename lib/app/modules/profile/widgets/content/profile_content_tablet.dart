import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/path.dart';

class ProfileContentTablet extends StatelessWidget {
  const ProfileContentTablet({
    super.key,
    required this.size,
    required this.profileState,
    required this.version,
  });
  final Size size;
  final ProfileState profileState;
  final String version;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: ProfileHeaderComponentDesktop(
                  size: size,
                  profileState: profileState,
                ),
              ),
              _content(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _content(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height * 0.05,
        ),
        Text(
          "Akun",
          style: FontFamilyConstant.primaryFont.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        ProfileBodyComponentDesktop(
          size: size,
          leadingIcon: "assets/icons/svg/ic_akun.svg",
          title: "Akun",
          suffixIcon: Icon(
            Icons.arrow_forward_ios,
            size: size.width * 0.03,
          ),
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => ChangeProfileScreen(
                  profileModel: profileState.data.profileModel,
                ),
              ),
              (route) => true,
            );
          },
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        ProfileBodyComponentDesktop(
          size: size,
          leadingIcon: "assets/icons/svg/ic_pass_change.svg",
          title: "Ubah Kata Sandi",
          suffixIcon: Icon(
            Icons.arrow_forward_ios,
            size: size.width * 0.03,
          ),
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const ChangePasswordScreen(),
              ),
              (route) => true,
            );
          },
        ),
        SizedBox(
          height: size.height * 0.04,
        ),
        Text(
          "Pusat Bantuan",
          style: FontFamilyConstant.primaryFont.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        ProfileBodyComponentDesktop(
          size: size,
          leadingIcon: "assets/icons/svg/ic_terms_conditions.svg",
          title: "Syarat dan Ketentuan",
          suffixIcon: Icon(
            Icons.arrow_forward_ios,
            size: size.width * 0.03,
          ),
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const WebviewScreen(
                  title: "Syarat dan Ketentuan",
                  link: AppConfig.appName,
                ),
              ),
              (route) => true,
            );
          },
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        ProfileBodyComponentDesktop(
          size: size,
          leadingIcon: "assets/icons/svg/ic_protection.svg",
          title: "Kebijakan Privasi",
          suffixIcon: Icon(
            Icons.arrow_forward_ios,
            size: size.width * 0.03,
          ),
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const WebviewScreen(
                  title: "Kebijakan Privasi",
                  link: AppConfig.appName,
                ),
              ),
              (route) => true,
            );
          },
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        ProfileBodyComponentDesktop(
          size: size,
          leadingIcon: "assets/icons/svg/ic_faq.svg",
          title: "FAQ",
          suffixIcon: Icon(
            Icons.arrow_forward_ios,
            size: size.width * 0.03,
          ),
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const WebviewScreen(
                  title: "FAQ",
                  link: AppConfig.appName,
                ),
              ),
              (route) => true,
            );
          },
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        ProfileBodyComponentDesktop(
          size: size,
          leadingIcon: "assets/icons/svg/ic_customer_service.svg",
          title: "Layanan Pelanggan",
          suffixIcon: Icon(
            Icons.arrow_forward_ios,
            size: size.width * 0.03,
          ),
          onTap: () {
            LauncherUrl.openAndLaunchUrl(
              "https://api.whatsapp.com/send?phone=${AppConfig.appName}",
            );
          },
        ),
        SizedBox(
          height: size.height * 0.06,
        ),
        SizedBox(
          width: size.width,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConstant.redColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              _backDialog(context);
            },
            child: Text(
              "Keluar",
              style: FontFamilyConstant.primaryFont.copyWith(
                color: ColorConstant.whiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<dynamic> _backDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
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
                    context.read<ProfileCubit>().logout();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstant.blueColor, // Warna latar belakang tombol
                  ),
                  child: Text(
                    'Iya',
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

  Future<dynamic> _bindingDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hubungan Akun dengan Google?'),
        content: const Text('Apakah Anda akan menghubungkan akun dengan google?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Kembali tanpa konfirmasi
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              // context.read<ProfileBloc>().add(
              //       ProfileBindingGoogleEvent(),
              //     ); // Konfirmasi untuk kembali
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _unBindingDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus hubungan Akun dengan Google?'),
        content: const Text('Apakah Anda akan menghapus hubungan akun dengan google?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Kembali tanpa konfirmasi
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              // context.read<ProfileBloc>().add(
              //       ProfileUnbindingGoogleEvent(),
              //     ); // Konfirmasi untuk kembali
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}
