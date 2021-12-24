import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_news/modules/webview/webview_screen.dart';
import 'package:flutter_app_news/shared/cubits/news_cubit/states.dart';

ConditionalBuilder buildArticleItem(item, state) {
  return ConditionalBuilder(
    condition: state is NewsReloadState,
    builder: (context) => const Center(child: CircularProgressIndicator()),
    fallback: (context) => ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: item.length,
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          width: double.infinity,
          height: 1.0,
          color: Colors.grey,
          margin: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WebViewScreen(
                  url: item[index]['url'].toString(),
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(5.0),
                  //   image: DecorationImage(
                  //     fit: BoxFit.cover,
                  //     image: NetworkImage('${item[index]['urlToImage']}'),
                  //   ),
                  // ),
                ),
                const SizedBox(width: 20.0),
                Expanded(
                  child: Container(
                    height: 120.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            item[index]['title'].toString(),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        Text(
                          item[index]['publishedAt'].toString(),
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
