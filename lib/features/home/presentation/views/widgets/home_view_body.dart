import 'package:booklykian/features/home/presentation/views/widgets/best_tile_list_view.dart';
import 'package:booklykian/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:booklykian/features/home/presentation/views/widgets/image_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(),
                const ImageList(),
                const SizedBox(height: 50),
                Text(
                  'Best Seller',
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: BestTileListView(),
          ),
        ),
      ],
    );
  }
}
