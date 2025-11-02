import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class RiverHome extends ConsumerWidget {
  const RiverHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(naProvider);

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Hello $name',
              style: const TextStyle(color: Colors.blue, fontSize: 30),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final List<String> randNames = List.from(randomNames);
          randNames.shuffle();
          ref.watch(naProvider.notifier).state=randNames.first;
        },
        child: const Icon(Icons.switch_camera_rounded),
      ),
    );
  }
}

final nameProvider = Provider<String>((ref) {
  final age = ref.watch(ageProvider);

  return 'adel,$age';
});
final ageProvider = Provider<int>((ref) {
  return 10; 
});

List<String> randomNames = [
  'alice',
  'pop',
  'diana',
  'charlie',
  'ethan',
  'fiona',
];

final naProvider = StateProvider<String>((ref) {
  return "adool";
});
