import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:marketplace/config/theme/app_colors.dart';
import 'package:marketplace/config/theme/app_typography.dart';

import 'package:marketplace/features/presentation/widgets/app_layout/app_layout.dart';

class NotificationObj {
  final String name;
  final String description;
  final String icon;
  final String createdAt;
  final bool t;

  const NotificationObj({
    required this.name,
    required this.description,
    required this.icon,
    required this.createdAt,
    required this.t,
  });
}

List<NotificationObj> notifications = [
  const NotificationObj(
    t: true,
    name: '30% Special Discount!',
    icon: 'assets/icons/Discount-duotone.svg',
    description: 'Special promotion only valid today.',
    createdAt: 'Today',
  ),

  const NotificationObj(
    t: true,
    name: 'Top Up E-wallet Successfully!',
    icon: 'assets/icons/Wallet-duotone.svg',
    description: 'You have top up your e-wallet.',
    createdAt: 'Yesterday',
  ),

  const NotificationObj(
    t: false,
    name: 'New Service Available!',
    icon: 'assets/icons/Location-duotone.svg',
    description: 'Now you can track order in real-time.',
    createdAt: 'Yesterday',
  ),

  const NotificationObj(
    t: true,
    name: 'Credit Card Connected!',
    icon: 'assets/icons/Card-duotone.svg',
    description: 'Credit card has been linked.',
    createdAt: 'June 7, 2023',
  ),

  const NotificationObj(
    t: false,
    name: 'Account Setup Successfully!',
    icon: 'assets/icons/User-duotone.svg',
    description: 'Your account has been created.',
    createdAt: 'June 7, 2023',
  ),
];

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Builder(
            builder: (context) {
              final width = MediaQuery.of(context).size.width;

              return Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: width - (24 * 2),
                  height: 1,
                  color: AppColors.primary[100]!,
                  margin: const EdgeInsets.only(left: 24),
                ),
              );
            },
          ),
        ),
      ),
      body: AppLayout(
        child:
            // const Empty(
            // icon: 'assets/icons/Bell-duotone.svg',
            // title: 'You haven’t gotten any notifications yet!',
            // subTitle: 'We’ll alert you when something cool happens.')
            ListView.separated(
              itemBuilder: (context, index) {
                final notification = notifications[index];

                final element = ListTile(
                  minTileHeight: 40,
                  contentPadding: EdgeInsets.all(0),
                  leading: SvgPicture.asset(
                    notification.icon,
                    width: 24,
                    height: 24,
                  ),
                  title: Text(
                    notification.name,
                    style: AppTypography.body2Semibold,
                  ),
                  subtitle: Text(
                    notification.description,
                    style: AppTypography.body3Regular,
                  ),
                );

                if (notification.t) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        notification.createdAt,
                        style: AppTypography.body1Semibold,
                      ),
                      const SizedBox(height: 16),
                      element,
                    ],
                  );
                }

                return element;
              },
              separatorBuilder: (_, _) => Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Divider(height: 1, color: AppColors.primary[100]!),
              ),
              itemCount: notifications.length,
            ),
      ),
    );
  }
}
