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

# Probabilities for functions

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

TODO: plot this in a way which suggests individual draws.  Maybe scatterplot?
vertical axis: 2 through 12.  Horizontal axis: index.







<img src="custom/dice.gif">

---

## Random functions (?)







<img src="custom/random_functions.gif">

---

## Two variables







<img src="custom/2d_scatterplot.gif">

---

## Two variables: alternative view







<img src="custom/2_vars_side_by_side.gif">

---

## Many variables







<img src="custom/many_vars.gif">

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

# Steel strain results





<iframe src="rgl_strain-datapoints.html" width="936" height="504"></iframe>

What do I actually want to show?

  1. mean surface
  2. +- 1 sigma: show low uncertainty
  3. +- 1 sigma with actual datapoints
  4. +- 2 (or 3) sigma: no outliers?

Alternative slide: animations?  Only if I have time.

---

## Steel strain results: mean surface

<iframe src="rgl_unnamed-chunk-1.html" width="936" height="504"></iframe>


---

## Steel strain results: with 1-sigma uncertainty

<iframe src="rgl_unnamed-chunk-2.html" width="936" height="504"></iframe>


---

## Steel strain results: true datapoints

<iframe src="rgl_unnamed-chunk-3.html" width="936" height="504"></iframe>


---

# Feedback to the experiment







---

## Gap width: ripe for tuning

<object data="./inkscape/beam_1_straight.svg" type="image/svg+xml"></object>

---

## Gap width: ripe for tuning

<object data="inkscape/beam_2_tilted.svg" type="image/svg+xml"></object>

---

## Uncertainty vs. gap size




<img src="custom/uncertainty.gif">

---

## Uncertainty vs. gap size: cumulative statistics




<img src="custom/uncertainty2.gif">

---

## Error vs. gap size




<img src="custom/error.gif">

---

## Error vs. gap size: cumulative statistics




<img src="custom/error2.gif">

---

## Normalized error vs. gap size




<img src="custom/normalized_error.gif">

---

## Rutherford's criticism

(pic of Rutherford)

"If your experiment needs statistics, you ought to have done a better experiment."

Response: "Better statistics can lead you to that better experiment"

(Show as memes?  Pic of Bayes...)

---

# Conclusions
