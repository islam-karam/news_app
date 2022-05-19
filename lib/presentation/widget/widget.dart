import 'package:flutter/material.dart';

import '../../data/model/news_model.dart';

class NewsItem extends StatelessWidget {
  final NewsModel news;

  const NewsItem({Key? key, required this.news}) : super(key: key);

  @override
 Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: GridTile(
        child: Container(
          color: Colors.white,
          child: news.urlToImage != null
              ? FadeInImage.assetNetwork(
                  height: double.infinity,
                  width: double.infinity,
                  placeholder: 'assets/images/loading.gif',
                  image: news.urlToImage ?? '',
                  fit: BoxFit.cover,
                )
              : Image.asset('assets/images/1.gif'),
        ),
        footer: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              Text(
                '${news.title}',
                style: const TextStyle(
                    height: 1.3,
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
             Text(
                '${news.description}',
                style: const TextStyle(
                    height: 1.3,
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
