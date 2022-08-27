import 'package:flutter/material.dart';
import 'package:raftlab_assignment/widgets/custom_container.dart';

import '../model/entries.dart';
import '../services/remote_service.dart';

class FetchApiData extends StatefulWidget {
  const FetchApiData({Key? key}) : super(key: key);

  @override
  State<FetchApiData> createState() => _FetchApiDataState();
}

class _FetchApiDataState extends State<FetchApiData> {
  Map<String, dynamic> entries = {};
  List<Entries> entryList = [];
  var listCount = 0;
  var isLoaded = false;
  var clickedFetchData = false;

  getEntries() async {
    entries = await RemoteService().getEntries();

    if (mounted) {
      setState(() {
        entryList = entries['entries']
            .map<Entries>((json) => Entries.fromJson(json))
            .toList();
        listCount = entries['count'];
        isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    getEntries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(entryList.length);
    // print(listCount);

    return !clickedFetchData
        ? GestureDetector(
            onTap: () {
              setState(() {
                clickedFetchData = true;
              });
            },
            child: Center(
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                width: 150.0,
                margin: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 10.0,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 8.0,
                ),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(
                      12.0,
                    )),
                child: const Text(
                  'Fetch Data',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
          )
        : !isLoaded
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.transparent,
                  color: Theme.of(context).primaryColor,
                ),
              )
            : ListView.builder(
                itemCount: listCount,
                itemBuilder: (context, index) {
                  //
                  return CustomContainer(
                    api: 'API: ${entryList[index].api}',
                    desc: 'Description: ${entryList[index].desc}',
                    auth: entryList[index].auth == ''
                        ? 'Auth: No Auth'
                        : 'Auth: ${entryList[index].auth}',
                    https: 'HTTPS: ${entryList[index].https}',
                    cors: 'Cors: ${entryList[index].cors}',
                    link: 'Link: ${entryList[index].link}',
                    category: 'Category: ${entryList[index].category}',
                  );
                },
              );
  }
}

//
// Container(
//                     decoration: BoxDecoration(
//                       color: Colors.blue[200],
//                       borderRadius: BorderRadius.circular(14.0),
//                     ),
//                     width: double.infinity,
//                     margin: const EdgeInsets.symmetric(
//                         horizontal: 10.0, vertical: 8.0),
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 10.0, vertical: 8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('API: ${entryList[index].api}'),
//                         Text('Description: ${entryList[index].desc}'),
//                         Text(entryList[index].auth == ''
//                             ? 'Auth: No Auth'
//                             : 'Auth: ${entryList[index].auth}'),
//                         Text('HTTPS: ${entryList[index].https}'),
//                         Text('Cors: ${entryList[index].cors}'),
//                         Text('Link: ${entryList[index].link}'),
//                         Text('Category: ${entryList[index].category}'),
//                       ],
//                     ),
//                   )