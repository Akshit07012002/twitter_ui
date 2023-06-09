import 'package:flutter/material.dart';
import 'package:twitter_ui/models/post.dart';
import 'package:twitter_ui/services/mongoConnect.dart';

class ForYou extends StatefulWidget {
  const ForYou({super.key});

  @override
  State<ForYou> createState() => _ForYouState();
}

class _ForYouState extends State<ForYou> {
  @override
  Widget build(BuildContext context) {
    
    double width = MediaQuery.of(context).size.width;
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(
          const Duration(seconds: 1),
          () async {
            await MongoDatabase.getDocuments();
            setState(() {
              print('Refreshed');
            });
          },
        );
      },
      child: FutureBuilder(
        future: MongoDatabase.getDocuments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.white,
              child: const LinearProgressIndicator(
                backgroundColor: Colors.black,
              ),
            );
          } else {
            if (snapshot.hasError) {
              return Container(
                color: Colors.white,
                child: const Center(
                  child: Text('Something went wrong, try again.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      )),
                ),
              );
            } else {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) => Card(
                        child: Column(
                          children: [
                            ListTile(
                              leading: const CircleAvatar(
                                child: FlutterLogo(),
                              ),
                              title: Text('User $index'),
                              subtitle: Text('Tweet $index'),
                            ),
                            Image.network(
                                snapshot.data![index]['content'] ?? ''),
                            // Image.network(Posts.fromJson(snapshot.data![index]).content ?? ''),
                          ],
                        ),
                      ));
            }
          }
        },
      ),
    );
  }
}
