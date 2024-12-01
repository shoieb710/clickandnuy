import 'package:flutter/material.dart';
import 'package:testt/view/screen/ditaels.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List catagores = [
    {"iconname": Icons.laptop, "title": "labtop"},
    {"iconname": Icons.phone_android, "title": "Mobile"},
    {"iconname": Icons.electric_bike, "title": "Bike"},
    {"iconname": Icons.card_giftcard, "title": "Gifts"},
    {"iconname": Icons.electric_car, "title": "car"},
    {"iconname": Icons.chair, "title": "Chair"},
  ];
  List items = [
    {
      "image": "images/10.jpeg",
      "title": "Headphone ",
      "subtitle": "describtion 1",
      "price": "350\$"
    },
    {
      "image": "images/1.jpeg",
      "title": "Headphone ",
      "subtitle": "describtion 2",
      "price": "550\$"
    },
    {
      "image": "images/2.jpeg",
      "title": "Headphone ",
      "subtitle": "describtion 3",
      "price": "3555\$"
    },
    {
      "image": "images/3.jpeg",
      "title": "Headphone 4",
      "subtitle": "describtion 4",
      "price": "3500\$"
    },
        {
      "image": "images/4.jpeg",
      "title": "Headphone 5",
      "subtitle": "describtion 5",
      "price": "3500\$"
    },
        {
      "image": "images/5.jpeg",
      "title": "Headphone 5",
      "subtitle": "describtion 5",
      "price": "3500\$"
    },
        {
      "image": "images/6.jpeg",
      "title": "Headphone 4",
      "subtitle": "describtion 4",
      "price": "3500\$"
    },
        {
      "image": "images/8.png",
      "title": "Headphone 4",
      "subtitle": "describtion 4",
      "price": "3500\$"
    },
            {
      "image": "images/11.png",
      "title": "Headphone 4",
      "subtitle": "describtion 4",
      "price": "3500\$"
    },
            {
      "image": "images/12.png",
      "title": "Headphone 4",
      "subtitle": "describtion 4",
      "price": "3500\$"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(

      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Row(children: [
              Expanded(
                child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: const Icon(Icons.search),
                        hintText: "search",
                        fillColor: Colors.grey[200],
                        filled: true)),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(Icons.menu,size: 40,),)
            ]),
            Container(height: 30,),
            const Text( "Categores", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), ),
            Container( height: 20, ),
            SizedBox( height: 100,
              child: ListView.builder(
                itemCount: catagores.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      Container( margin: const EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(100)),
                        padding: const EdgeInsets.all(15),
                        child: Icon(
                          catagores[i]["iconname"],
                          size: 40,
                        ),
                      ),
                      Text(catagores[i]["title"], style: TextStyle(fontWeight: FontWeight.bold,
                            color: Colors.grey[800]), )
                    ],
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const Text(
                "Best selling",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            GridView.builder(
                itemCount: items.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 250,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder:(context) => Itemsdetiels(data: items[i],),));
                    },
                    child: Card(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(color: Colors.grey, width: 700,
                              child: Image.asset( items[i]["image"],fit: BoxFit.fill,
                                height: 150,
                              ),
                            ),
                            Text( items[i]["title"], style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Container(height: 2,),
                            Text( items[i]["subtitle"],style: const TextStyle(
                                  fontSize: 14, color: Colors.grey),),
                            Container(height: 6,),
                            Text(
                              items[i]["price"],
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold),
                            )
                          ]),
                    ),
                  );
                })
          ],
        ),
      ),
    ));
  }
}
