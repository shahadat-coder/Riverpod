import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/Model/user_model.dart';
import 'package:river_pod/Screens/details_screen.dart';
import 'package:river_pod/data_provider/data_provider.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context,ref) {
    final data = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod'),
      ),
      body: data.when(
          data: (data){
            List<UserModel> userList = data.map((e) => e).toList();
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
               children: [
                 Expanded(
                     child:ListView.builder(
                       itemCount: userList.length,
                         itemBuilder: (_, index){
                           return InkWell(
                             onTap: ()=> Navigator.of(context).push(
                               MaterialPageRoute(
                                   builder: (context) => DetailScreen(
                                      e: userList[index],
                                   )
                               ),
                             ),

                             child: Card(
                               color: Colors.white70,
                               elevation: 4,
                               margin: const EdgeInsets.symmetric(vertical: 10),
                               child: ListTile(
                                 title: Text(userList[index].firstname,style: const TextStyle(
                                   color: Colors.black87
                                 ),),
                                 subtitle: Text(userList[index].lastname,style: const TextStyle(
                                   color: Colors.black87
                                 ),),
                                 trailing: CircleAvatar(
                                   backgroundImage: NetworkImage(userList[index].avatar),
                                 ),
                               ),
                             ),
                           );
                         }
                     )
                 )
               ],
              ),
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: ()=> const Center(
             child: CircularProgressIndicator(),
          )
      ),
    );
  }
}