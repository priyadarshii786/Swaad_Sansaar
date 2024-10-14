import 'package:flutter/material.dart';
import 'package:swaad_sansaar/widget/support_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List chikku = [
    "images/soup.jpg",
    "images/pizza.jpg",
    "images/burger.jpg",
    "images/chowmein.jpg",
    "images/chicken.jpg",
    "images/momos.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                children: [
                  Text(
                    'Looking for your\nfavourite meal',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "images/boi_chikkuu.png",
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10.0,
              ),
              margin: EdgeInsets.only(right: 20.0),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 226, 226, 236),
                  borderRadius: BorderRadius.circular(10)),
              width: MediaQuery.of(context).size.width,
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search_outlined),
                    hintText: 'Search'),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              height: 170,
              width: MediaQuery.of(context).size.width,
              child: Expanded(
                child: Container(
                  height: 140,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: chikku.length,
                    // shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryTile(
                        image: chikku[index],
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 1.0,
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "images/cheese_burger.jpg",
                            height: 330,
                            width: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "Cheese Burger",
                          style: AppWidget.boldfieldtextstyle(),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "images/biryani_large.jpg",
                            height: 330,
                            width: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "Biryani",
                          style: AppWidget.boldfieldtextstyle(),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "images/fried_chicken_large.jpg",
                            height: 330,
                            width: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "Fried Chicken",
                          style: AppWidget.boldfieldtextstyle(),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "images/soup_large.jpg",
                            height: 330,
                            width: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "Soup",
                          style: AppWidget.boldfieldtextstyle(),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "images/dosa_large.jpg",
                            height: 330,
                            width: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "Cheese Burger",
                          style: AppWidget.boldfieldtextstyle(),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  // const CategoryTile({super.key});
  String image;
  CategoryTile({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 4.0,
          ),
          Text("Soup recipes", style: AppWidget.lightfieldtextstyle())
        ],
      ),
    );
  }
}
