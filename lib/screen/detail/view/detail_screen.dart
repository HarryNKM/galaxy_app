import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:galaxy_planets/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with TickerProviderStateMixin
{
  @override


  HomeProvider? providerR;
  HomeProvider? providerW;
  AnimationController? animationController;
  Tween<double>? rotationPlanet;
  Animation<Alignment>? alimentController;
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeProvider>().getJsonData();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    rotationPlanet = Tween(begin: 0, end: 1);
    animationController!.addListener(
          () {
        setState(() {});
      },
    );
    animationController!.repeat();
  }
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Stack(
            children: [
              providerW!.isTheme==false? Image.network(
                "https://c4.wallpaperflare.com/wallpaper/284/26/428/portrait-display-vertical-artwork-digital-art-space-hd-wallpaper-preview.jpg",
                fit: BoxFit.cover,
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
              ):Image.network(
                "https://www.shutterstock.com/image-photo/vertical-sky-blue-orange-light-600nw-1936290373.jpg",
                fit: BoxFit.cover,
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
              ),
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
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
                        Text(
                          "${providerW!.galaxyList[index].name}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25),
                        ),
                        IconButton(
                          onPressed: () {
                            providerW!.setBookMarkData(
                                providerW!.galaxyList[index].image!,
                                providerW!.galaxyList[index].name!);

                            DelightToastBar(

                              autoDismiss: true,
                              snackbarDuration: Duration(seconds: 2),

                              builder: (context) => const ToastCard(
                                leading: Icon(
                                  Icons.done_all,
                                  size: 28,
                                ),
                                title: Text(
                                  "Planet Saved",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                ),

                              ),
                            ).show(context);

                          },
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    const Divider(),
                    RotationTransition(turns: rotationPlanet!.animate(animationController!),
                    child: Image.network("${providerW!.galaxyList[index].image}")),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                " Name : ${providerW!.galaxyList[index].name} ",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                " Position : ${providerW!.galaxyList[index].position} ",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                " Distance : ${providerW!.galaxyList[index].distance} ",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                " Velocity : ${providerW!.galaxyList[index].velocity} ",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10)),
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    '${providerW!.galaxyList[index].description}',
                                    textStyle: const TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white
                                    ),
                                    speed: const Duration(milliseconds: 50),
                                  ),
                                ],

                                totalRepeatCount: 4,
                              )
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }
}
