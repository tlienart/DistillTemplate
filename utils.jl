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

function lx_aside(lxc,_)
    content = F.md2html(F.content(lxc.braces[1]))
    "<aside>$content</aside>" |> html
end

function lx_footnote(lxc,_)
    content = F.content(lxc.braces[1]) |> F.md2html
    # workaround
    if startswith(content, "<p>")
        content = content[4:end-5]
    else
        @warn F.html_err("content in footnote should be a paragraph")
    end
    "<d-footnote>$content</d-footnote>" |> html
end

function lx_appendix(lxc,_)
    content = F.md2html(F.content(lxc.braces[1]))
    "<d-footnote>$content</d-footnote>" |> html
end