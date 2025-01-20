import 'package:brother_store/features/gallery/screen/gallery.dart';
import 'package:brother_store/features/shop/screens/home/home.dart';
import 'package:brother_store/features/shop/screens/orders/widgets/order.dart';
import 'package:brother_store/features/shop/screens/store/store.dart';
import 'package:brother_store/features/shop/screens/wishlist/wishlist.dart';
import 'package:brother_store/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const StoreScreen()),
    GetPage(name: TRoutes.gallery, page: () => const TGalleryScreen()),
    GetPage(name: TRoutes.order, page: () => const OrderScreen()),
    GetPage(name: TRoutes.favorites, page: () => const FavoriteScreen()),
  ];
}
