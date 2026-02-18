import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:price_app/data/models/featured_store_model.dart';
import 'package:price_app/presentation/notifier/ui_provider.dart';
import 'package:price_app/presentation/widgets/image_loader.dart';
import 'package:price_app/utils/extention.dart';
import 'package:provider/provider.dart';

class FeaturedStores extends StatefulWidget {
  const FeaturedStores({super.key});

  @override
  State<FeaturedStores> createState() => _FeaturedStoresState();
}

class _FeaturedStoresState extends State<FeaturedStores> {
  late UiNotifier uiNotifier;

  final List<FeaturedStoreModel> featuredStores = [
    FeaturedStoreModel(name: 'Melcom', image: 'assets/jpeg/melcom.jpeg'),
    FeaturedStoreModel(name: 'Compu Ghana', image: 'assets/jpeg/compu_gh.jpeg'),
    FeaturedStoreModel(
      name: 'Telephonica',
      image: 'assets/png/telephonica.png',
    ),
    FeaturedStoreModel(name: 'Celio', image: 'assets/png/celio.png'),
    FeaturedStoreModel(name: 'Panda Mart', image: 'assets/png/pandamart.png'),
  ];

  Widget buildStoreItem(FeaturedStoreModel store) {
    return SizedBox(
      height: 110,
      width: 80,
      child: Material(
        color: context.scaffoldColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ImageLoader(isAsset: true, imageUrl: store.image, height: 70),
              const Gap(4),
              Text(
                store.name,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colors.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    uiNotifier = context.watch<UiNotifier>();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: context.scaffoldColor,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 12,
          children: featuredStores.map(buildStoreItem).toList(),
        ).padding4h,
      ),
    );
  }
}
