import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:marketplace/config/router/routes.dart';
import 'package:marketplace/config/theme/app_colors.dart';
import 'package:marketplace/config/theme/app_typography.dart';

class NavLink {
  final String icon;
  final String label;
  final String route;

  const NavLink({required this.icon, required this.label, required this.route});
}

List<NavLink> navLinks = [
  const NavLink(
    icon: 'assets/icons/Home.svg',
    label: 'Home',
    route: Routes.home,
  ),
  const NavLink(
    icon: 'assets/icons/Search.svg',
    label: 'Search',
    route: Routes.search,
  ),
  const NavLink(
    icon: 'assets/icons/Heart.svg',
    label: 'Saved',
    route: Routes.saved,
  ),
  const NavLink(
    icon: 'assets/icons/Cart.svg',
    label: 'Cart',
    route: Routes.cart,
  ),
  const NavLink(
    icon: 'assets/icons/User.svg',
    label: 'Account',
    route: Routes.account,
  ),
];

class NavButton extends StatelessWidget {
  final String icon;
  final String label;

  const NavButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: SvgPicture.asset(
        icon,
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(AppColors.primary[400]!, BlendMode.srcIn),
      ),
      selectedIcon: SvgPicture.asset(
        icon,
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(AppColors.primary[900]!, BlendMode.srcIn),
      ),
      label: label,
    );
  }
}

class AppNavbar extends StatefulWidget {
  const AppNavbar({super.key});

  @override
  State<AppNavbar> createState() => _AppNavbarState();
}

class _AppNavbarState extends State<AppNavbar> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.primary[400]!)),
      ),
      padding: EdgeInsets.only(top: 10, bottom: 0, left: 12, right: 12),
      child: NavigationBar(
        labelPadding: EdgeInsets.all(0),
        height: 52,
        selectedIndex: _currentPageIndex,
        indicatorColor: Colors.transparent,
        onDestinationSelected: (index) {
          setState(() {
            _currentPageIndex = index;
          });

          final link = navLinks[index];

          context.push(link.route);
        },
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppTypography.body3Semibold;
          }

          return AppTypography.body3Medium.copyWith(
            color: AppColors.primary[400]!,
          );
        }),
        destinations: navLinks
            .map(
              (navLink) => NavButton(icon: navLink.icon, label: navLink.label),
            )
            .toList(),
      ),
    );
  }
}
