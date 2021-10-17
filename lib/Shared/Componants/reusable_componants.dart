import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/mduales/WebView/webView.dart';

Widget newsItemBuildes(data) {
  return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        String? path = data[index]['urlToImage'];
        String title = data[index]['title'];
        String date = data[index]['publishedAt'];
        String url = data[index]['url'];
        return InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WebViewBage(url)));
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                !(path == null)
                    ? Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(
                                path,
                              ),
                              fit: BoxFit.cover),
                        ))
                    : SizedBox(),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    height: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          date,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 20,
        );
      },
      itemCount: data.length);
}
