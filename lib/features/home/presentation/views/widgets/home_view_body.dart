import 'package:booklykian/features/home/presentation/view_models/book_view_model.dart';
import 'package:booklykian/features/home/presentation/views/widgets/best_tile_list_view.dart';
import 'package:booklykian/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:booklykian/features/home/presentation/views/widgets/image_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BookViewModel>().initialFetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BookViewModel>(
      builder: (context, bookViewModel, child) {
        if (bookViewModel.isLoadingBestSellers) {
          return const Center(child: CircularProgressIndicator());
        }

        if (bookViewModel.bestSellers.isEmpty) {
          return const Center(child: Text('No best seller books available.'));
        }

        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomAppBar(),
                    ImageList(books: bookViewModel.bestSellers),
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
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: BestTileListView(books: bookViewModel.bestSellers),
              ),
            ),
          ],
        );
      },
    );
  }
}
