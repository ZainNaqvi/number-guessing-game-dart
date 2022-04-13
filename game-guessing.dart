// *********************************************************************
// ________________________________________________________________________

//  ***********************WORD GUESSING GAME*****************
// ________________________________________________________________________

// ************************************************************************

import 'dart:io';
import 'dart:math';

// print statements colors for the terminal in dart cyan blue color
void printTitle(String text) {
  print('\x1B[34m$text');
}

// print statements colors for the terminal in dart cyan yellow color
void printWarning(String text) {
  print('\x1B[33m$text\x1B[0m');
}

// print statements colors for the terminal in dart cyan red color
void printError(String text) {
  print('\x1B[31m$text\x1B[0m');
}

// print statements colors for the terminal in dart green red color
void printBlue(String text) {
  print('\x1B[34m$text\x1B[0m');
}

// print statements colors for the terminal in dart green red color
void printReset(String text) {
  print('\x1B[36m$text\x1B[0m');
}

// using the score variable as the global scope here...
double score = 0;
void main() {
  String name = InputCreaditials();

  // display the starter of the game
  String choice = "YES";
  Display();
  do {
    // displaying the rules here...
    printWarning("\nWould you like to play again ");
    printBlue("YES / NO");
    choice = stdin.readLineSync()!.toUpperCase();
    if (choice == "NO") {
      break;
    }
    int guessNumber = GuessNumber();
    print("Enter the correct Number for score");
    HintNumbers(guessNumber);
    printError("Enter the guess number");
    printWarning("FOR HINT TYPE YES / NO");
    String isHint = stdin.readLineSync()!.toUpperCase();
    if (isHint == "YES") {
      userWantsHint(guessNumber);

      printError("Your score $score");
    }
    printWarning("User Guess here...");
    int userGuessNumber = int.parse(stdin.readLineSync()!);
    // Definning the functionality of the score in game...
    int correct = CorrectCounter(guessNumber, userGuessNumber);
    score = score + correct;
    if (correct == 1) {
      printBlue("Correct Guess😅");
      printWarning("Your score: $score");
    } else {
      printError("Wrong Guess😲");
    }
  } while (choice != "NO");
  printError("$name YOUR SCORE IS $score🤍");
  printError(
      "************************************************************************");
  printReset(
      "_________________________________________________________________________");
  printWarning("THANK YOU SO MUCH FOR PLAYING THIS GAME");
  printError("DESIGNED & DEVELOPED BY RAZA");
}

// if user wants the hints in the game
// Hint function
userWantsHint(int guessNumber) {
  printError("Note: Your score -1 if u are using the hint");
  printBlue("Menu");
  printTitle("1: HINT THAT NUMBER IS GREATER THAN SOMETHING *-1*");
  printTitle("2: HINT THAT NUMBER IS SMALLER THAN SOMETHING *-1*");
  printTitle("3: HINT THAT NUMBER IS BETWEEN SOME RANGE *-5*");
  printTitle("4: HINT THAT NUMBER IS EVEN OR NOT *-5*");
  printTitle("5: FOR QUIT *-0*");
  int userChoice = int.parse(stdin.readLineSync()!);
  switch (userChoice) {
    case 1:
      printReset("The number is greater than ${guessNumber - 13}");
      score = score - 1;
      break;
    case 2:
      printReset("The number is smaller than ${guessNumber + 3}");
      score = score - 1;
      break;
    case 3:
      printReset(
          "The number is in between ${guessNumber - 23} and  ${guessNumber + 13}");
      score = score - 0.5;
      break;
    case 4:
      if (guessNumber % 2 == 0) {
        printReset("The number is Even");
        score = score - 0.5;
      } else {
        printReset("The number is Not Even");
        score = score - 0.5;
      }
      break;
    case 5:
      printBlue("Thank You for visiting the Hint Menu");
      score = score - 0;
      break;
    default:
  }
}

// randomly generated numbers here...
HintNumbers(int num) {
  Random random = new Random();
  // int randomNumber = random.nextInt(100);
  // int randomNumber2 = random.nextInt(100);
  // int randomNumber3 = random.nextInt(100);
  var list = [];

  for (var i = 1; i < 4; i++) {
    int randomNumber4 = random.nextInt(100);
    list.add(randomNumber4);
  }
  list.add(num);
  print(list..sort());
}

// Generating the random number here....
GuessNumber() {
  Random random = new Random();
  int randomNumber = random.nextInt(100);
  return randomNumber;
}

// CorrectCounter function counts the correct answers of the user and incre... by 1
int CorrectCounter(int guessNum, int userNum) {
  if (userNum == guessNum) {
    return 1;
  } else {
    return 0;
  }
}

// get the user information => name
String InputCreaditials() {
  print('\x1B[94m' + "hahAHaHA!!!" + '\x1B[0m');
  printBlue("________________________");
  print('\x1B[94m' + "ENTER YOUR NAME HERE!!!⚫" + '\x1B[0m');

  String name = stdin.readLineSync()!.toUpperCase();
  return name;
}

// Display function for displaying the rules and regulation of the game below
Display() {
  TitleMenuLoop();
  printTitle(
      "\n\n\t\t\t\t\t********************** NUMBER SEARCHING PUZZLE GAME ************************");
  printWarning(
      "\n\t\t\t\t\tA PUZZLE of NUMBERS is shown on screen . You have to guess a hidden correct \n\t\t\t\t\rNUMBER form the puzzle . For each correct guessing you will get one score.");
  TitleMenuLoop();
}

// border loop for the designing ....
TitleMenuLoop() {
  for (var i = 0; i < 170; i++) {
    stdout.write("_");
  }
  print("");

  for (var i = 0; i < 170; i++) {
    stdout.write("*");
  }
}
