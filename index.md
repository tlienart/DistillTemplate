@def title = "Franklin Sandbox"
@def hasmath = true
@def hascode = true

@def front_matter = """{"title":"Distill for Franklin.jl","description":"Scientific and technical writing, native to the web","authors":[{"author":"Jun Tian","authorURL":"https://github.com/findmyway","affiliation":"","affiliationURL":""},{"author":"Thibaut Lienart","authorURL":"https://github.com/tlienart","affiliation":"","affiliationURL":""}],"publishedDate":"2020-06-10T12:36:15.000+08:00","citationText":"Jun, Thibaut, et al., 2020"}"""

# Franklin syntax sandbox

This page is meant as a sandbox for Franklin Syntax so that you can quickly practice or experience things.

<!-- TODO: -->
\aside{This content should appear in the gutter of the article.}

## Sandbox

Write whatever you want here to practice Franklin Syntax:

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
