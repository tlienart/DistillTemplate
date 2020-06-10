using Franklin
const F = Franklin

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
    "<aside>$content</aside>"
end