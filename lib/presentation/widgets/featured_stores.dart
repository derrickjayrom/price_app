import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
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

  void openPage(String storeOption) {
    final lowerCaseStoreOption = storeOption.toLowerCase();
    switch (lowerCaseStoreOption) {
      case 'melcom':
        context.pushNamed('melcomPage', pathParameters: {'id': 'melcom_page'});
        uiNotifier.shouldShowProgressWidget = false;
        break;
      case 'compu gh':
        context.pushNamed(
          'compuGhPage',
          pathParameters: {'id': 'compu_gh_page'},
        );
        uiNotifier.shouldShowProgressWidget = false;
        break;
      case 'telephonica':
        context.pushNamed(
          'telephonicaPage',
          pathParameters: {'id': 'telephonica_page'},
        );
        uiNotifier.shouldShowProgressWidget = false;
        break;
    }
  }

  Widget buildStoreItem(FeaturedStoreModel store) {
    return SizedBox(
      height: 110,
      width: 80,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () => openPage(store.name),
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
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: context.colors.tertiary,
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
