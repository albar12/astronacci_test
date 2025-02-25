import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/path.dart';

class HomeSearchComponent extends StatefulWidget {
  const HomeSearchComponent({
    super.key,
    required this.size,
    required this.state,
    required this.firstReload,
  });

  final Size size;
  final HomeState state;
  final bool firstReload;

  @override
  State<HomeSearchComponent> createState() => _HomeSearchComponentState();
}

class _HomeSearchComponentState extends State<HomeSearchComponent> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container();
    //  Container(
    //   height: 40,
    //   width: widget.size.width,
    //   decoration: BoxDecoration(
    //     border: Border.all(
    //       width: 1.0,
    //       color: Colors.grey.shade300,
    //     ),
    //     borderRadius: BorderRadius.circular(15.0),
    //   ),
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
    //     child: Row(
    //       crossAxisAlignment: CrossAxisAlignment.center, // Menyelaraskan elemen secara vertikal
    //       children: [
    //         const Icon(
    //           Icons.search,
    //           size: 18.0, // Sesuaikan ukuran icon agar proporsional dengan TextFormField
    //         ),
    //         const SizedBox(width: 8.0), // Memberikan jarak antara icon dan TextFormField
    //         Expanded(
    //           // Membuat TextFormField mengisi ruang yang tersedia
    //           child: TextFormField(
    //             autofocus: true,
    //             controller: searchController,
    //             decoration: InputDecoration(
    //               hintText: "Search...",
    //               border: InputBorder.none,
    //               suffixIcon: widget.state.data.searchIsStart
    //                   ? IconButton(
    //                       onPressed: () {
    //                         var cubit = context.read<HomeCubit>();
    //                         cubit.searchIsStart(false);
    //                         cubit.searchIsOn(false);
    //                         context.read<HomeCubit>().changeIndexTab(0);
    //                         context.read<HomeCubit>().getFreeBookList();
    //                         context.read<HomeCubit>().getName();
    //                         context.read<HomeCubit>().getBookLastRead();
    //                       },
    //                       icon: const Icon(
    //                         Icons.cancel,
    //                         size: 18,
    //                       ),
    //                     )
    //                   : null,
    //             ),
    //             onChanged: (value) {
    //               var cubit = context.read<HomeCubit>();
    //               if (value.isEmpty) {
    //                 cubit.searchIsStart(false);
    //               } else {
    //                 cubit.searchIsStart(true);
    //               }

    //               if (value.isNotEmpty) {
    //                 if (!widget.state.data.hasBeenDisconnected) {
    //                   BookRequestDto bookRequestDto = BookRequestDto(
    //                     search: value,
    //                   );
    //                   cubit.searchBookLibraryList(bookRequestDto);
    //                 } else {
    //                   //jika offline
    //                   BookRequestDto bookRequestDto = BookRequestDto(
    //                     search: value,
    //                   );
    //                   cubit.searchBookListLocal(bookRequestDto);
    //                 }
    //               } else {
    //                 context.read<HomeCubit>().changeIndexTab(0);
    //               }
    //             },
    //             onFieldSubmitted: (value) {
    //               var cubit = context.read<HomeCubit>();
    //               if (value.isEmpty) {
    //                 cubit.searchIsStart(false);
    //                 cubit.searchIsOn(false);
    //               } else {
    //                 cubit.searchIsStart(true);
    //               }

    //               if (value.isNotEmpty) {
    //                 if (!widget.state.data.hasBeenDisconnected) {
    //                   BookRequestDto bookRequestDto = BookRequestDto(
    //                     search: value,
    //                   );
    //                   cubit.searchBookLibraryList(bookRequestDto);
    //                 } else {
    //                   //jika offline
    //                   BookRequestDto bookRequestDto = BookRequestDto(
    //                     search: value,
    //                   );
    //                   cubit.searchBookListLocal(bookRequestDto);
    //                 }
    //               } else {
    //                 context.read<HomeCubit>().changeIndexTab(0);
    //               }
    //             },
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
