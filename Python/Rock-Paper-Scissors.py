from random import choice, randint, random


options = {
    #format: beats - beatenby
    "rock": ["scissors", "paper"],
    "paper": ["rock", "scissors"],
    "scissors": ["paper", "rock"]
}

def inputPlayer():
    player = input("Rock, Paper, Scissors?")
    if not (options[player.lower()]):
        return inputPlayer()
    return player;

computer = choice(list(options))
player = inputPlayer().lower()

if options[player][0] == computer:
    print("You beat the computer!")
elif options[player][1] == computer:
    print("You got beaten by the computer! Better luck next time!")
else:
    print("Tie!")