import 'dart:ui';

import 'package:go_router/go_router.dart';
import 'package:ventas_pinar/ventas_pinar/ui/pages/add_product.dart';
import 'package:ventas_pinar/ventas_pinar/ui/pages/home_page.dart';

final route = GoRouter(initialLocation: '/homePage/0', routes: [
  GoRoute(
      path: '/homePage/:page',
      builder: (context, state) {
        final pageIndex = state.pathParameters['page'] ?? '0';

        return HomePage(
          index: int.parse(pageIndex),
        );
      }),
  GoRoute(
    path: '/AddProduct',
    builder: (context, state) {
      if (state.pathParameters != '') {
        return AddProduct(
          productData: state.extra,
        );
      } else {
        return AddProduct();
      }
    },
  ),
]);
