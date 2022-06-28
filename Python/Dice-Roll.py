from random import randint


def getRandNum():
    return randint(0,6)

def rollDice():
    userinput = input("Would you like to roll the dice? Y/N:")
    if userinput.lower() == "y":
        print("You roled a",getRandNum())
        reRollDice()

def reRollDice():
    userinput = input("Would you like to roll the dice again? Y/N:")
    if userinput.lower() == "y":
        print("You rolled a",getRandNum())
        reRollDice();

rollDice();