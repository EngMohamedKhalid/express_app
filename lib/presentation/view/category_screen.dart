import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String catName;
  const CategoryProductsScreen({required this.catName,Key? key}) : super(key: key);
  final Color redColor = const Color(0xffA71E27);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
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
        backgroundColor: redColor,
        title: Text(catName),
      ),
      body: FutureBuilder<QuerySnapshot<Map<String,dynamic>>>(
        future: FirebaseFirestore.instance.collection("products")
            .where("category",isEqualTo:catName ).get(),
        builder: (context,connection){
          switch(connection.connectionState){
            case ConnectionState.none:
              return const Center(child: Text("none!"),);
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
              return const Center(child: Text("active!"),);
            case ConnectionState.done:
              if(connection.hasData){
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                    scrollDirection: Axis.vertical,
                    itemCount: connection.data?.docs.length,
                    itemBuilder: (context,index){
                      //"${connection.data?.docs[index]['image']}"
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          height: 110,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: redColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child:Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                      "${connection.data?.docs[index]['image']}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "${connection.data?.docs[index]['name']}",
                                  textAlign:TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ) ,
                        ),
                      );
                    },
                  ),
                );
              }else{
                return const Center(child: Text("Error!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50
                  ),
                ),);
              }
          }
        },
      ),
    );
  }
}