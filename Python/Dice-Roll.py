from random import randint


def getRandNum():
    return randint(0,6)

def rollDice(reroll):
    defaultMsg = "" if reroll else "Would you like to roll the dice? Y/N: \n"
    userinput = input(defaultMsg)
    if userinput.lower() == "y":
        print("You roled a",getRandNum())
        print("Would you like to reroll the dice? Y/N:")
        rollDice(True)

rollDice(False);