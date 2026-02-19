import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:price_app/presentation/notifier/data_notifier.dart';
import 'package:price_app/presentation/widgets/app_location_picker.dart';
import 'package:price_app/presentation/widgets/app_text_field.dart';
import 'package:price_app/presentation/widgets/custom_tab_container.dart';
import 'package:price_app/presentation/widgets/featured_stores.dart';
import 'package:price_app/presentation/widgets/product_card.dart';
import 'package:price_app/presentation/widgets/stock_alert_card.dart';
import 'package:price_app/presentation/widgets/text_widget.dart';
import 'package:price_app/presentation/widgets/welcome_user.dart';
import 'package:price_app/utils/enum.dart';
import 'package:price_app/utils/extention.dart';
import 'package:price_app/widget/app_button_one.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    final dataNotifier = context.watch<DataNotifier>();
    final products = dataNotifier.filteredResults;
    return Scaffold(
      backgroundColor: context.scaffoldColor,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [WelcomeUser(), AppLocationPicker()],
                  ).padding14h,
                  Gap(20),

                  Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          hintText: 'Search products...',
                          borderColor: context.colors.secondary,
                          canFocus: true,
                          prefixWidget: Icon(
                            Icons.search,
                            color: context.colors.scrim,
                          ),
                          onChanged: (value) {
                            dataNotifier.applySearch(
                              query: value,
                              scope: dataNotifier.activeScope,
                            );
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Gap(10),
                      AppButton(
                        leading: Icon(
                          Icons.filter_alt_outlined,
                          color: context.colors.primary,
                          size: 24,
                        ).padding8h,
                        width: 50,
                        bgColor: context.colors.secondary,
                        onTap: () {},
                      ),
                    ],
                  ).padding14h,
                  Gap(24),
                  TextWidget(
                    text: 'Featured Stores',
                    style: context.textTheme.labelMedium?.copyWith(
                      color: context.colors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                    showViewAll: true,
                  ).padding14h,
                  Gap(12),
                  FeaturedStores().padding14h,
                  Gap(10),
                  CustomTabContainer(
                    onTabSelected: (index) {
                      ProductSearchScope scope;
                      switch (index) {
                        case 1:
                          scope = ProductSearchScope.groceries;
                          break;
                        case 2:
                          scope = ProductSearchScope.tech;
                          break;
                        case 3:
                          scope = ProductSearchScope.house;
                          break;
                        default:
                          scope = ProductSearchScope.all;
                      }
                      dataNotifier.applySearch(
                        query: dataNotifier.query,
                        scope: scope,
                      );
                    },
                  ),
                  Gap(24),
                  Row(
                    children: [
                      TextWidget(
                        text: 'Trending Essentials',
                        style: context.textTheme.labelMedium?.copyWith(
                          color: context.colors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                        showViewAll: false,
                      ).padding14h,
                      Gap(8),
                      Icon(
                        Icons.trending_up,
                        color: context.colors.primary,
                        size: 20,
                      ),
                    ],
                  ).padding14h,
                  Gap(16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 8,
                      children: List.generate(
                        products.length,
                        (i) => ProductCard(product: products[i]),
                      ),
                    ),
                  ).padding14h,
                  Gap(24),
                  const StockAlertCard().padding14h,
                  Gap(24),
                ],
              ),
            ),
          ],
        ).padding10v,
      ),
    );
  }
}
