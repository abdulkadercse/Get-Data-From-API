import 'package:flutter/material.dart';
import '../model/Data_model.dart';
import '../repository/auth_repo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: FutureBuilder<DataModel>(
            future: AuthRepo().getData(),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                return ListView.builder(
                    itemCount: snapShot.data?.data?.length,
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          decoration:  BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(
                            child: ListTile(
                              leading: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(snapShot
                                                  .data?.data?[index].avatar ??
                                              "")))),
                              title: Text(
                                  " First name : ${snapShot.data!.data![index].firstName.toString()}",),
                              subtitle: Text(
                                  " Last name : ${snapShot.data!.data![index].lastName.toString()}"),
                              trailing: Text(
                                  "Email Address : ${snapShot.data!.data![index].email.toString()}"),
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
