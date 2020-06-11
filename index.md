@def title = "Distill for Franklin.jl"
@def description = "This page is meant as a sandbox for [Franklin](https://franklinjl.org/) syntax so that you can quickly practice or experience things."
@def hasmath = true
@def hascode = true

@def front_matter = """{"authors":[{"author":"Jun Tian","authorURL":"https://github.com/findmyway","affiliation":"","affiliationURL":""},{"author":"Thibaut Lienart","authorURL":"https://github.com/tlienart","affiliation":"","affiliationURL":""}],"publishedDate":"2020-06-10T12:36:15.000+08:00","citationText":"Jun, Thibaut, et al., 2020","journal":{"title":"Distill"}}"""

<!-- @def is_enable_toc = false -->

## Header

Several variables are used to control the header part.

```
@def title = "Distill for Franklin.jl"
@def description = "
    This page is meant as a sandbox for [Franklin](https://franklinjl.org/) syntax so that you can quickly practice or experience things."
```

Here `title` is used to define the title of this article and 

## Sandbox

Write whatever you want here to practice [Franklin](https://franklinjl.org/) Syntax:

\aside{This content should appddear in the gutter of the article.}

```julia:./ex1
using LinearAlgebra, Random
Random.seed!(135)
a, b = randn(50), randn(50)
println(dot(a, b))
println(sum(ai * bi for (ai, bi) ∈ zip(a, b)))
```

\output{./ex1}

(yet another example that floating point arithmetics can be complicated).

$$ \forall x \in \R:\quad \scal{x, x} \ge 0 $$

\newcommand{\E}{\mathbb E}

Surely some people remember the ordering, but I always forget:

$$ \varphi(\E[X]) \le \E[\varphi(X)] $$

for $\varphi$ convex.

### Test h3

## Firgure

\dfig{screen;https://distill.pub/2020/bayesian-optimization/images/MAB_gifs/prior2posterior.png;Each new data point updates our surrogate model, moving it \footnote{This is footnote in image caption} to the ground truth. The black line and the grey shaded region indicate the mean.}

## Footnotes

You can use footnote provided in Distill \footnote{This is the [footnote]() provided in distill} .

## Appendices

A fully reproducible workflow based on literate programming \dcite{mercier2011humans,dong2014image} abc.

## Cite

@def bibliography = "/assets/bib/bibliography.bib"

@def appendix = """
    ### abc xyz
    haha
    """
