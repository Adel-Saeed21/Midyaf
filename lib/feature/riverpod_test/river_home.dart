import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotelapp/feature/riverpod_test/model/joke_model.dart';
import 'package:hotelapp/feature/riverpod_test/networking/joke_api_service.dart';

class RiverHome extends ConsumerWidget {
  const RiverHome({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(jokeFutureProvider);

    return Scaffold(
      floatingActionButton: IconButton(
        onPressed: () {
          ref.refresh(jokeFutureProvider);
        },
        icon: Icon(Icons.refresh),
      ),
      body: value.when(
        data: (data) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Center(child: Text(data.punchline))],
          );
        },
        error: (err, stackTrace) {
          return Center(child: Text(err.toString()));
        },
        loading: () {
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

final jokeApiProvider = Provider<JokeApiService>((ref) {
  return JokeApiService();
});

final jokeFutureProvider = FutureProvider<JokeModel>((ref) {
  final service = ref.read(jokeApiProvider);
  return service.getJoke();
});
