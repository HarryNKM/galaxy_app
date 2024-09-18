import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:galaxy_planets/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeProvider>().getJsonData();
  }

  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return SafeArea(
      child: Scaffold(
          drawer: Drawer(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.network(
                        "https://c4.wallpaperflare.com/wallpaper/284/26/428/portrait-display-vertical-artwork-digital-art-space-hd-wallpaper-preview.jpg",
                        fit: BoxFit.cover,
                        height: MediaQuery.sizeOf(context).height,
                        width: MediaQuery.sizeOf(context).width,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 40, right: 5, left: 5, bottom: 5),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.all(12),
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.4),
                          border: Border.all(
                            color: Colors.white,
                            width: 0.8,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const ListTile(
                          leading: Icon(Icons.settings_sharp,color: Colors.white,),
                          title: Text(
                            "Settings",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(12),

                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.4),
                          border: Border.all(
                            color: Colors.white,
                            width: 0.8,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const ListTile(
                          leading: Icon(Icons.favorite,color: Colors.white,),
                          title: Text(
                            "Saved",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(12),

                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.4),
                          border: Border.all(
                            color: Colors.white,
                            width: 0.8,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const ListTile(
                          leading: Icon(Icons.help,color: Colors.white,),
                          title: Text(
                            "Help",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(12),

                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.4),
                          border: Border.all(
                            color: Colors.white,
                            width: 0.8,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const ListTile(
                          leading: Icon(Icons.policy,color: Colors.white,),
                          title: Text(
                            "Privacy",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        margin: const EdgeInsets.all(12),

                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.4),
                          border: Border.all(
                            color: Colors.white,
                            width: 0.8,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const ListTile(
                          leading: Icon(Icons.logout,color: Colors.red,),
                          title: Text(
                            "Log Out",
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Stack(
              children: [
                Image.network(
                  "https://wallpaperaccess.com/full/5581727.jpg",
                  fit: BoxFit.cover,
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      const Text(
                        "Planets",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: providerW!.galaxyList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(12),
                              height: 100,
                              width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.4),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 0.8,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.network(
                                      "${providerW!.galaxyList[index].image}"),
                                  Text(
                                    "${providerW!.galaxyList[index].name}",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  const SizedBox(
                                    width: 60,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, 'detail',
                                            arguments:
                                                providerW!.galaxyList[index]);
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
