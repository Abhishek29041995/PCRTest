import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pcrest/services/api_services.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List dataList = List();
  bool _isLoading = false;
  Future loadyourData() async {
    commonMethod().then((onResponse) {
        setState(() {
          _isLoading = false;
        });
        setState(() {
          dataList = json.decode(onResponse.body);
          _isLoading = false;
        });
    });
  }

  @override
  void initState() {
    super.initState();

    loadyourData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar:AppBar(title:Text("Company List")),
          body: _isLoading
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Row(
                          children: <Widget>[
                            Image.network(
                              dataList[index]['company_logo'],
                              height:70,
                              width:70
                            ),
                            Wrap(
                              children: <Widget>[
                                Text(dataList[index]['company']),
                                Text(dataList[index]['title'])
                              ],
                            )
                          ],
                          ),
                      ),
                    );
                  },
                ),
    ));
  }
}
