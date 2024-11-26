class Node {
  int x;
  int y;
  int g; // هزینه از نقطه شروع
  int h; // هزینه هیورستیک
  int f; // g + h
  Node? parent;

  Node(this.x, this.y, this.g, this.h,this.f) {
    f = g + h;
  }
}
class NodeRbfs {
  int x;
  int y;


  NodeRbfs? parent;

  NodeRbfs(this.x, this.y,);
}

class AStar{
  final  List<List<int>> maze;
  AStar({required this.maze});


  int pathcost = 0;
  int cheakednode = 1;

  Future<List<Node>> aStar( List<List<int>> heuristic, Node start, Node goal) async{
    List<Node> openList = [];
    Set<String> closedList = {};

    openList.add(start);

    while (openList.isNotEmpty) {
      // پیدا کردن گره با کمترین f
      Node? current = openList.reduce((a, b) => a.f < b.f ? a : b);
      cheakednode++;
      print("ddd22222");

      // اگر به هدف رسیدیم
      if (current.x == goal.x && current.y == goal.y) {
        List<Node> path = [];
        while (current != null) {
          path.add(current);
          current = current.parent;
        }
        pathcost=path.length;

        return path.reversed.toList(); // برگرداندن مسیر از شروع به پایان
      }


      openList.remove(current);
      closedList.add('${current.x},${current.y}');

      // بررسی همسایگان
      List<List<int>> directions = [
        [0, 1],  // راست
        [1, 0],  // پایین
        [0, -1], // چپ
        [-1, 0]  // بالا
      ];

      for (var direction in directions) {
        int newX = current.x + direction[0];
        int newY = current.y + direction[1];

        // بررسی مرزها و موانع
        if (newX < 0 || newX >= maze.length || newY < 0 || newY >= maze[0].length || maze[newX][newY] == 0) {
          continue; // اگر خارج از مرز یا مانع باشد، ادامه بده
        }

        Node neighbor = Node(newX, newY, current.g + 1, heuristic[newX][newY],0);
        neighbor.parent = current;

        if (closedList.contains('${neighbor.x},${neighbor.y}')) {
          continue; // اگر در لیست بسته است، ادامه بده
        }

        // اگر در لیست باز نیست، اضافه کن
        if (!openList.any((node) => node.x == neighbor.x && node.y == neighbor.y)) {
          openList.add(neighbor);
        } else {
          // اگر در لیست باز است، بررسی هزینه
          Node existingNode = openList.firstWhere((node) => node.x == neighbor.x && node.y == neighbor.y);
          if (neighbor.g < existingNode.g) {
            existingNode.g = neighbor.g;
            existingNode.f = existingNode.g + existingNode.h;
            existingNode.parent = current;
          }
        }
      }
    }

    return []; // اگر مسیری پیدا نشد
  }



}

class Rbfs{
  final  List<List<int>> maze;
  Rbfs({required this.maze});


  int pathcost = 0;
  int cheakednode = 1;

  List<NodeRbfs> bestFirstSearchRecursive(NodeRbfs current, NodeRbfs goal, List<List<int>> heuristic, Set<String> visited) {
    // اگر به هدف رسیدیم
    if (current.x == goal.x && current.y == goal.y) {
      return [current];
    }
    cheakednode++;
    visited.add('${current.x},${current.y}');

    // لیست برای ذخیره همسایگان
    List<NodeRbfs> neighbors = [];

    // بررسی همسایگان
    List<List<int>> directions = [
      [0, 1],  // راست
      [1, 0],  // پایین
      [0, -1], // چپ
      [-1, 0]  // بالا
    ];

    for (var direction in directions) {
      int newX = current.x + direction[0];
      int newY = current.y + direction[1];

      // بررسی مرزها و موانع
      if (isValidMove(maze, newX, newY) && !visited.contains('$newX,$newY')) {
        neighbors.add(NodeRbfs(newX, newY)..parent = current);
      }
    }



    // مرتب‌سازی همسایگان بر اساس هزینه هیورستیک
    neighbors.sort((a, b) => heuristic[a.x][a.y].compareTo(heuristic[b.x][b.y]));

    // جستجو در همسایگان
    for (var neighbor in neighbors) {
      List<NodeRbfs> path = bestFirstSearchRecursive( neighbor, goal, heuristic, visited);
      if (path.isNotEmpty) {
        pathcost=path.length+1;
        return [current] + path; // مسیر پیدا شده
      }
    }

    return []; // اگر مسیری پیدا نشد
  }
  bool isValidMove(List<List<int>> maze, int x, int y) {
    return x >= 0 && x < maze.length && y >= 0 && y < maze[0].length && maze[x][y] == 1;
  }

}

class H1 {
  final  int mazer;
  final  int mazes;
  H1({required this.mazer,required this.mazes});


  List<List<int>> doh1(){

    List<List<int>> temp = List.generate(mazer, (i) => List.filled(mazes, 0));


    for(int i = 0; i < mazer; i++) { // پیمایش سطرها
      for (int j = 0; j < mazes; j++) {

        temp [i][j]= h1point(i,j);
      }
    }
    return temp;
  }

int h1point(int x , int y){
  return (mazer-x)+(mazes-y);
}


}
