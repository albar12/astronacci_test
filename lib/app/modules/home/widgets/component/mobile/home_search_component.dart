import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/path.dart';

class HomeSearchComponent extends StatefulWidget {
  const HomeSearchComponent({
    super.key,
    required this.size,
    required this.state,
  });

  final Size size;
  final HomeState state;

  @override
  State<HomeSearchComponent> createState() => _HomeSearchComponentState();
}

class _HomeSearchComponentState extends State<HomeSearchComponent> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: widget.size.width,
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.5),
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Menyelaraskan elemen secara vertikal
          children: [
            const Icon(
              Icons.search,
              size:
                  18.0, // Sesuaikan ukuran icon agar proporsional dengan TextFormField
            ),
            const SizedBox(
              width: 8.0,
            ), // Memberikan jarak antara icon dan TextFormField
            Expanded(
              // Membuat TextFormField mengisi ruang yang tersedia
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Search email or nama",
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  var cubit = context.read<HomeCubit>();
                },
                onFieldSubmitted: (value) {
                  var cubit = context.read<HomeCubit>();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
