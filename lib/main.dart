
import 'package:flutter/material.dart';

import 'PrimeMinister.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'PRIME MINISTER'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key,  this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String  dropdownValue = "ManMohanSingh";
  List<String> primelist=["ManMohanSingh","JavaharlaNehru","Shastri_G","Indira_Gandhi","Rajiv_Gandhi"];
  List<PrimeMinister> primeminister = [
    new PrimeMinister("ManMohanSingh", "2013-2017" , "Congress" , "2019" , "assets/images/ManMohanSingh.jpg"),
    new PrimeMinister("Jawaharlal_Nehru" , "2013-2017" , "Congress" , "2019" , "assets/images/JavaharlalNehru.jpg"),
    new PrimeMinister("Shastri_G" , "2013-2017" , "Congress" , "2019" , "assets/images/Shastri_G.webpl"),
    new PrimeMinister("Indira_Gandhi" , "2012-2019" , "BJp" , "2021" , "assets/images/Indira_Gandhi.jpg"),
    new PrimeMinister("Rajiv_Gandhi" , "2021-2023" , "AAP" , "2022" , "assets/images/Rajiv_Gandhi.jpg")];

  PrimeMinister selectedpath=null;




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_circle_down),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {


                setState(() {
                  dropdownValue = newValue;


                  for(int x=0;x<primeminister.length;x++)
                  {
                    if(dropdownValue==primeminister[x].name)
                      selectedpath=primeminister[x];
                  }



                });


              },
              items: primelist.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )
            ,

            selectedpath!=null?Container(width: 500,

                // color: Colors.yellow,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        colors: [Colors.red,Colors.yellow]

                    )
                ),



                child:Row(children: [


                  Container(
                    height:200,
                      width:200,
                      child: Image.asset(selectedpath.pic.toString())),
                  SizedBox(width: 5,),

                  Column(children: [

                    Text("Name:${selectedpath.name}"),
                    Text("Duration:${selectedpath.duration}"),
                    Text("Party:${selectedpath.party}")



                  ],)





                ],)):SizedBox()








          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}