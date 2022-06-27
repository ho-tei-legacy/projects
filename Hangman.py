# may aswell use an API to get the list of some words but uh hardcoding works too
from glob import glob
from random import choice
from tracemalloc import start
#   TODO TODO TODO TODO TODO
#   -Add option for user to add custom works (give input in beginning: Would you like to use default words or use your own?)
#   
#
#   TODO TODO TODO TODO TODO

def hideWord(s):
    return "_"*(len(s))

words = {"hangman", "father", "pet", "lover", "michael"}
useDefaultWords = None;
guessed = []
attempts = 10
computer = choice(list(words));
hiddenSelectedWord = hideWord(computer)

def indexOfAllChars(s, char):
    nums = []
    s = list(s)
    while str(s).find(char) != -1:
        i = s.index(char)
        nums.append(i)
        s[i] = ""
    
    return nums;

def startGame():
    global computer;
    global hiddenSelectedWord;
    global attempts;

    print(hiddenSelectedWord)
    userinput = input("Guess a character: ")

    if len(userinput) > 1:
        print("Please only input one character at a time!")
        startGame()


    if attempts-1 == 0:
        return print("You died! The word was:", computer)

    if computer.find(userinput) != -1:
        s = list(hiddenSelectedWord)
        for iNums in indexOfAllChars(computer, userinput):
            s[iNums] = userinput
            
        hiddenSelectedWord = "".join(s)
        print("You found a character!")
    else:
        attempts -= 1
        print("Very unfortunate, that character isn't included in the secret word. You have",attempts,"attempts left")
    guessed.append(userinput)

    if len(guessed) != 0:
        print("You already guessed following characters:", guessed)

    if hiddenSelectedWord.find("_") == -1:
        return print("Congratulations! You won the game!");
    startGame()
    
startGame()