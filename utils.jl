using Franklin
const F = Franklin

html(s) = "\n~~~$s~~~\n"

# TODO: support YAML format
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

function hfun_appendix()
    ap = locvar(:appendix)
    s = ""
    if !isnothing(ap)
        s = F.md2html(ap)
    end
    """
    <d-appendix>
    $s
    </d-appendix>
    """
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