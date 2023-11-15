import 'package:api_http/api.dart';
import 'package:api_http/post_model/post_model.dart';
import 'package:flutter/material.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PostView> {
  @override
  void initState() {
    super.initState();
    ApiService.getposts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            FutureBuilder(
              future: ApiService.getposts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<PostModel>? posts = snapshot.data;
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: ListTile(
                                tileColor: Colors.blueGrey,
                                title: Text(posts[index].title ?? ""),
                                subtitle: Text(posts[index].body ?? ""),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                          itemCount: posts!.length),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
