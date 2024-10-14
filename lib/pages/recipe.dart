import 'package:flutter/material.dart';
import 'package:swaad_sansaar/widget/support_widget.dart';

class Recipe extends StatefulWidget {
  const Recipe({super.key});

  @override
  State<Recipe> createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Stack(
        children: [
          Image.asset(
            "images/momos.jpg",
            width: MediaQuery.of(context).size.width,
            height: 400,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.width / 1.1),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Steamed Momos",
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                Divider(),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "About Recipe",
                  style: AppWidget.boldfieldtextstyle(),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Instructions: Prepare the Dough: In a mixing bowl, combine flour and a pinch of salt. Gradually add water and knead to form a smooth and elastic dough. Cover with a damp cloth and let it rest for about 30 minutes. Prepare the Filling: Heat oil in a pan over medium heat. Add chopped onions, garlic, ginger, and green chilies. Sauté until onions are translucent. Add finely chopped vegetables and stir-fry for a few minutes until slightly tender. Add soy sauce, salt, and pepper. Mix well and cook for another minute. Let it cool.  🍽️",
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
