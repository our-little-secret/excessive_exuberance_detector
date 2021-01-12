# Excessive Exuberance Detector
The KGB's premiere overly positive review detection application 😉

Detecting excessive exuberance since 2021™️

## Running Application & Tests
__Prerequisites__
To run the app and tests you'll need: `Erlang/OTP 23` & `Elixir 1.11.3`

### Running App
From within the project folder just type: `./excessive_exuberance_detector` and
within a short time you should see output in the console. This is an executable.

### Running Tests
Again assuming that you have `Erlang/OTP 23` & `Elixir 1.11.3` installed you should just
be able to, again from within the project folder, type: `mix test` (any other
missing dependencies you should just be prompted to hit `Y` to install)

## Criteria for determining "overly positive" reviews
### Summary
Each review is scored using a modified sentiment analysis process using the
AIFF-165 word list to determine a valence score.

### How it is modified
Out of the box the sentiment analysis library used does not take into account
review length.

In an attempt to account for reviews of longer length typically
being rated higher I take the total valence score for each review and divide it
by the number of words in the review ending up with an average per word
positivity score.

The thinking being that a shorter message with a higher
average positivity score is more overly positive than a longer message with a
lower average.

### Things I would have done with more time
I ran out of time but given more I would have...
1. Fix the typespecs in `ExuberanceRater`. You might notice they are commented
out. I don't normally leave commented code in but in this case I thought it
important to show the work.
1. Add a number of Property Based tests to feed thousands of different string
combinations through the system and reveal any issues like the ones I ended up
fixing in the course of my own QA.
