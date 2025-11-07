import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hotelapp/feature/riverpod_test/product.dart';

class RiverHome extends StatelessWidget {
  const RiverHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: Consumer(
        builder: (context, ref, child) {
          final productList = ref.watch(productsProvider);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 350,
                child: ListView.builder(
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(productList[index].name),
                      subtitle: Text(productList[index].price.toString()),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),

      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          return DropdownButton<SortType>(
            value: ref.watch(sortProductProvider.notifier).state,
            items: const [
              DropdownMenuItem(value: SortType.name, child: Icon(Icons.abc)),
              DropdownMenuItem(
                value: SortType.price,
                child: Icon(Icons.price_change),
              ),
            ],
            onChanged: (value) {
              ref.read(sortProductProvider.notifier).state =
                  value ?? SortType.name;
            },
          );
        },
      ),
    );
  }
}

final sortProductProvider = StateProvider((ref) {
  return SortType.name;
});

final productsProvider = Provider<List<Product>>((ref) {
  final List<Product> newProductList = List.from(products);
  final sortType = ref.watch(sortProductProvider);

  if (sortType == SortType.name) {
    newProductList.sort((a, b) => a.name.compareTo(b.name));
  } else {
    newProductList.sort((a, b) => a.price.compareTo(b.price));
  }

  return newProductList;
});
