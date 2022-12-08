import 'package:flutter/material.dart';

class MilkScreen extends StatelessWidget {
  const MilkScreen({Key? key}) : super(key: key);
  final Color redColor = const Color(0xffA71E27);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text(
            "Milk",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 350,
               // margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    Container(
                      height: 300,
                     decoration: BoxDecoration(
                       color: redColor,
                       borderRadius: BorderRadius.circular(20)
                     ),
                      child: Column(
                        children: [
                         ClipRRect(
                           borderRadius: BorderRadius.circular(20),
                           child: Image.network(
                             "https://i1.wp.com/moneynation.com/wp-content/uploads/2015/04/milk1.jpg",
                             width: double.infinity,
                             height: 230,
                             fit: BoxFit.fill,
                           ),
                         ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 5
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Almarai Milk",
                                  style: TextStyle(
                                    fontSize: 26,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 20,),
                                Icon(
                                  Icons.favorite_border_outlined,
                                  size: 42,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5,),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Text(
                                    "36.59 SAR",
                                    style: TextStyle(
                                      fontSize: 26,
                                      color: redColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                    SizedBox(height: 7,),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5
                      ),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            color: redColor,
                            size: 35,
                          ),
                          Text(
                            "100",
                            style: TextStyle(
                              color: redColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 25),
                          Icon(
                            Icons.favorite,
                            color: redColor,
                            size: 35,
                          ),
                          Text(
                            "100",
                            style: TextStyle(
                              color: redColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ],
                      ),
                    )
                    // Container(
                    //   height:400,
                    //   margin: EdgeInsets.all(15),
                    //   decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.circular(20)
                    //   ),
                    // ),

                  ],
                ),
              ),
              SizedBox(height: 20,),
              Text(
                "Like This",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
             SizedBox(
               height: 220,
               child: ListView.builder(
                 scrollDirection: Axis.horizontal,
                 itemCount: 6,
                   itemBuilder: (context, index) =>
                       Container(
                     width: 200,
                     height: 200,
                     margin: EdgeInsets.only(
                         top: 10,
                         bottom: 10,
                       right: 15
                     ),
                     decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(8)
                     ),
                     child:Column(
                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Image.network(
                           "https://i1.wp.com/moneynation.com/wp-content/uploads/2015/04/milk1.jpg",
                           width: 250,
                           height: 105,
                           // width: double.infinity,
                           //fit: BoxFit.fill,
                         ),
                         SizedBox(height: 35,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             Text(
                               "Almarai Milk",
                               style: TextStyle(
                                 fontSize: 20,
                                 color: Colors.black,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                             Icon(
                               Icons.favorite_border_outlined,
                               size: 35,
                               color: Colors.grey,
                             ),
                           ],
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left: 18),
                           child: Text(
                             "36.59 SAR",
                             style: TextStyle(
                               fontSize: 18,
                               color: redColor,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                         ),
                       ],
                     ),
                   )
               ),
             )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        decoration:BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: redColor,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Text(
                "add to cart",
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: redColor,
                  width: 3
                )
              ),
              child: Icon(
                Icons.horizontal_rule,
                color: redColor,
                size: 35,
              ),
            ),
            Text(
              "01",
              style: TextStyle(
                fontSize: 26,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: redColor,
                      width: 3
                  )
              ),
              child: Icon(
                Icons.add,
                color: redColor,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
