import 'package:booklykian/features/home/presentation/views/widgets/best_tile.dart';
import 'package:flutter/material.dart';

class BestTileListView extends StatelessWidget {
  const BestTileListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const BestTile();
      },
    );
  }
}
