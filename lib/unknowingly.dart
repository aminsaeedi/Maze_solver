
import 'dart:collection';

import 'package:hoosh_pr/stack.dart';

class Point{
 final int x;
 final int y;
  Point(this.x, this.y);
}

class Avalpahana{

   final  List<List<int>> maze;
     Avalpahana({required this.maze});
     int pathcost=0;
     int cheakednode=1;
  Future<List<Point>> avalpahana()async{

    final queue = Queue<Point>();
    final visited = List.generate(maze.length, (_) => List.filled(maze[0].length, false));
    final parent = List.generate(maze.length, (_) => List.filled(maze[0].length, Point(-1, -1)));

    Point start= Point(0,0);
    Point end=Point(40,40);
    queue.add(start);
    visited[start.x][start.y] = true;

    final directions = [
      Point(0, 1),  // Right
      Point(1, 0),  // Down
      Point(0, -1), // Left
      Point(-1, 0), // Up
    ];

    while (queue.isNotEmpty) {

      cheakednode++;

      final current = queue.removeFirst();


      // Check if we reached the end point
      if (current.x == end.x && current.y == end.y) {
        List<Point> path = [];
        Point? step = current;

        // Backtrack to find the path
        while (step != null && step.x != -1 && step.y != -1) {
         pathcost++;
          path.add(step);
          step = parent[step.x][step.y];
        }
        return path.reversed.toList(); // Reverse the path to get it from start to end
      }

      for (var direction in directions) {
        final newX = current.x + direction.x;
        final newY = current.y + direction.y;

        if (isValidMove(maze, newX, newY, visited)) {
          queue.add(Point(newX, newY));
          visited[newX][newY] = true;
          parent[newX][newY] = current; // Keep track of the path
        }
      }
    }

    return [];






  }

  bool isValidMove(List<List<int>> maze, int x, int y, List<List<bool>> visited) {
       return (x >= 0 && x < maze.length && y >= 0 && y < maze[0].length &&
           maze[x][y] == 1 && !visited[x][y]);
     }




}


class Dfs{

  final  List<List<int>> maze;
  Dfs({required this.maze});
  int pathcost=0;
  int cheakednode=1;

  Future<List<Point>> dfs()async{

    final stack = Stack<Point>();
    final visited = List.generate(maze.length, (_) => List.filled(maze[0].length, false));
    final parent = List.generate(maze.length, (_) => List.filled(maze[0].length, Point(-1, -1)));

    Point start= Point(0,0);
    Point end=Point(40,40);
    stack.push(start);
    visited[start.x][start.y] = true;

    final directions = [
      Point(0, 1),  // Right
      Point(1, 0),  // Down
      Point(0, -1), // Left
      Point(-1, 0), // Up
    ];

    while (!stack.isEmpty) {

      cheakednode++;

      final current = stack.pop();


      // Check if we reached the end point
      if (current.x == end.x && current.y == end.y) {
        List<Point> path = [];
        Point? step = current;

        // Backtrack to find the path
        while (step != null && step.x != -1 && step.y != -1) {
          pathcost++;
          path.add(step);
          step = parent[step.x][step.y];
        }
        return path.reversed.toList(); // Reverse the path to get it from start to end
      }

      for (var direction in directions) {
        final newX = current.x + direction.x;
        final newY = current.y + direction.y;

        if (isValidMove(maze, newX, newY, visited)) {
          stack.push(Point(newX, newY));
          visited[newX][newY] = true;
          parent[newX][newY] = current; // Keep track of the path
        }
      }
    }

    return [];






  }
// List<Point> dfs() {
//   List<List<bool>> visited = List.generate(41, (_) => List.filled(41, false));
//   List<Point> path = [];
//   Stack<Point> stack = Stack<Point>();
//
//   // شروع از نقطه (0, 0)
//   stack.push(Point(0, 0));
//   visited[0][0] = true;
//
//   // جهت‌های حرکت (پایین، راست، بالا، چپ)
//   List<Point> directions = [
//     Point(1, 0), // پایین
//     Point(0, 1), // راست
//     Point(-1, 0), // بالا
//     Point(0, -1), // چپ
//   ];
//
//   while (!stack.isEmpty) {
//     Point current = stack.pop();
//     path.add(current);
//
//     // بررسی اگر به نقطه پایان رسیدیم
//     if (current.x == maze.length - 1 && current.y == maze[0].length - 1) {
//       return path; // مسیر پیدا شد
//     }
//
//     // بررسی همسایگان
//     int havedeep=0;
//     for (var direction in directions) {
//       int newX = current.x + direction.x;
//       int newY = current.y + direction.y;
//
//       if (isValidMove(maze, newX, newY, visited)) {
//         havedeep++;
//         stack.push(Point(newX, newY));
//         visited[newX][newY] = true;// علامت‌گذاری به عنوان بازدید شده
//       }
//     }
//
//     if(havedeep == 0){
//       path.clear();
//
//     }
//   }
//
//   return []; // اگر مسیری پیدا نشد
// }





  bool isValidMove(List<List<int>> maze, int x, int y, List<List<bool>> visited) {
    return (x >= 0 && x < maze.length && y >= 0 && y < maze[0].length &&
        maze[x][y] == 1 && !visited[x][y]);
  }

}




class Ids {

  final List<List<int>> maze;

  Ids({required this.maze});

  int pathcost = 0;
  int cheakednode = 1;
  List<Point> path = [];

  Future<bool> dfs(int cutoff)async{
    int depth=0;

    final stack = Stack<Point>();
    final visited = List.generate(maze.length, (_) => List.filled(maze[0].length, false));
    final parent = List.generate(maze.length, (_) => List.filled(maze[0].length, Point(-1, -1)));
   // Point lastsel= Point(0, 0);
    Point start= Point(0,0);
    Point end=Point(40,40);
    stack.push(start);
    visited[start.x][start.y] = true;

    final directions = [
      Point(0, 1),  // Right
      Point(1, 0),  // Down
      Point(0, -1), // Left
      Point(-1, 0), // Up
    ];

    while (!stack.isEmpty) {

      cheakednode++;

      final current = stack.pop();
    //   lastsel =current;

      // Check if we reached the end point
      if (current.x == end.x && current.y == end.y) {
        print("gggooooooolllll");
         path = [];
        Point? step = current;

        // Backtrack to find the path
        while (step != null && step.x != -1 && step.y != -1) {
          pathcost++;
          path.add(step);
          step = parent[step.x][step.y];
        }
        return true; // Reverse the path to get it from start to end
      }

      if(depth<cutoff){



      for (var direction in directions) {
        final newX = current.x + direction.x;
        final newY = current.y + direction.y;

        if (isValidMove(maze, newX, newY, visited)) {
          stack.push(Point(newX, newY));
          visited[newX][newY] = true;
          parent[newX][newY] = current; // Keep track of the path
        }
      }
      depth++;
      }

    }
  //  print("${lastsel.x},,,,,${lastsel.y}");
 //   print(depth);
    return false;






  }


  Future<List<Point>> ids()async{

    for (int depth = 0; depth < maze.length * maze[0].length; depth++) {

    path = [];
    pathcost=0;
    cheakednode=0;

      if (await dfs(depth)) {
        return path; // مسیر پیدا شد
      }
    }
    return [];


  }




  bool isValidMove(List<List<int>> maze, int x, int y, List<List<bool>> visited) {
    return (x >= 0 && x < maze.length && y >= 0 && y < maze[0].length &&
        maze[x][y] == 1 && !visited[x][y]);
  }





}

