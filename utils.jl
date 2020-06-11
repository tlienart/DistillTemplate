using Franklin
const F = Franklin

html(s) = "\n~~~$s~~~\n"

function hfun_adddescription()
    d = locvar(:description)
    F.md2html(d)
end

function hfun_frontmatter()
    fm = locvar(:front_matter)
    if isnothing(fm)
        ""
    else
        """
        <d-front-matter>
            <script id="distill-front-matter" type="text/json">
                $fm
            </script>
        </d-front-matter>
        """
    end
end

function hfun_byline()
    fm = locvar(:front_matter)
    if isnothing(fm)
        ""
    else
        "<d-byline></d-byline>" 
    end
end

function hfun_dtoc()
    is_enable_toc = locvar(:is_enable_toc)
    minlevel = locvar("mintoclevel")
    maxlevel = locvar("maxtoclevel")
    toc = F.hfun_toc([string(minlevel), string(maxlevel)])
    if isnothing(is_enable_toc)
        ""
    else
        """
        <hr class="franklin-toc-separator">
        <d-article class="franklin-content">
        <h3 class="franklin-toc-header">Table of content</h3>
        $toc
        </d-article>
        <hr class="franklin-toc-separator">
        """
    end
end

function hfun_appendix()
    ap = locvar(:appendix)
    ap = isnothing(ap) ? "" : F.md2html(ap)
    bib = locvar(:bibliography)
    bib = isnothing(bib) ? "" : "<d-bibliography src=\"$(F.parse_rpath(bib; canonical=false, code=true))\"></d-bibliography>"
    """
    <d-appendix>
        $ap
        $bib
    </d-appendix>
    """
end

function lx_dcite(lxc,_)
    content = F.content(lxc.braces[1])
    "<d-cite key=\"$content\"></d-cite>" |> html
end

# https://github.com/distillpub/template/blob/b854bd0124911e1be4744e472b67832e3251b96c/src/styles/styles-layout.css#L137-L166
"""
Possible layouts:
"""
function lx_dfig(lxc,lxd)
    content = F.content(lxc.braces[1])
    info = split(content, ';')
    layout = info[1]
    src = info[2]
    if !startswith(src, "http")
        src = F.parse_rpath(src; canonical=false, code=true)
    end
    caption = F.reprocess(join(info[3:end], ';'), lxd)
    """
    <figure class="l-$layout">
        <img src="$src">
        <figcaption>$caption</figcaption>
    </figure>
    """ |> html
end

function lx_aside(lxc,lxd)
    content = F.reprocess(F.content(lxc.braces[1]), lxd)
    "<aside>$content</aside>" |> html
end

function lx_footnote(lxc,lxd)
    content = F.reprocess(F.content(lxc.braces[1]), lxd)
    # workaround
    if startswith(content, "<p>")
        content = content[4:end-5]
    end
    "<d-footnote>$content</d-footnote>" |> html
end

function lx_appendix(lxc,lxd)
    content = F.reprocess(F.content(lxc.braces[1]), lxd)
    "<d-appendix>$content</d-appendix>" |> html
end