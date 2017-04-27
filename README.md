### Text Analysis
# Example 1: Word Particles

Kind of a simple idea, take a text file, analyse it for unique words and their frequency and output the data in some unique way. In the end I decided to treat each unique word as a particle which can reflect off the 4 edges (walls) of the screen. These have a constant (slow) velocity and have a radius (text size) that is based off their frequency in the text file.

# How to use?
**Place your chosen text file (must be .txt) in the same directory as the processing sketch and ensure it has the name _"dataset.txt"_**.

The program theoretically works with any text file, however, depending on the size of the file you throw at it, results may vary.
To better optimise your program (if it doesn't seem to be working well), this is the line of code you need to alter: 
```java
float s = map(words.get(k), 0, 2000, 5, 120);
```
The number 2000 refers to the maximum frequency of a word you expect to see, however, in practice this should be about half or lower as words like _'and'_ will dominate otherwise.

Once running, you can search for particular words in the dataset by typing the word. All words which match your typed string will be outlined in orange and their reletive frequencies in red. To reset what you have typed, simply press _**SPACE**_.
Hovering over words will make them larger and easier to read.

**NOTE: the program is often very slow for larger datasets as it is essentially performing calculations on thousonds of unique particles.**

# Example

Currently in the repo, is the program working with a dataset which contains a few of Donald Trump's speeches (images below).

![alt text](http://i.imgur.com/GB9f5mK.jpg "Chaos in Donald Trump Speeches")
![alt text](http://i.imgur.com/A9tdQzP.jpg "Searching for 'Mexico'")
