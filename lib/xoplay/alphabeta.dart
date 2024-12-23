import 'dart:math';

class TicTacToe {
  List<String> board = List.filled(9, " ");
  String currentPlayer = "X";
  String winner = "no winner yet";
  int alpha = -1000;
  int beta = 1000;

  void makeMove(int index) {
    if (board[index] == " ") {
      board[index] = currentPlayer;
      if (checkWinner()) {
        print("Player $currentPlayer wins!");
        winner=currentPlayer;
      } else if (!board.contains(" ")) {
        print("It's a draw!");
        winner="draw";
      } else {
        currentPlayer = currentPlayer == "X" ? "O" : "X";
        if (currentPlayer == "O") {
          aiMove();
        }
      }
    }
  }

  void aiMove() {
    int bestMove = minimaxDecision();
    makeMove(bestMove);
  }

  int minimaxDecision() {
    int bestValue = -1000;
    int bestMove = -1;


    for (int i = 0; i < 9; i++) {
      if (board[i] == " ") {
        board[i] = "O"; // AI is O
        int moveValue = minValue(alpha, beta);
        board[i] = " "; // Undo move
        if (moveValue >= bestValue) {
          bestValue = moveValue;
          bestMove = i;
        }
      }
    }
    return bestMove;
  }


  int maxValue(int alpha, int beta) {
    if (terminalTest()) return utility();
    int v = -1000;

    for (int i = 0; i < 9; i++) {
      if (board[i] == " ") {
        board[i] = "X"; // Player is X
        v = max(v, minValue(alpha, beta));
        board[i] = " "; // Undo move
        if (v >= beta) return v; // Beta cut-off
        alpha = max(alpha, v);
      }
    }
    return v;
  }

  int minValue(int alpha, int beta) {
    if (terminalTest()) return utility();
    int v = 1000;

    for (int i = 0; i < 9; i++) {
      if (board[i] == " ") {
        board[i] = "O"; // AI is O
        v = min(v, maxValue(alpha, beta));
        board[i] = " "; // Undo move
        if (v <= alpha) return v; // Alpha cut-off
        beta = min(beta, v);
      }
    }
    return v;
  }


  bool terminalTest() {
    return checkWinner() || !board.contains(" ");
  }

  int utility() {
    print("sss");
    if (checkWinner()) {

      return currentPlayer == "O" ? -1 : 1; // AI loses or wins
    }
    return 0; // Draw
  }

  bool checkWinner() {
    List<List<int>> winningCombinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ];

    for (var combo in winningCombinations) {
      if (board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && board[combo[0]] != " ") {
        return true;
      }
    }
    return false;
  }

  void resetGame() {
    board = List.filled(9, " ");
    currentPlayer = "X";
    winner = "no winner yet";
     alpha = -1000;
     beta = 1000;
  }


}





class TicTacToe2 {
  List<String> board = List.filled(9, " ");
  String currentPlayer = "X";
  String winner = "no winner yet";
  int maxDepth = 2; // حداکثر عمق جستجو

  void makeMove(int index) {
    if (board[index] == " ") {
      board[index] = currentPlayer;
      if (checkWinner()) {
        print("Player $currentPlayer wins!");
        winner = currentPlayer;
      } else if (!board.contains(" ")) {
        print("It's a draw!");
        winner = "draw";
      } else {
        currentPlayer = currentPlayer == "X" ? "O" : "X";
        if (currentPlayer == "O") {
          aiMove();
        }
      }
    }
  }

  void aiMove() {
    int bestMove = minimaxDecision(0);
    makeMove(bestMove);
  }

  int minimaxDecision(int depth) {
    int bestValue = -1000;
    int bestMove = -1;

    for (int i = 0; i < 9; i++) {
      if (board[i] == " ") {
        board[i] = "O"; // AI is O
        int moveValue = minValue(depth + 1, -1000, 1000);
        board[i] = " "; // Undo move
        if (moveValue > bestValue) {
          bestValue = moveValue;
          bestMove = i;
        }
      }
    }
    return bestMove;
  }

  int maxValue(int depth, int alpha, int beta) {
    if (terminalTest() || depth >= maxDepth) return evaluateBoard();
    int v = -1000;

    for (int i = 0; i < 9; i++) {
      if (board[i] == " ") {
        board[i] = "X"; // Player is X
        v = max(v, minValue(depth + 1, alpha, beta));
        board[i] = " "; // Undo move
        if (v >= beta) return v; // Beta cut-off
        alpha = max(alpha, v);
      }
    }
    return v;
  }

  int minValue(int depth, int alpha, int beta) {
    if (terminalTest() || depth >= maxDepth) return evaluateBoard();
    int v = 1000;

    for (int i = 0; i < 9; i++) {
      if (board[i] == " ") {
        board[i] = "O"; // AI is O
        v = min(v, maxValue(depth + 1, alpha, beta));
        board[i] = " "; // Undo move
        if (v <= alpha) return v; // Alpha cut-off
        beta = min(beta, v);
      }
    }
    return v;
  }

  bool terminalTest() {
    return checkWinner() || !board.contains(" ");
  }

  int evaluateBoard() {
    // تابع ارزیابی برای ارزیابی وضعیت فعلی بازی
    if (checkWinner()) {
      return currentPlayer == "O" ? -1 : 1; // AI loses or wins
    }
    return 0; // Draw
  }

  bool checkWinner() {
    List<List<int>> winningCombinations = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
      [2, 4, 6]
    ];

    for (var combo in winningCombinations) {
      if (board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && board[combo[0]] != " ") {
        return true;
      }
    }
    return false;
  }

  void resetGame() {
    board = List.filled(9, " ");
    currentPlayer = "X";
    winner = "no winner yet";
  }
  }