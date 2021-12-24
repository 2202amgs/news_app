import 'package:flutter/material.dart';
import 'package:flutter_app_news/shared/components/news_components.dart';
import 'package:flutter_app_news/shared/cubits/news_cubit/cubit.dart';
import 'package:flutter_app_news/shared/cubits/news_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusinessData('business'),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) =>
            buildArticleItem(NewsCubit.businessData, state),
      ),
    );
  }
}
