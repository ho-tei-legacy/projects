# may aswell use an API to get the list of some words but uh hardcoding works too
from random import choice
from tracemalloc import start
# versuche: 10
# nach user input gucken ob mehr als 1 zeichen gegeben ist nochmal neu input anfragen
# falls zeichen in dem string vorhanden ist, bei hiddenSelectedWord die/das zeichen aufdecken und neu ausgeben
def hideWord(s):
    return "_"*(len(s)+1)



def startInput():
    userinput = input("Guess a character: ")
    if len(userinput) > 1:
        print("Please only input one character at a time!")
        startInput()
    return userinput;

words = {"hangman", "father", "pet", "lover", "michael"}
    
attempts = 10
computer = choice(list(words));
hiddenSelectedWord = hideWord(computer)

if computer.find(startInput()):
    print("Good job! You guessed a character correctly")