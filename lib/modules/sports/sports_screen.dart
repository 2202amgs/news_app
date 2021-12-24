import 'package:flutter/material.dart';
import 'package:flutter_app_news/shared/components/news_components.dart';
import 'package:flutter_app_news/shared/cubits/news_cubit/cubit.dart';
import 'package:flutter_app_news/shared/cubits/news_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getSportData('sport'),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) =>
            buildArticleItem(NewsCubit.sportData, state),
      ),
    );
  }
}
