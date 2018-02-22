Get more out of R: Jumping from good statistics to good science
========================================================
author: Patrick McKenzie
date: February 22, 2018
autosize: true
font-family: 'Ubuntu'

This presentation can be found at <https://www.github.com/pmckenz1/weedsprez2018>.

<div align="left">
<img src="twitter-icon-vector.png" width=200 height=100>
</div>


Introduction
========================================================

The purpose of this presentation is to devote some time to cool, non-essential features of R that might not come up in research contexts but might make your life easier.

Everything here can also be done with Python. I'm focusing on R because I think that will be most helpful for people in this room.

Some of you will know about many of these things. Hopefully everyone will be exposed to something new!

What is R?
========================================================
R is a programming language for statistics and graphing.

We interact with R through an Interactive Development Environment (IDE) called RStudio, which has many features to make coding easier.
  - Scripting and console
  - Line-by-line
  - Built-in plotting and help features
  - Environmental variables
  - **More:** R projects, R Markdown, R Presentations, R Shiny

Keys to success for coding in science:
========================================================

Hard to sort these into discrete bins, but here's my attempt:

- **Organization:** Where is your code? Where is your data?
- **Readability:** What does your code say? What is it doing?
- **Reproducibility:** Can someone else easily redo your analysis and get the same results?
- **Accessibility:** Can your non-scientist friends and family use your code too?

Organization: General tips (not R)
========================================================

- <span style="font-weight:bold; color:black;">Use a consistent file structure!</span>
- Keep a **projects/** directory that contains a folder for each project
  - This presentation is its own directory, for example.
- Keep a .README file in each project directory to remind yourself of what the project is and what your different files are.

Organization: R projects
========================================================

**R Projects** are simple files that can make life much, much easier when you're working on several projects at once.


Readability and Reproducibility: General
========================================================

Readability and reproducibility go hand-in-hand.

1) Read a style guide and abide by it  

2) Comment all of your code  

3) Don't just save your raw data -- save your cleaned data too. It's easy to write code that reads in and cleans your data every time without actually saving it to disk. This is too complicated and can keep you from catching mistakes in your clean code.
4) Keep the bulk of your code contained in functions, and document those functions well. For the parts that require scripting (i.e. the implementation of those functions on your data), make sure that your scripting is well annotated (R Markdown, later)

Readability and Reproducibility: Make your own R packages
========================================================

Making your own R packages encourages you to write good code, and it helps people understand what you did.

Readability and Reproducibility: R Markdown 
========================================================

This is the most important slide. 

R Markdown is THE BEST WAY TO WRITE CODE. 

In Python, these are Jupyter notebooks.

Sample workflow: You want to start a new project.
========================================================



Accessibility: Make your results interactive for those who can't code
========================================================

This is the least useful thing from today, but it is cool.

How can someone explore parameter space of the model without having to code out the model? What about running MaxEnt with different parameters? (perhaps have R code that will ssh into another machine, run maxent, and come back)

https://pmckenz1.shinyapps.io/Deterministic_Mutualism_Model/

R Shiny
========================================================

Can be really flexible, including ssh-ing into servers, taking input data, and producing downloadable outputs.

These are also just fun.

Can be good conceptual tools, like for teaching

Additional things to check out:
========================================================

Overleaf

Refs
========================================================
Css in R presentations: <https://rstudio-pubs-static.s3.amazonaws.com/27777_55697c3a476640caa0ad2099fe914ae5.html#/>


