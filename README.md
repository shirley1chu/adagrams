# Adagrams

## At a Glance
- Pair, [stage 2](https://github.com/Ada-Developers-Academy/pedagogy/blob/master/rule-of-three.md#stage-2) project
- Due by End of Day, Friday Februaray 25th

## Introduction

An [anagram](https://en.wikipedia.org/wiki/Anagram) is a word or phrase formed by rearranging the letters of a different word or phrase. _Adagrams_ is a fictional game in which a player is given a random set of letters and must make an anagram using those letters. _Adagrams_ has a specific scoring system, so that the player's submitted anagram scores points. The rules for Adagrams are roughly inspired by the "Letter Round" portion of the British game show [Countdown](https://en.wikipedia.org/wiki/Countdown_%28game_show%29%23Letters_round).

While working on _Adagrams_, it may help to think of a physical metaphor for this game, such as other common word games like _Scrabble_ or _Bananagrams_. These analog games all feature a _pool_ of letter _tiles_ that the player _draws_ from.

In this version of _Adagrams_, we will only be working with the English alphabet.

![an image of a pile of letter tiles](assets/letter-tiles.jpg)

## Learning Goals

- Write Ruby code with methods that declare data, read data, and manipulate data
- Write Ruby code with methods that take in parameters, use parameters, and return manipulated data
- Use pair-programming techniques
- Instill the habit of running unit tests to verify that the program works as expected

## Objective

We will make a Ruby implementation of _Adagrams_ that runs [in the command line](https://en.wikipedia.org/wiki/Command-line_interface).

The program should also pass the provided unit tests.

## Getting Started

* From the project root, you are able to execute all of your specs by running `rake` in Terminal

<details>
<summary>For the curious about `rake`, click here</summary>

`rake` [(official site)](https://github.com/ruby/rake) is a program that runs tasks that we define. In this case, we have a pre-defined task that executes the tests. By running `rake`, we are saying something like, "Please run the tasks, which includes the task that executes the tests."
</details>

### Tests
We have provided unit tests for you to run. A complete project will pass all provided tests.

To run the tests, in the command line, navigate to the project root and then run the command `$ rake` (without the `$`. Remember, `$` indicates that it is a command line command.)

When you first open the project and run the tests with `rake`, you should have 0 passing tests and 16 failures. You should see something similar to the following screenshots:

![failing tests error stack trace that reads "no method defined"](assets/failing-tests-error.png)
![failing tests error reading "16 failures"](assets/failing-tests-screenshot.png)

What do these errors mean? These errors should help guide you with the next step to completing the project.

The tests for this project are written in [minitest](https://github.com/seattlerb/minitest), a testing framework by Seattle Ruby Brigade.

Do not move onto a new wave of requirements until the minimum requirements of the previous wave are complete and your specs are green across the board.

Here is what it looks like when all 16 tests are passing:
![all 16 tests are passing message](assets/passing-tests-screenshot.png)

### Pair Programming
Utilize good pair programming practices. Refer to articles from the [Agile Alliance](http://guide.agilealliance.org/guide/pairing.html), the [Agile Institute](http://powersoftwo.agileinstitute.com/2015/02/benefits-of-pair-programming-revisited.html), and [our own suggestions for pairing](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/00-programming-fundamentals/programming-techniques-pairs-or-solo.md#pair-programming) if you need a refresher for some best practices. Switch _driver_ and _navigator_ roles often. When there is uncertainty or confusion, step away from the keyboard and discuss, plan, and document on paper or whiteboard before continuing.

### Driver Code
We have provided some driver code for your Adagrams game in the files `wave-1-game.rb`, `wave-2-game.rb`, `wave-3-game.rb`, and `wave-4-game.rb`. Running `$ ruby wave-1-game.rb` will begin a command-line game that uses your Adagrams code. The boilerplate code will break the first time you run it: working through the waves specified below should create a running version of the game. **Implementing code to make this game run is not a substitute for making the tests pass**. It is simply there for you and your pair to reference how the Game may run during each wave, to have better perspective of what your program can do, and to get some practice reading other peoples' code. We fully expect you to create the specified methods to specification and making the tests pass.

## Setup Requirements
### Setup For Collaboration
1. You'll be working with an assigned pair. High-five your pair.
1. Choose **one person** to fork the project repo.
1. Add the other person in the pair (who didn't fork) to the forked repo as a _collaborator_. Instructions [here](https://help.github.com/articles/inviting-collaborators-to-a-personal-repository/).
1. Pick one machine to work on for the first few days.
1. That machine will clone the forked repo: `$ git clone [YOUR FORKED REPO URL]`
1. `cd` into the dir created.

**Note:** At this point, we have to work off of one machine, and if we need to share code with each other, we need to do something awkward, unreliable, and slow, like email files of code to each other. Later this week, we'll learn how to get the code onto both machines and collaborate simultaneously using Git.

### Setup a Pair Plan

First, come up with a "plan of action" for how you want to work as a pair. Discuss your learning style, how you prefer to receive feedback, and one team communication skill you want to improve with this experience.

### Get Familiar

Take time to read through the Wave 1 implementation requirements and the tests for wave 1. Write down your questions, and spend some time going through your understanding of the requirements and tests with your pair. Make sure you both can run `$ rake` and see the tests fail.

Come up with a "plan of action" for your implementation with your pair.

If, after you and your pair have taken some time to think through the problem and would like direction for how to dissect the problem, or if you need clarity on the terms/vocabulary we used in this project, you can check out [a small hint we've provided](hints.md).

## Implementation Requirements

### Wave 1

Our first job is to build a hand of 10 letters for the user. To do so, add a method called `draw_letters` in `adagrams.rb`. This method should have the following properties:

- No parameters
- Returns an array of ten strings
  - Each string should contain exactly one letter
  - These represent the hand of letters that the player has drawn
- The letters should be randomly drawn from a pool of letters
  - This letter pool should reflect the distribution of letters as described in the table below
  - There are only 2 available `C` letters, so `draw_letters` cannot ever return more than 2 `C`s
  - Since there are 12 `E`s but only 1 `Z`, it should be 12 times as likely for the user to draw an `E` as a `Z`
- Invoking this method should **not** change the pool of letters
  - Imagine that the user returns their hand to the pool before drawing new letters

#### Distribution of Letters

| Letter : Qty. | Letter : Qty. |
|:------:|:-----:|
| A : 9  | N : 6 |
| B : 2  | O : 8 |
| C : 2  | P : 2 |
| D : 4  | Q : 1 |
| E : 12 | R : 6 |
| F : 2  | S : 4 |
| G : 3  | T : 6 |
| H : 2  | U : 4 |
| I : 9  | V : 2 |
| J : 1  | W : 2 |
| K : 1  | X : 1 |
| L : 4  | Y : 2 |
| M : 2  | Z : 1 |

**Note:** Making sure that the drawn letters match the rules of the letter pool can be straightforward or very difficult, depending on how you build the data structure for the letter pool. It is worth spending some time with your partner to think carefully about this.


### Wave 2

Next, we need a way to check if an input word (a word a player submits) only uses characters that are contained within a collection (or hand) of drawn letters. Essentially, we need a way to check if the word is, indeed, an anagram of some or all of the given letters in the hand.

To do so, add a method called `uses_available_letters?` in `adagrams.rb`. This method should have the following properties:

- Has two parameters:
   - `input`, the first parameter, describes some input word, and is a string
   - `letters_in_hand`, the second parameter, describes an array of drawn letters in a hand. You can expect this to be an array of ten strings, with each string representing a letter
- Returns either `true` or `false`
- Returns `true` if every letter in the `input` word is available (in the right quantities) in the `letters_in_hand`
- Returns `false` if not; if there is a letter in `input` that is not present in the `letters_in_hand` or has too much of compared to the `letters_in_hand`

### Wave 3

We want a method that returns the score of a given word as defined by the Adagrams game.

Name this method `score_word` in `adagrams.rb`. This method should have the following properties:

- Has one parameter: `word`, which is a string of characters
- Returns an integer representing the number of points
- Each letter within `word` has a point value. The number of points of each letter is summed up to represent the total score of `word`
- Each letter's point value is described in the table below
- If the length of the word is 7, 8, 9, or 10, then the word gets an additional 8 points

#### Score chart

|Letter                        | Value|
|:----------------------------:|:----:|
|A, E, I, O, U, L, N, R, S, T  |   1  |
|D, G                          |   2  |
|B, C, M, P                    |   3  |
|F, H, V, W, Y                 |   4  |
|K                             |   5  |
|J, X                          |   8  |
|Q, Z                          |   10 |

### Wave 4

After several hands have been drawn, words have been submitted, checked, scored, and played, we want a way to find the highest scoring word. This method looks at the array of `words` and calculates which of these words has the highest score, applies any tie-breaking logic, and returns the winning word in a special data structure.

Add a method called `highest_score_from words` in `adagrams.rb`. This method should have the following properties:

- Has one parameter: `words`, which is an array of strings
- Returns a single hash that represents the data of a winning word and its score. The hash should have the following keys:
  - `:word`, whose value is a string of a word
  - `:score`, whose value is the score of that word
- In the case of tie in scores, use these tie-breaking rules:
    - prefer the word with the fewest letters...
    - ...unless one word has 10 letters. If the top score is tied between multiple words and one is 10 letters long, choose the one with 10 letters over the one with fewer tiles
    - If the there are multiple words that are the same score and the same length, pick the first one in the supplied list

### Optional: Wave 5

We want to be able to verify that a word that a player submits is a valid word against the English dictionary.

We have the English dictionary available as a CSV file. We want to write a method that checks an input word against the words listed in the CSV file. If the word is found in the CSV file, then the word is valid and can be played.

Add a method called `is_in_english_dict?` in `adagrams.rb`. This method should have the following properties:

- Has one parameter: `input`, which is a string
- Returns a boolean
  - `true`, if `input` is in the provided English dictionary
  - `false`, if `input` is not in the provided English dictionary
- Uses the English dictionary found in `assets/dictionary-english.csv`

There are no unit tests provided for this wave, but there is driver code found in `wave-5-game.rb`. Feel free to alter `specs/adagrams_sepc.rb` and add some!

Nota Bene: The original data for all of the alpha words of the English dictionary was found freely available at [`dwyl/english-word`'s repo](https://github.com/dwyl/english-words), and was modified to only include words under 10 characters.


## What Instructors Are Looking For
Check out the [feedback template](feedback.md) which lists the items instructors will be looking for as they evaluate your project.
