import 'package:flutter/material.dart';

import 'alphabeta.dart';



class Play extends StatefulWidget {
  const Play({super.key});

  @override
  State<Play> createState() => _PlayState();
}

class _PlayState extends State<Play> {
  void _onToggle(int index) {
    if(index!=chosmaze){
      setState(() {
        chosmaze = index; // اندیس انتخاب شده را به روز رسانی می‌کنیم
      });

    }

  }
  int chosmaze=0;
  TicTacToe tacToe = TicTacToe();
  TicTacToe2 tacToe2 = TicTacToe2();
  @override
  Widget build(BuildContext context) {
    if(chosmaze==0){

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
                      child: Text('محدود'),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('نامحدود'),
                    ),
                  ],
                ),
            Center(child: Text(tacToe.winner,style:const TextStyle(fontSize: 20),)),

                const  SizedBox(height:70,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          if(tacToe.board[0]==" "){
                            tacToe.makeMove(0);
                            setState(() {

                            });
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width/6,
                          height: MediaQuery.of(context).size.height/7,
                          decoration: BoxDecoration(
                         //   color: cc, // رنگ پس‌زمینه
                            border: Border.all(
                              color: Colors.black, // رنگ حاشیه
                              width: 2, // عرض حاشیه
                            ),
                            borderRadius: BorderRadius.circular(3), // اگر می‌خواهید حاشیه‌ها گرد باشند
                          ),
                          child:  Center(child: Text(tacToe.board[0],style:const TextStyle(fontSize: 40),)),

                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          if(tacToe.board[1]==" "){
                            tacToe.makeMove(1);
                            setState(() {

                            });
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width/6,
                          height: MediaQuery.of(context).size.height/7,
                          decoration: BoxDecoration(
                            //   color: cc, // رنگ پس‌زمینه
                            border: Border.all(
                              color: Colors.black, // رنگ حاشیه
                              width: 2, // عرض حاشیه
                            ),
                            borderRadius: BorderRadius.circular(3), // اگر می‌خواهید حاشیه‌ها گرد باشند
                          ),
                          child:  Center(child: Text(tacToe.board[1],style:const TextStyle(fontSize: 40),)),

                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          if(tacToe.board[2]==" "){
                            tacToe.makeMove(2);
                            setState(() {

                            });
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width/6,
                          height: MediaQuery.of(context).size.height/7,
                          decoration: BoxDecoration(
                            //   color: cc, // رنگ پس‌زمینه
                            border: Border.all(
                              color: Colors.black, // رنگ حاشیه
                              width: 2, // عرض حاشیه
                            ),
                            borderRadius: BorderRadius.circular(3), // اگر می‌خواهید حاشیه‌ها گرد باشند
                          ),
                          child:  Center(child: Text(tacToe.board[2],style:const TextStyle(fontSize: 40),)),

                        ),
                      ),
                    ],
                  ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            if(tacToe.board[3]==" "){
                              tacToe.makeMove(3);
                              setState(() {

                              });
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width/6,
                            height: MediaQuery.of(context).size.height/7,
                            decoration: BoxDecoration(
                              //   color: cc, // رنگ پس‌زمینه
                              border: Border.all(
                                color: Colors.black, // رنگ حاشیه
                                width: 2, // عرض حاشیه
                              ),
                              borderRadius: BorderRadius.circular(3), // اگر می‌خواهید حاشیه‌ها گرد باشند
                            ),
                            child:  Center(child: Text(tacToe.board[3],style:const TextStyle(fontSize: 40),)),

                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            if(tacToe.board[4]==" "){
                              tacToe.makeMove(4);
                              setState(() {

                              });
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width/6,
                            height: MediaQuery.of(context).size.height/7,
                            decoration: BoxDecoration(
                              //   color: cc, // رنگ پس‌زمینه
                              border: Border.all(
                                color: Colors.black, // رنگ حاشیه
                                width: 2, // عرض حاشیه
                              ),
                              borderRadius: BorderRadius.circular(3), // اگر می‌خواهید حاشیه‌ها گرد باشند
                            ),
                            child:  Center(child: Text(tacToe.board[4],style:const TextStyle(fontSize: 40),)),

                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            if(tacToe.board[5]==" "){
                              tacToe.makeMove(5);
                              setState(() {

                              });
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width/6,
                            height: MediaQuery.of(context).size.height/7,
                            decoration: BoxDecoration(
                              //   color: cc, // رنگ پس‌زمینه
                              border: Border.all(
                                color: Colors.black, // رنگ حاشیه
                                width: 2, // عرض حاشیه
                              ),
                              borderRadius: BorderRadius.circular(3), // اگر می‌خواهید حاشیه‌ها گرد باشند
                            ),
                            child:  Center(child: Text(tacToe.board[5],style:const TextStyle(fontSize: 40),)),

                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            if(tacToe.board[6]==" "){
                              tacToe.makeMove(6);
                              setState(() {

                              });
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width/6,
                            height: MediaQuery.of(context).size.height/7,
                            decoration: BoxDecoration(
                              //   color: cc, // رنگ پس‌زمینه
                              border: Border.all(
                                color: Colors.black, // رنگ حاشیه
                                width: 2, // عرض حاشیه
                              ),
                              borderRadius: BorderRadius.circular(3), // اگر می‌خواهید حاشیه‌ها گرد باشند
                            ),
                            child:  Center(child: Text(tacToe.board[6],style:const TextStyle(fontSize: 40),)),

                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            if(tacToe.board[7]==" "){
                              tacToe.makeMove(7);
                              setState(() {

                              });
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width/6,
                            height: MediaQuery.of(context).size.height/7,
                            decoration: BoxDecoration(
                              //   color: cc, // رنگ پس‌زمینه
                              border: Border.all(
                                color: Colors.black, // رنگ حاشیه
                                width: 2, // عرض حاشیه
                              ),
                              borderRadius: BorderRadius.circular(3), // اگر می‌خواهید حاشیه‌ها گرد باشند
                            ),
                            child:  Center(child: Text(tacToe.board[7],style:const TextStyle(fontSize: 40),)),

                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            if(tacToe.board[8]==" "){
                              tacToe.makeMove(8);
                              setState(() {

                              });
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width/6,
                            height: MediaQuery.of(context).size.height/7,
                            decoration: BoxDecoration(
                              //   color: cc, // رنگ پس‌زمینه
                              border: Border.all(
                                color: Colors.black, // رنگ حاشیه
                                width: 2, // عرض حاشیه
                              ),
                              borderRadius: BorderRadius.circular(3), // اگر می‌خواهید حاشیه‌ها گرد باشند
                            ),
                            child:  Center(child: Text(tacToe.board[8],style:const TextStyle(fontSize: 40),)),

                          ),
                        ),
                      ],
                    ),
                  ],),
                const SizedBox(height: 30,),




              ]
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(onPressed: (){
        tacToe.resetGame();
        setState(() {

        });
      },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber, // رنگ پس‌زمینه دکمه
          ),
          child: const Text("ریست")),

    );}
    else{
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
                        child: Text('محدود'),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text('نامحدود'),
                      ),
                    ],
                  ),
                  Center(child: Text(tacToe2.winner,style:const TextStyle(fontSize: 20),)),

                  const  SizedBox(height:70,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              if(tacToe2.board[0]==" "){
                                tacToe2.makeMove(0);
                                setState(() {

                                });
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width/6,
                              height: MediaQuery.of(context).size.height/7,
                              decoration: BoxDecoration(
                                //   color: cc, // رنگ پس‌زمینه
                                border: Border.all(
                                  color: Colors.black, // رنگ حاشیه
                                  width: 2, // عرض حاشیه
                                ),
                                borderRadius: BorderRadius.circular(3), // اگر می‌خواهید حاشیه‌ها گرد باشند
                              ),
                              child:  Center(child: Text(tacToe2.board[0],style:const TextStyle(fontSize: 40),)),

                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(tacToe2.board[1]==" "){
                                tacToe2.makeMove(1);
                                setState(() {

                                });
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width/6,
                              height: MediaQuery.of(context).size.height/7,
                              decoration: BoxDecoration(
                                //   color: cc, // رنگ پس‌زمینه
                                border: Border.all(
                                  color: Colors.black, // رنگ حاشیه
                                  width: 2, // عرض حاشیه
                                ),
                                borderRadius: BorderRadius.circular(3), // اگر می‌خواهید حاشیه‌ها گرد باشند
                              ),
                              child:  Center(child: Text(tacToe2.board[1],style:const TextStyle(fontSize: 40),)),

                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(tacToe2.board[2]==" "){
                                tacToe2.makeMove(2);
                                setState(() {

                                });
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width/6,
                              height: MediaQuery.of(context).size.height/7,
                              decoration: BoxDecoration(
                                //   color: cc, // رنگ پس‌زمینه
                                border: Border.all(
                                  color: Colors.black, // رنگ حاشیه
                                  width: 2, // عرض حاشیه
                                ),
                                borderRadius: BorderRadius.circular(3), // اگر می‌خواهید حاشیه‌ها گرد باشند
                              ),
                              child:  Center(child: Text(tacToe2.board[2],style:const TextStyle(fontSize: 40),)),

                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              if(tacToe2.board[3]==" "){
                                tacToe2.makeMove(3);
                                setState(() {

                                });
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width/6,
                              height: MediaQuery.of(context).size.height/7,
                              decoration: BoxDecoration(
                                //   color: cc, // رنگ پس‌زمینه
                                border: Border.all(
                                  color: Colors.black, // رنگ حاشیه
                                  width: 2, // عرض حاشیه
                                ),
                                borderRadius: BorderRadius.circular(3), // اگر می‌خواهید حاشیه‌ها گرد باشند
                              ),
                              child:  Center(child: Text(tacToe2.board[3],style:const TextStyle(fontSize: 40),)),

                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(tacToe2.board[4]==" "){
                                tacToe2.makeMove(4);
                                setState(() {

                                });
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width/6,
                              height: MediaQuery.of(context).size.height/7,
                              decoration: BoxDecoration(
                                //   color: cc, // رنگ پس‌زمینه
                                border: Border.all(
                                  color: Colors.black, // رنگ حاشیه
                                  width: 2, // عرض حاشیه
                                ),
                                borderRadius: BorderRadius.circular(3), // اگر می‌خواهید حاشیه‌ها گرد باشند
                              ),
                              child:  Center(child: Text(tacToe2.board[4],style:const TextStyle(fontSize: 40),)),

                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(tacToe2.board[5]==" "){
                                tacToe2.makeMove(5);
                                setState(() {

                                });
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width/6,
                              height: MediaQuery.of(context).size.height/7,
                              decoration: BoxDecoration(
                                //   color: cc, // رنگ پس‌زمینه
                                border: Border.all(
                                  color: Colors.black, // رنگ حاشیه
                                  width: 2, // عرض حاشیه
                                ),
                                borderRadius: BorderRadius.circular(3), // اگر می‌خواهید حاشیه‌ها گرد باشند
                              ),
                              child:  Center(child: Text(tacToe2.board[5],style:const TextStyle(fontSize: 40),)),

                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              if(tacToe2.board[6]==" "){
                                tacToe2.makeMove(6);
                                setState(() {

                                });
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width/6,
                              height: MediaQuery.of(context).size.height/7,
                              decoration: BoxDecoration(
                                //   color: cc, // رنگ پس‌زمینه
                                border: Border.all(
                                  color: Colors.black, // رنگ حاشیه
                                  width: 2, // عرض حاشیه
                                ),
                                borderRadius: BorderRadius.circular(3), // اگر می‌خواهید حاشیه‌ها گرد باشند
                              ),
                              child:  Center(child: Text(tacToe2.board[6],style:const TextStyle(fontSize: 40),)),

                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(tacToe2.board[7]==" "){
                                tacToe2.makeMove(7);
                                setState(() {

                                });
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width/6,
                              height: MediaQuery.of(context).size.height/7,
                              decoration: BoxDecoration(
                                //   color: cc, // رنگ پس‌زمینه
                                border: Border.all(
                                  color: Colors.black, // رنگ حاشیه
                                  width: 2, // عرض حاشیه
                                ),
                                borderRadius: BorderRadius.circular(3), // اگر می‌خواهید حاشیه‌ها گرد باشند
                              ),
                              child:  Center(child: Text(tacToe2.board[7],style:const TextStyle(fontSize: 40),)),

                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(tacToe2.board[8]==" "){
                                tacToe2.makeMove(8);
                                setState(() {

                                });
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width/6,
                              height: MediaQuery.of(context).size.height/7,
                              decoration: BoxDecoration(
                                //   color: cc, // رنگ پس‌زمینه
                                border: Border.all(
                                  color: Colors.black, // رنگ حاشیه
                                  width: 2, // عرض حاشیه
                                ),
                                borderRadius: BorderRadius.circular(3), // اگر می‌خواهید حاشیه‌ها گرد باشند
                              ),
                              child:  Center(child: Text(tacToe2.board[8],style:const TextStyle(fontSize: 40),)),

                            ),
                          ),
                        ],
                      ),
                    ],),
                  const SizedBox(height: 30,),




                ]
            ),
          ],
        ),
        floatingActionButton: ElevatedButton(onPressed: (){
          tacToe2.resetGame();
          setState(() {

          });
        },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber, // رنگ پس‌زمینه دکمه
            ),
            child: const Text("ریست")),

      );
    }



  }
}
