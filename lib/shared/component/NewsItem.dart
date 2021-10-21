import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    required this.item,
    required this.onTap,
  });

  final NewsModel item;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Container(
          width: double.infinity,
          height: 110,
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                child: CachedNetworkImage(
                  imageUrl: "${item.imageUrl}",
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        colorFilter:
                            ColorFilter.mode(Colors.red, BlendMode.dstATop),
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    child: Icon(Icons.error),
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${item.title}',
                      style:Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text('${item.publishedAt}', style: TextStyle(color: Colors.grey),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Container(
//                 width: 110,
//                 height: 110,
//                 padding: EdgeInsets.all(5.0),
//                 child: DecoratedBox(
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: NetworkImage('${item.imageUrl}'),
//                         fit: BoxFit.fill,
//                       ),
//                       borderRadius: BorderRadius.circular(20.0)),
//                 ),
//               )
