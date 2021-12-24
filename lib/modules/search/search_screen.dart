import 'package:flutter/material.dart';
import 'package:flutter_app_news/shared/components/news_components.dart';
import 'package:flutter_app_news/shared/cubits/news_cubit/cubit.dart';
import 'package:flutter_app_news/shared/cubits/news_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getSearchData(''),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const Text('Search Page'),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (value) {
                    NewsCubit.get(context).getSearchData(value);
                  },
                  controller: searchController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Input Text Search',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(child: buildArticleItem(NewsCubit.searchData, state)),
            ],
          ),
        ),
      ),
    );
  }
}
