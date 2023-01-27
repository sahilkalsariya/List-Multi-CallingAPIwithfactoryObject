import 'package:flutter/material.dart';
import 'package:json_app/%20models/post_model.dart';
import 'package:json_app/helper/api_helper.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multi Calling API"),
        centerTitle: true,
        elevation: 5,
      ),
      body: FutureBuilder(
        future: APIHelper.apihelper.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(" Error is ${snapshot.error}"));
          } else if (snapshot.hasData) {
            List<Post>? data = snapshot.data as List<Post>?;

            return (data != null)
                ? ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        leading: Text("${data[i].id}"),
                        title: Text("${data[i].title}"),
                        subtitle: Text("${data[i].body}"),
                        trailing: Text("${data[i].userid}"),
                      );
                    },
                  )
                : Text("No data...");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
