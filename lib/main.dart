import 'package:flutter/material.dart';
import 'package:hoosh_pr/maz_array.dart';
import 'package:hoosh_pr/xoplay/playgmame.dart';

import 'knowingly.dart';
import 'm-coloring/prersent.dart';
import 'unknowingly.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {




    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const Play(),
    );
  }
}


class MyHomePage extends StatefulWidget {
   const MyHomePage({super.key, });





  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  void _onToggle(int index) {
    if(index!=chosmaze){
      if(index ==1){
        mazi= m.splitBinaryString(m.mazs2, 41);
        maze = createContainers(mazi);
      }else if(index ==0){
        mazi= m.splitBinaryString(m.mazs1, 41);
        maze = createContainers(mazi);
      }


      setState(() {
        chosmaze = index; // اندیس انتخاب شده را به روز رسانی می‌کنیم
      });

    }

  }
  void _onToggle2(int index) {
    if(index!=chosai){
      if(index ==1){

      }else if(index ==0) {

      }
      setState(() {
        chosai = index; // اندیس انتخاب شده را به روز رسانی می‌کنیم
      });

    }

  }

  List<List<Container>> createContainers(List<List<int>> binaryArrays) {
    List<List<Container>> containerList = [];

    for (var row in binaryArrays) {
      List<Container> containerRow = [];
      for (var value in row) {
        // اگر مقدار 0 باشد، رنگ سیاه و اگر 1 باشد، رنگ سفید
        late Color color;
        if(value == 0){
         color = Colors.black;}else if(value == 1){
          color = Colors.white;
        }else{
          color = Colors.red;
        }
         containerRow.add(
          Container(
            width: 8.0,
            height: 8.0,
            color: color,
          ),
        );
      }
      containerList.add(containerRow);
    }

    return containerList;
  }
  late List<List<Container>> maze;


  Maz m=Maz();

  late List<List<int>> mazi;
   int chosmaze=0;
   int chosai=0;

  int pathcost=0;
  int cheakednode=0;

  @override
  void initState() {

    mazi= m.splitBinaryString(m.mazs1, 41);
    maze = createContainers(mazi);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {



    Widget mmmaazzz= Container(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: maze.map((row) {
            return Row(
              children: row,
            );
          }).toList(),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title:const  Text("dr.khosravi"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Column(

            children: [
              const  SizedBox(height: 30,),
        ToggleButtons(
          isSelected:  [0 == chosmaze, 1 == chosmaze],
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
              child: Text('maz1'),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('maz 2'),
            ),
          ],
        ),
              const  SizedBox(height: 30,),

              ToggleButtons(
                isSelected:  [0 == chosai, 1 == chosai, 2== chosai,3== chosai,4==chosai],
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
                    child: Text('BFS'),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('DFS'),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('IDS'),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('A*'),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('RBFS'),
                  ),
                ],
              ),
              const  SizedBox(height: 30,),

           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
             Text("هزینه مسیر : $pathcost"),
               const SizedBox(width: 30,),
               Text("تعداد نود های بررسی شده : $cheakednode"),
           ],),
             const SizedBox(height: 30,),

              mmmaazzz


            ]
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(onPressed: ()async{

        if(chosmaze==0){
          mazi= m.splitBinaryString(m.mazs1, 41);
        } else{
          mazi= m.splitBinaryString(m.mazs2, 41);
        }
        switch (chosai) {
          case 0:
            Avalpahana avalpahana=Avalpahana(maze: mazi);
            List<Point> temp = await avalpahana.avalpahana();

            for(var x in temp ){

              mazi[x.x][x.y]=2;
              pathcost++;
            }
            setState(() {
             pathcost=avalpahana.pathcost;
              cheakednode=avalpahana.cheakednode;
              maze = createContainers(mazi);
            });
            break;
          case 1:
            Dfs dfs=Dfs(maze: mazi);
            List<Point> temp = await dfs.dfs();
            for(var x in temp ){
              mazi[x.x][x.y]=2;

            }
            setState(() {
              pathcost=dfs.pathcost;
              cheakednode=dfs.cheakednode;

              maze = createContainers(mazi);

            });
            break;
          case 2:
            Ids ids=Ids(maze: mazi);
            List<Point> temp = await ids.ids();
            for(var x in temp ){
              mazi[x.x][x.y]=2;

            }
            setState(() {
              pathcost=ids.pathcost;
              cheakednode=ids.cheakednode;

              maze = createContainers(mazi);

            });
            break;
          case 3:
           print("ssssssss");
            AStar aStar=AStar(maze: mazi);
            H1 h1=H1(mazer :mazi.length,mazes:  mazi[0].length);
            List<List<int>> temp1=h1.doh1();

            Node start= Node(0, 0, 0, temp1[0][0], 0);
            Node goal= Node(40, 40, 0, temp1[40][40], 0);
           print("مشممشمشمشم");
            List<Node> temp = await aStar.aStar(temp1,start,goal);
            for(var x in temp ){
              mazi[x.x][x.y]=2;
            }
           print("qqqqq");
            setState(() {
              pathcost=aStar.pathcost;
              cheakednode=aStar.cheakednode;

              maze = createContainers(mazi);

            });
            break;


          case 4:

            Rbfs rbfs=Rbfs(maze: mazi);
            H1 h1=H1(mazer :mazi.length,mazes:  mazi[0].length);
            List<List<int>> temp1=h1.doh1();

            NodeRbfs start= NodeRbfs(0, 0);
            NodeRbfs goal= NodeRbfs(40, 40);

            List<NodeRbfs> temp =  rbfs.bestFirstSearchRecursive(start,goal,temp1,{});
            for(var x in temp ){
              mazi[x.x][x.y]=2;
            }

            setState(() {
              pathcost=rbfs.pathcost;
              cheakednode=rbfs.cheakednode;

              maze = createContainers(mazi);

            });
            break;
        }




      },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber, // رنگ پس‌زمینه دکمه
          ),
          child: const Text("اجرا")),

    );
  }





}
