# Ghost-Game
This repository contains the classic road trip game, Ghost, written in the Ruby programming language.

## What is it?
Ghost is a written or spokenword game in which players take turns adding letters to a growing word fragment, trying not to be the one to complete a valid word. Each fragment must be the beginning of an actual word, and usually some minimum is set on the length of a word that counts, such as three or four letters. The player who completes a word loses the round and earns a "letter" (as in the basketball game horse), with players being eliminated when they have been given all five letters of the word "ghost".

## How does it work?
For this project I created 2 main classes (Game & Player). The Game class is the where most of the action takes place. This class contains a set of words from a dictionary, prints the scoreboard, counts losses, and allows players to play a round. The Player class gets an input from the player and alerts the player if they enter an invalid character.

## How to play?
Download the 3 files and place them within the same file. Then open your Terminal (or Command Prompt) and navigate to the file with the ruby code. Once there, enter "ruby Game.rb" and play the game! Note that the player names are default values.
