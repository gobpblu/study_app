import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/ratings_cubit.dart';

class RatingsPage extends StatelessWidget {
  const RatingsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: BlocBuilder<RatingsCubit, RatingsState>(
        builder: (context, state) {
          switch (state.isLoading) {
            case true:
              return const Center(child: CircularProgressIndicator());
            default:
              return ListView.builder(
                itemCount: state.usersRatings.length,
                itemBuilder: (buildContext, index) => ListTile(
                  leading: Text((index + 1).toString(), style: TextStyle(fontSize: 28),),
                  title: Text(state.usersRatings[index].username, style: TextStyle(fontSize: 20),),
                  trailing: Text(getPointsString(state.usersRatings[index].points)),
                ),
              );
          }
        },
      ),
    );
  }

  String getPointsString(int points) {
    if (points % 10 == 1 && points ~/ 10 % 10 == 0) {
      return '$points очко';
    } else if (points % 10 >= 2 && points % 10 <= 4 && points ~/ 10 % 10 == 0) {
      return '$points очка';
    } else {
      return '$points очков';
    }
  }
}
