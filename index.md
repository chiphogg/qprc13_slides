---
title       : 
subtitle    : 
author      : Charles Hogg
job         : Google, Inc.
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]     # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}




---

# Overview

The basic story is this.

We've got a metal plate, and we stretch it.  So there's some amount of strain at
every point on this surface.  We've measured this strain function at a bunch of
points, but we wish we knew it everywhere.  We wish we knew this _strain
surface_, if you like.  We have some idea about it, but we're not completely
certain.

So, first question: how uncertain _are_ we?  You see we'll need a sensible way
to _quantify_ uncertainty in _continuous functions_.

---

# Quantifying uncertainty

Great narrative for great justice!

1. What we wish we had
  - _Individual_ random quantities (like rolls of a die) are easier to understand
  - Show a bunch of random draws of functions.  ("WAT.")
    - Here, the probabilities don't matter; what matters are the functions in the distribution.
2. Simpler case: two random numbers.
  - Show on scatterplot.
    - Familiar, and great, visualization!  But it **doesn't scale**.
3. Simpler case; alternative view
  - Show side-by-side with scatterplot: random variables next to each other
    - Connect them by lines... hmm!  Suggestive!!
4. Lots of variables
5. Return to scatterplot view
  - nice animated gif

Maybe then talk about GPs: use the simplest multivariate probability distribution.

---

## Probability example: rolling dice







<img src="custom/dice.gif">

---

## Two variables





![plot of chunk scatterplot.test.1](figure/scatterplot.test.1.png) 


---

## Two variables

![plot of chunk scatterplot.test.2](figure/scatterplot.test.2.png) 


---

## Two variables

![plot of chunk scatterplot.test.3](figure/scatterplot.test.3.png) 


---

## Two variables

![plot of chunk scatterplot.test.4](figure/scatterplot.test.4.png) 


Show a two-variable scatterplot.  Emphasize: the way we want to interact with this is by **taking draws**.

Also, make this an animated gif and just one slide.

---

## ...Infinity!

Show a bunch of random function draws.  Make them non-trivial, but with noticeable variation.  Hey, maybe just specify a non-trivial mean function.

---

## Covariance is Key

Animate a 2-d scatterplot as we slide between near and far points.

---

## What's the probability of a function?

---

## Another view

Gaussian process machinery:
  - There's some function you wish you knew.
  - Give the machinery some arbitrary number of points where you know the
    function (it's fine if they're noisy).
  - Ask it for the values of the function at some other set of points
    - The key is: look at those values **simultaneously**.

---

## Also worth mentioning

Gaussian processes were used by the BEST collaboration (solved problems with
time series, etc.)

---

# Reducing uncertainty

---

## 
