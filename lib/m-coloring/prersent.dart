
import 'package:flutter/material.dart';
import 'package:hoosh_pr/m-coloring/grph.dart';

import 'csp.dart';



class Coloring extends StatefulWidget {
  const Coloring({super.key});

  @override
  State<Coloring> createState() => _ColoringState();
}

class _ColoringState extends State<Coloring> {

  void _onToggle(int index) {
    if(index!=irbi){

      setState(() {
        irbi = index; // اندیس انتخاب شده را به روز رسانی می‌کنیم
      });

    }

  }
  void _onToggle2(int index) {
    if(index!=choseh){

      setState(() {
        choseh = index; // اندیس انتخاب شده را به روز رسانی می‌کنیم
      });

    }

  }
Khorasan khorasan=Khorasan();
  Iran iran=Iran();

  List<Padding> show =[];
  Graph2 graphkh = Graph2();
  Graph2 graphir = Graph2();
  int choseh=-2;
  int irbi=0;
  @override

  void initState() {
   khorasan.cityNeighbors.forEach((city, neighbors) {
     graphkh.addVertex(city); // اضافه کردن شهر به گراف
     for (var neighbor in neighbors) {
       graphkh.addEdge(city, neighbor); // اضافه کردن یال بین شهر و همسایه‌اش
     }
   });
   iran.neighbors.forEach((city, neighbors) {
     graphir.addVertex(city); // اضافه کردن شهر به گراف
     for (var neighbor in neighbors) {
       graphir.addEdge(city, neighbor); // اضافه کردن یال بین شهر و همسایه‌اش
     }
   });


   super.initState();
   graphkh.display();
  }
  Widget build(BuildContext context) {
    return  Center(
      child: Scaffold(

        appBar: AppBar(

          backgroundColor: Theme.of(context).colorScheme.inversePrimary,

      title:const  Text("dr.khosravi"),
      ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              const  SizedBox(height: 30,),
              ToggleButtons(
                isSelected:  [0 == irbi, 1 == irbi],
                onPressed: _onToggle,
                color: Colors.black,
                selectedColor: Colors.white,
                fillColor: Colors.blue,
                borderColor: Colors.grey,
                selectedBorderColor: Colors.blue,
                borderRadius: BorderRadius.circular(8.0),
                children:const [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('khorasan'),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('iran'),
                  ),
                ],
              ),
              const  SizedBox(height: 30,),

              ToggleButtons(
                isSelected:  [0 == choseh, 1 == choseh, 2== choseh,3== choseh],
                onPressed: _onToggle2,
                color: Colors.black,
                selectedColor: Colors.white,
                fillColor: Colors.blue,
                borderColor: Colors.grey,
                selectedBorderColor: Colors.blue,
                borderRadius: BorderRadius.circular(8.0),
                children:const [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('MRV'),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('DH'),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('LCV'),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('kaman'),
                  ),

                ],
              ),
              const  SizedBox(height: 30,),



              ElevatedButton(onPressed: ()async{
                show=[];
                late  Cps cps;
                if(irbi==0){
                 cps =Cps(graphkh);}
                if(irbi==1){
                   cps =Cps(graphir);
                }

                    cps.backtrackColoring(choseh);
                    cps.assignment.forEach((city, clor){
                      Color cc= Colors.blue;
                      if(clor=="green" ){
                        cc=Colors.green;
                      }else if (clor== "white"){
                        cc=Colors.white;
                      }else if (clor== "red"){
                        cc=Colors.red;
                      }


                     var temp= Padding(
                       padding: const EdgeInsets.all(8.0),
                       child:Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           Row(

                             children: [
                               Text("$city , $clor"),
                       const SizedBox(width: 8,),
                               Container(
                                 width: 15,
                                 height: 15,
                                 decoration: BoxDecoration(
                                   color: cc, // رنگ پس‌زمینه
                                   border: Border.all(
                                     color: Colors.black, // رنگ حاشیه
                                     width: 2, // عرض حاشیه
                                   ),
                                   borderRadius: BorderRadius.circular(3), // اگر می‌خواهید حاشیه‌ها گرد باشند
                                 ),


                               )
                             ],
                           ),

                         ],
                       )


                     );
                     show.add(temp);
                    });
       setState(() {

       });

              },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber, // رنگ پس‌زمینه دکمه
                  ),
                  child: const Text("اجرا")),
     Column(
       children: show,
     )
            ],),
          ),
        ),


      ),
    );
  }
}

