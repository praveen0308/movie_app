import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/entity/home_listing_item.dart';
import 'package:movie_app/presentation/screens/home/home_screen_cubit.dart';
import 'package:movie_app/presentation/widgets/home_section.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    context.read<HomeScreenCubit>().loadHomeListing();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body
            : BlocConsumer<HomeScreenCubit, HomeScreenState>(
          listener: (context, state) {
            if (state is Failed) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('${state.message}')));
            }
          },
          builder: (context, state) {
            if (state is Loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is DataLoaded) {
              return ListView.builder(
                itemBuilder: (_, index) {
                  final item = state.items[index];
                  if (item is PopularMovies) {
                    return HomeSection(
                      title: item.title,
                      items: item.movies,
                    );
                  }
                  if (item is TopRatedMovies) {
                    return HomeSection(
                      title: item.title,
                      items: item.movies,
                    );
                  }
                  if (item is UpcomingMovies) {
                    return HomeSection(
                      title: item.title,
                      items: item.movies,
                    );
                  }
                  return null;
                },
                itemCount: state.items.length,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
