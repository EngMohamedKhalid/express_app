import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({Key? key}) : super(key: key);

  // getProducts()async{
  //   QuerySnapshot<Map<String,dynamic>> products = await FirebaseFirestore.instance.collection("products").get();
  //   products.docs.forEach((element) { });
  // }
  final Color redColor = const Color(0xffA71E27);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor:redColor,
          title: const Text("Categories ",
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
        body: FutureBuilder<QuerySnapshot<Map<String,dynamic>>>(
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
                  if (connection.hasError) {
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
                      child: ListView(
                        children: [
                          const SizedBox(height: 8,),
                          SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child:
                            GridView.builder(
                              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemCount: connection.data?.docs.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8 , bottom: 8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12)
                                    ),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex : 4,
                                          child: ClipRRect(
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(12),
                                              topRight: Radius.circular(12)
                                            ),
                                            child: Image.network(
                                              width: double.infinity,
                                              height : double.infinity,
                                              fit: BoxFit.cover,
                                              "${connection.data?.docs[index]["CImage"]}",
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16,),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            "${connection.data?.docs[index]["CName"]}",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
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

        )
    );

  }
}