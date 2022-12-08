import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:express_app/presentation/view/all_categories.dart';
import 'package:express_app/presentation/view/category_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  // getProducts()async{
  //   QuerySnapshot<Map<String,dynamic>> products = await FirebaseFirestore.instance.collection("products").get();
  //   products.docs.forEach((element) { });
  // }
  final Color redColor = const Color(0xffA71E27);
  var offers =  FirebaseFirestore.instance.collection("offers").get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor:redColor,
        title: const Text("24 Express ",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
        ),
        leading: const Icon(
          Icons.segment,
          size: 42,
          color: Colors.white,
        ),
        actions: const [
          Icon(
            Icons.search,
            size: 42,
            color: Colors.white,
          ),
          SizedBox(width: 12,),
          Icon(
            Icons.shopping_cart,
            size: 42,
            color: Colors.white,
          ),
          SizedBox(width: 10,)
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<QuerySnapshot<Map<String,dynamic>>>(
          future: FirebaseFirestore.instance.collection("category").get(),
          builder: (context,connection) {
            switch (connection.connectionState) {
              case ConnectionState.none:
                return const Center(
                  child: Text("==========none=========="),
                );
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.active:
                return const Center(
                  child: Text("=================active!================="),);
              case ConnectionState.done:
                if (connection.hasError){
                  return const Center(child: Text("Error!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50
                    ),
                  ),);
                }
                if (connection.hasData) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      right: 10,
                      left: 10
                    ),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AllCategories(),)
                            );
                          },
                          child: Row(
                            children:  [
                              const Icon(
                                Icons.category,
                                size: 42,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 10,),
                              const Text(
                                "Categories",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26,
                                    color: Colors.white
                                ),
                              ),
                              const Spacer(
                                flex: 2,
                              ),
                              Container(
                                width: 120,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: const [
                                    Text(
                                      "see all",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 22
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward_ios_outlined)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 8,),
                        SizedBox(
                          height: 135,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: connection.data?.docs.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(
                                          builder: (builder) =>
                                              CategoryProductsScreen(
                                                catName: "${connection.data
                                                    ?.docs[index]["CName"]}",
                                              ),
                                        ));
                                  },
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.blue,
                                        radius: 42,
                                        foregroundImage: NetworkImage(
                                            "${connection.data
                                                ?.docs[index]["CImage"]}"
                                        ),
                                      ),
                                      const SizedBox(height: 16,),
                                      Text(
                                        "${connection.data
                                            ?.docs[index]["CName"]}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          //fontWeight: FontWeight.bold,
                                          fontSize: 23,
                                        ),
                                      ),
                                      // Text(
                                      //   " price = ${connection.data?.docs[index]['price']}",
                                      //   style: TextStyle(
                                      //     color: Colors.white,
                                      //     fontSize: 18,
                                      //   ),
                                      //),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: const [
                            Icon(
                              Icons.blur_circular,
                              color: Colors.white,
                              size: 42,
                            ),
                            SizedBox(width: 8,),
                            Text(
                              "Offer",
                              style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10,),
                        FutureBuilder(
                          future: FirebaseFirestore.instance.collection("offers").get(),
                            builder: (context, connection) {
                              return  SizedBox(
                                height: 200,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: connection.data?.docs.length,
                                  itemBuilder:
                                      (context, index) =>
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: Stack(
                                            alignment:AlignmentDirectional.centerEnd ,
                                            children: [
                                              Image(
                                                image:  NetworkImage(
                                                  "${connection.data?.docs[index]["ima"]}",
                                                )
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(10),
                                                alignment: Alignment.center,
                                                width: 90,
                                                height: 90,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.black,
                                                ),
                                                child:  Text(
                                                  "${connection.data?.docs[index]["na"]}",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 23,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                      ),
                                ),
                              );
                            },
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: const [
                            Icon(
                              Icons.blur_circular,
                              color: Colors.white,
                              size: 42,
                            ),
                            SizedBox(width: 8,),
                            Text(
                              "Popular",
                              style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10,),
                        FutureBuilder(
                          future: FirebaseFirestore.instance.collection("popular").get(),
                          builder: (context, connection) {
                            return
                              SizedBox(
                                height: MediaQuery.of(context).size.height,
                                child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                  ),
                                  itemCount:connection.data?.docs.length,
                                  itemBuilder:(context, index){
                                    return Padding(
                                      padding: const EdgeInsets.only(right:12 , bottom: 15),
                                      child: Container(
                                        padding: EdgeInsets.all( 15),
                                        alignment: Alignment.center,
                                        // width: double.infinity,
                                        // // height: 200,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15)
                                        ),
                                        child:Image.network(
                                          "${connection.data?.docs[index]["pImage"]}",
                                          width: double.infinity,
                                        )
                                      ),
                                    );
                                  },
                                ),
                              );
                          },
                        ),


                      ],
                    ),
                  );
                } else {
                  return const Center(child: Text("Error!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50
                    ),
                  ),);
                }
            }
          }

    ),
      )
    );

  }
}












      // SizedBox(
      //   height: 100,
      //   child: ListView.builder(
      //     scrollDirection: Axis.horizontal,
      //    // itemCount: colors.length,
      //     itemBuilder:
      //         (context, index) => Column(
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.only(right: 8),
      //           child: CircleAvatar(
      //             radius: 30,
      //
      //           ),
      //         ),
      //         const SizedBox(height: 5,),
      //         Padding(
      //           padding: const EdgeInsets.only(right: 8),
      //           child: Text(
      //             "colorsName[index]",
      //             style: TextStyle(
      //                 fontSize: 20,
      //                // color: colors[index]
      //             ),
      //
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),


