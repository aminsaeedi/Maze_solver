


import 'grph.dart';


class Cps{
  Graph2 graph;
  Cps(this.graph,);

  List<String> colors=["blue","green","red","white"];
  Map<String, String> assignment={};


  bool isSafe(String ostan, String color) {
    for (var neighbor in graph.getNeighbors(ostan)) {
      if (assignment[neighbor] == color) {
        return false;
      }
    }
    return true;
  }


  String mRV() {
    String? selectedOstan;
    int minRemainingValues = colors.length + 1; // مقدار بزرگتر از حداکثر

    for (var ostan in graph.getVertices()) {
      if (!assignment.containsKey(ostan)) {
        int remainingValues = 0;

        for (var color in colors) {
          if (isSafe(ostan, color,)) {
            remainingValues++;
          }
        }

        if (remainingValues < minRemainingValues) {
          minRemainingValues = remainingValues;
          selectedOstan = ostan;
        }
      }
    }

    return selectedOstan!;
  }
  String sNVBD( ) {
    String? selectedOstan;
    int maxDegree = -1; // مقدار اولیه برای درجه

    for (var ostan in graph.getVertices()) {
      if (!assignment.containsKey(ostan)) {
        int degree = graph.getNeighbors(ostan).length; // محاسبه درجه

        if (degree > maxDegree) {
          maxDegree = degree;
          selectedOstan = ostan;
        }
      }
    }

    return selectedOstan!;
  }
  List<String> lCV(String ostan) {
    Map<String, int> colorConstraints = {};

    for (var color in colors) {
      // برای هر رنگ، تعداد گزینه‌های مجاز برای همسایه‌ها را محاسبه می‌کنیم
      int constraints = 0;

      for (var neighbor in graph.getNeighbors(ostan)) {
        if (!assignment.containsKey(ostan)) {
          List<String> temp = graph.getDamane(neighbor);
          temp.remove(color);
          constraints = constraints + temp.length;
        }
      }

      colorConstraints[color] = constraints;
    }


    var sortedColors = colorConstraints.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));


    return sortedColors.map((entry) => entry.key).toList(); // مرتب‌سازی بر اساس تعداد محدودیت‌ها
  }


  bool ac3() {
    List<List<String>> queue = [];

    // ایجاد صف از تمام کمان‌ها (آرک‌ها)
    for (var ostan in graph.getVertices()) {
      for (var neighbor in graph.getNeighbors(ostan)) {
        queue.add([ostan, neighbor]);
      }
    }

    while (queue.isNotEmpty) {
      var arc = queue.removeAt(0);
      var xi = arc[0];
      var xj = arc[1];

      if (removeInconsistentValues( xi, xj)) {
        for (var xk in graph.getNeighbors(xi)) {
          queue.add([xk, xi]);
        }
      }
    }

    return true; // می‌توانید این را بر اساس نیاز خود تغییر دهید
  }

  bool removeInconsistentValues( String xi, String xj) {
    bool removed = false;

    // برای هر رنگ x در دامنه Xi
    for (var x in List.from(graph.getDamane(xi))) {
      bool hasValidValue = false;

      // بررسی می‌کنیم که آیا هیچ مقدار y در دامنه Xj وجود دارد که (x, y) را معتبر کند
      for (var y in graph.getDamane(xj)) {
        if (isSafe2(xi, x, xj, y, graph)) {
          hasValidValue = true;
          break;
        }
      }

      // اگر هیچ مقدار y وجود نداشته باشد، مقدار x را از دامنه حذف می‌کنیم
      if (!hasValidValue) {
        graph.removeDamane(xi, x);
        removed = true;
      }
    }

    return removed;
  }

  bool isSafe2(String ostan, String color, String neighbor, String neighborColor, Graph2 graph) {
    // بررسی می‌کنیم که آیا رنگ انتخاب شده برای ostan با رنگ همسایه سازگار است
    // در اینجا می‌توانید قوانین سازگاری خود را تعریف کنید
    return color != neighborColor; // به عنوان مثال، رنگ‌ها نباید یکسان باشند
  }

  bool backtrackColoring( int h) {
    if (assignment.length == graph.getVertices().length) {
      return true; // همه شهرها رنگ شده‌اند
    }
    var unassigned = "";
    if(h==0){
      print("mrv");
      unassigned =mRV();

    }
    else if(h==1){
      print("dh");
      unassigned = sNVBD();
    }
    else if(h==2){
      print("lcv");
      unassigned = sNVBD();

      List  tempcolors = lCV(unassigned);

      for (var color in tempcolors) {
        if (isSafe(unassigned, color,  )) {
          assignment[unassigned] = color; // رنگ کردن شهر

          var ny = graph.getNeighbors(unassigned);
          for(var n in ny){
            graph.removeDamane(n, color);}
          if (backtrackColoring(h)) {
            return true; // اگر موفقیت‌آمیز بود
          }


          assignment.remove(unassigned); // بازگشت

        }
      }
      return false;

    }
    else if(h==3){
      print("kaman");
      unassigned = mRV();
      for (var color in colors) {
        if (isSafe(unassigned, color,  )) {
          assignment[unassigned] = color;
          // بررسی سازگاری کمان
          if (ac3()) {
            if (backtrackColoring(3)) {
              return true; // اگر موفقیت‌آمیز بود
            }
          }


          assignment.remove(unassigned); // بازگشت
        }
      }
      return false; // اگر هیچ رنگی مناسب نبود
    }

    else{
      unassigned = graph.getVertices().firstWhere((ostan) => !assignment.containsKey(ostan));
    }

    for (var color in colors) {
      if (isSafe(unassigned, color,  )) {
        assignment[unassigned] = color; // رنگ کردن شهر

        if (backtrackColoring(h)) {
          return true; // اگر موفقیت‌آمیز بود
        }

        assignment.remove(unassigned); // بازگشت
      }
    }
    return false; // اگر هیچ رنگی مناسب نبود
  }




}







