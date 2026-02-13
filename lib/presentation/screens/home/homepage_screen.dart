import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:price_app/presentation/widgets/app_text_field.dart';
import 'package:price_app/presentation/widgets/category_filter.dart';
import 'package:price_app/presentation/widgets/featured_store_card.dart';
import 'package:price_app/presentation/widgets/product_card.dart';
import 'package:price_app/presentation/widgets/stock_alert_card.dart';
import 'package:price_app/utils/app_colors.dart';
import 'package:price_app/utils/app_icons.dart';
import 'package:price_app/utils/extention.dart';
import 'package:price_app/widget/app_button_one.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'WELCOME BACK',
                          style: context.textTheme.labelSmall?.copyWith(
                            color: context.colors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Kofi Mensah',
                          style: context.textTheme.headlineMedium?.copyWith(
                            color: context.colors.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: context.colors.surfaceContainer,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.locationPin,
                            height: 16,
                            colorFilter: const ColorFilter.mode(
                              AppColors.primary,
                              BlendMode.srcIn,
                            ),
                          ),
                          Gap(4),
                          Text(
                            'Accra, GH',
                            style: context.textTheme.labelMedium?.copyWith(
                              color: context.colors.onSurface,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Icon(Icons.keyboard_arrow_down, size: 16),
                        ],
                      ),
                    ),
                  ],
                ).padding14h,
                Gap(20),

                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        hintText: 'Search products...',
                        canFocus: true,
                        prefixWidget: Icon(
                          Icons.search,
                          color: context.colors.primary,
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    const Gap(10),
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'FEATURED STORES',
                      style: context.textTheme.titleMedium?.copyWith(
                        color: context.colors.onSurfaceVariant,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'View All',
                      style: context.textTheme.labelMedium?.copyWith(
                        color: context.colors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 80,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      FeaturedStoreCard(
                        name: 'Melcom',
                        imagePath: 'assets/jpeg/melcom.jpeg',
                      ), // Placeholder
                      FeaturedStoreCard(
                        name: 'CompuGhana',
                        imagePath: 'assets/jpeg/compughana.jpeg',
                      ),
                      FeaturedStoreCard(
                        name: 'Makola Mkt',
                        imagePath: 'assets/jpeg/makola.jpeg',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Categories
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CategoryFilter(
                        label: 'All Items',
                        isSelected: true,
                        onTap: () {},
                      ),
                      CategoryFilter(
                        label: 'Groceries',
                        isSelected: false,
                        onTap: () {},
                      ),
                      CategoryFilter(
                        label: 'Phones',
                        isSelected: false,
                        onTap: () {},
                      ),
                      CategoryFilter(
                        label: 'Household',
                        isSelected: false,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Trending Essentials
                Row(
                  children: [
                    Text(
                      'Trending Essentials',
                      style: context.textTheme.headlineSmall?.copyWith(
                        color: context.colors.onSurface,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.trending_up,
                      color: AppColors.primary,
                      size: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                const Row(
                  children: [
                    Expanded(
                      child: ProductCard(
                        name: 'Royal Feast Perfumed Rice (5kg)',
                        imagePath: 'assets/jpeg/rice.jpeg',
                        category: 'GROCERIES',
                        rating: 4.8,
                        lowestPriceStore: 'Makola',
                        price: '95.00',
                        originalPrice: '',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ProductCard(
                        name: 'Samsung Galaxy A14 64GB',
                        imagePath: 'assets/jpeg/samsung.jpeg',
                        category: 'TECH',
                        rating: 4.5,
                        lowestPriceStore: 'CompuGhana',
                        price: '1,800',
                        originalPrice: '',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Second Row of Products
                const Row(
                  children: [
                    Expanded(
                      child: ProductCard(
                        name: 'Frytol Cooking Oil (1 Liter)',
                        imagePath: 'assets/jpeg/oil.jpeg',
                        category: 'PANTRY',
                        rating: 4.9,
                        lowestPriceStore: 'Melcom',
                        price: '25.00',
                        originalPrice: '',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ProductCard(
                        name: 'iPhone 13 Pro (Refurbished)',
                        imagePath: 'assets/jpeg/iphone.jpeg',
                        category: 'APPLE',
                        rating: 5.0,
                        lowestPriceStore: 'Franko',
                        price: '6,500',
                        originalPrice: '',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Stock Alert
                const StockAlertCard(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
