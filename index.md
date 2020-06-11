@def title = "Distill for Franklin.jl"

@def description = raw"""
    This page is meant as a sandbox for [Franklin](https://franklinjl.org/) syntax
    so that you can quickly practice or experience things.
    Link can be inserted with `[Franklin](https://franklinjl.org/)`.
    Inline equation $5^2 = 3^2 + 4 ^ 2$ with `$5^2 = 3^2 + 4 ^ 2$` is supported.
    And you can also cite \dcite{knuth1984} here.
    And even insert an image:
    ![](https://julialang.org/assets/infra/logo.svg)
    """

@def hasmath = true
@def hascode = true

@def front_matter = """
    {
        "authors": [
            {
                "author":"Jun Tian",
                "authorURL":"https://github.com/findmyway",
                "affiliation":"",
                "affiliationURL":""
            },
            {
                "author": "Thibaut Lienart",
                "authorURL":"https://github.com/tlienart",
                "affiliation":"",
                "affiliationURL":""
            }
        ],
        "publishedDate":"2020-06-10T12:36:15.000+08:00",
        "citationText":"Jun, Thibaut, et al., 2020"
    }"""

<!-- @def is_enable_toc = true -->

## Header

Several variables are used to control the header part.

```
@def title = "Distill for Franklin.jl"
@def description = raw"""
    This page is meant as a sandbox for [Franklin](https://franklinjl.org/) syntax
    so that you can quickly practice or experience things.
    Link can be inserted with `[Franklin](https://franklinjl.org/)`.
    Inline equation $ 5^2 = 3^2 + 4 ^ 2 $ with `\\( 5^2 = 3^2 + 4 ^ 2 \\)` is supported.
    """
```

Here `title` is used to define the title of this article. It is also shown in the browser's title bar or in the page's tab.
And `description` will appear just under the title.

```
@def front_matter = """
    {
        "authors": [
            {
                "author":"Jun Tian",
                "authorURL":"https://github.com/findmyway",
                "affiliation":"",
                "affiliationURL":""
            },
            {
                "author": "Thibaut Lienart",
                "authorURL":"https://github.com/tlienart",
                "affiliation":"",
                "affiliationURL":""
            }
        ],
        "publishedDate":"2020-06-10T12:36:15.000+08:00",
        "citationText":"Jun, Thibaut, et al., 2020"
    }"""
```

The `front_matter` variable is used to define authors and some meta info. If it is not defined, the whole byline block will be removed.

To generate the table of content(TOC), you need to set `@def is_enable_toc = true` instead of `\toc`.


## Sandbox

Write whatever you want here to practice [Franklin](https://franklinjl.org/) syntax.

### Code

You may refer [Inserting and evaluating code](https://franklinjl.org/code/) for more details.

```julia:./ex1
using LinearAlgebra, Random
Random.seed!(135)
a, b = randn(50), randn(50)
println(dot(a, b))
println(sum(ai * bi for (ai, bi) ∈ zip(a, b)))
```

\output{./ex1}

### Equations

Equations also work here:

$$ \tag{1} \forall x \in \R:\quad \scal{x, x} \ge 0 $$

And you can define a latex-like command:

```
\newcommand{\E}{\mathbb E}
```

\newcommand{\E}{\mathbb E}

Surely some people remember the ordering, but I always forget:

$$ \tag{2} \varphi(\E[X]) \le \E[\varphi(X)] $$

for $\varphi$ convex.

## Figures

The markdown grammer will just work as expected:

```
![rndimg](/assets/rndimg.jpg)
```

![rndimg](/assets/rndimg.jpg)

Or you can also use the `\fig{img}` (or `\figalt{alt}{img}`) command to show a figure:

```
\figalt{test}{/assets/rndimg.jpg}
```

\figalt{test}{/assets/rndimg.jpg}

Beyond that, distill template also provides another usefule command to generate more beutiful figures:

```
\dfig{layout;src;caption}
```

Here `layout` can have the following values:

- `gutter`
- `text`/`body`
- `page`
- `body-outset`
- `page-outset`
- `screen`
- `screen-inset`

And the `caption` field can be general markdown.

\dfig{gutter;/assets/backsplash-min-0.5.svg;This image is from the [Julia website](https://julialang.org/) shown in layout of `gutter`.}

\dfig{text;/assets/backsplash-min-0.5.svg;This image is from the [Julia website](https://julialang.org) shown in layout of `text/body`.}

\dfig{body-outset;/assets/backsplash-min-0.5.svg;This image is from the [Julia website](https://julialang.org) shown in layout of `body-outset`.}

\dfig{page;/assets/backsplash-min-0.5.svg;This image is from the [Julia website](https://julialang.org) shown in layout of `page`.}

\dfig{page-outset;/assets/backsplash-min-0.5.svg;This image is from the [Julia website](https://julialang.org) shown in layout of `page-outset`.}

\dfig{screen-inset;/assets/backsplash-min-0.5.svg;This image is from the [Julia website](https://julialang.org) shown in layout of `screen-inset`.}

\dfig{screen;/assets/backsplash-min-0.5.svg;This image is from the [Julia website](https://julialang.org) shown in layout of `screen`.}

And of course, we can insert images generated from code:

```julia:pyplot1
using PyPlot
figure(figsize=(8, 6))
x = range(-2, 2, length=500)
for α in 1:5
    plot(x, sinc.(α .* x))
end
savefig(joinpath(@OUTPUT, "sinc.svg")) # hide
```

```
\dfig{body;sinc;As you can see, `\dfig` just works like `\fig`}
```

\dfig{body;sinc;As you can see, `\dfig` just works like `\fig`}

## Footnotes and asides

Footnote is provided by the `\footnote{}` command \footnote{This is the [footnote]() provided in distill}. Try to hover on the link and preview the foot notes. You can find the footnote in the appendix section of this page.

\aside{This content should appddear in the gutter of the article. You can insert arbitary markdown here!}

## Cite

You can define the path to a bibliography file with:

```
@def bibliography = "/assets/bib/bibliography.bib"
```

@def bibliography = "/assets/bib/bibliography.bib"

And then cite the content with the `\dcite{distill}` command by leveraging the cite comonent provided by Distill \dcite{distill}.

## Appendices

In the appendix part of this page, the distill template will automatically generated **Footnote** and **References** section for you (if you have defined footnotes and references). Beyond that, you can also insert some customized sections with the `appendix` variable:

```
@def appendix = """
    ### Your Title
    Your contennt will appear here.
    ### Corrections & Contributions
    Just [create an issue](https://github.com/tlienart/DistillTemplate/issues) on the source repository and we can disucss details there.
    ### Citation
    You can cite this work like this:
    > Jun, Thibaut, et al., 2020. Distill for Franklin.jl. Retrieved from https://github.com/tlienart/DistillTemplate
    """
```

The only requirement is that the title has to be `<h3>`.

@def appendix = """
    ### Your Title
    Your contennt will appear here.
    ### Corrections & Contributions
    Just [create an issue](https://github.com/tlienart/DistillTemplate/issues) on the source repository and we can disucss details there.
    """
