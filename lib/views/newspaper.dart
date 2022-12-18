import 'package:flutter/material.dart';
import 'package:news_paper/models/articale.dart';
import 'package:news_paper/services/api_services.dart';

class NewsPaper extends StatefulWidget {
  const NewsPaper({Key? key}) : super(key: key);

  @override
  State<NewsPaper> createState() => _NewsPaperState();
}

class _NewsPaperState extends State<NewsPaper> {
  ApiServices cliant = ApiServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: cliant.getArticle(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Articale>> snapshot) {
                if (snapshot.hasData) {
                  List<Articale>? article = snapshot.data;
                  return ListView.builder(
                    itemCount: article!.length,
                    itemBuilder: (context, index) =>
                    Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            child: Image.network(article[index].urlToImage.toString()),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Auther : "+article[index].author.toString()),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text("PublishedAt : "+article[index].publishedAt.toString()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
