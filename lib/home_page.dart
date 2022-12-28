import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedOption = 1;
  final List image = [
    ["",""],
    ["https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/harpers-ferry-west-virginia-royalty-free-image-1660073165.jpg?crop=0.699xw:1.00xh;0.128xw,0&resize=640:*","west verginia"],
    ["https://img.traveltriangle.com/blog/wp-content/uploads/2014/11/cover-for-Places-To-Visit-In-August-In-The-World.jpg","maldives"],
    ["https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg","paris"]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              color: Color.fromARGB(255, 5, 42, 165),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //aapbar----------------
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30,
                      ),
                      Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),

              //bold text--------------------
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Explore ",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                      Text(
                        "the world!",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 70,
              ),
              //listview-------------
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: image.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return RotatedBox(
                          quarterTurns: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 17.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 80.0),
                                  child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedOption = 3;
                                        });
                                      },
                                      child: Text(
                                        "option 3",
                                        style: TextStyle(
                                            color: selectedOption == 3
                                                ? Colors.amber
                                                : Colors.black),
                                      )),
                                ),
                                GestureDetector(
                                    onTap: (() {
                                      setState(() {
                                        selectedOption = 2;
                                      });
                                    }),
                                    child: Text("option 2",style: TextStyle(
                                            color: selectedOption == 2
                                                ? Colors.amber
                                                : Colors.black),)),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: GestureDetector(
                                      onTap: (() {
                                        setState(() {
                                          selectedOption = 1;
                                        });
                                      }),
                                      child: Text("option 1",style: TextStyle(
                                            color: selectedOption == 1
                                                ? Colors.amber
                                                : Colors.white),)),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            children: [
                              Container(
                                width: 200,
                                height: 400,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      image[index][0],
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text(image[index][1],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                              
                            ],
                          ),
                        );
                      }
                    }),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
