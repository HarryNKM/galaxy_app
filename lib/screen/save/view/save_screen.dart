import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:galaxy_planets/main.dart';
import 'package:galaxy_planets/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getBookmark();
  }

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<HomeProvider>();
    providerR = context.watch<HomeProvider>();
    return SafeArea(
      child: Scaffold(
          body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Stack(
          children: [
            providerW!.isTheme == false
                ? Image.network(
                    "https://c4.wallpaperflare.com/wallpaper/284/26/428/portrait-display-vertical-artwork-digital-art-space-hd-wallpaper-preview.jpg",
                    fit: BoxFit.cover,
                    height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                  )
                : Image.network(
                    "https://www.shutterstock.com/image-photo/vertical-sky-blue-orange-light-600nw-1936290373.jpg",
                    fit: BoxFit.cover,
                    height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                  ),
            Column(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        "Saved",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    Icon(Icons.share,color: Colors.white,)
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: providerW!.bookmarkName.length,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network("${providerW!.bookmark[index]}"),
                            Text(
                              "${providerW!.bookmarkName[index]}",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                            const SizedBox(
                              width: 60,
                            ),
                            IconButton(
                              onPressed: () {
                                providerR!.deleteBookmark(index);
                                DelightToastBar(
                                  autoDismiss: true,
                                  snackbarDuration: Duration(seconds: 2),
                                  builder: (context) => const ToastCard(
                                    leading: Icon(
                                      Icons.done_all,
                                      size: 28,
                                    ),
                                    title: Text(
                                      "Planet Deleted",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ).show(context);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
