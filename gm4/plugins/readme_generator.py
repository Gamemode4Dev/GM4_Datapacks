from beet import Context, TextFile
import re
from pathlib import Path

global_replacements = {
    r"https:\/\/wiki\.gm4\.co\/wiki\/([\w_]+)": r"https:MY_URL\\\1",
    }

def beet_default(ctx: Context):
    """Loads the README.md and modifies:
        - converts local images to URLs pointed at the repo
        - download links for respective download sites
        - pulls credits from beet.yaml and contributors.json
        - pulls YT link from beet.yaml"""
    readme_path = Path(ctx.project_id) / "README.md"
    if not readme_path.exists():
        return
    global_readme = TextFile(source_path=readme_path)
        # this step handled by release plugin? doesnt seem to bind to ctx
    # my_readme = ctx.data.extra["README.md"]
    global_contents = global_readme.text

    # Local Images to raw.githubusercontent URLs
    global_replacements.update({
        r"([!<].*?[\"(])(.*?)([\")].*) *<!-- *\$localAssetToURL[ -]+?>":
            f"\\1https://raw.githubusercontent.com/Gamemode4Dev/GM4_Datapacks/master/{ctx.project_id}/\\2\\3"
    })

    # Credits
    linked_credits = ctx.meta['linked_credits'] # NOTE this relies on the credits portion of manifest running first. Is that okay?
    credits_text = ""
    for title in linked_credits:
        credits_text += f"- {title}: {', '.join(linked_credits[title])}\n"
    global_replacements.update({r'<!-- *\$creditsInsert.+>' : credits_text})

    # Youtube Info
    global_replacements.update({
        r'<!-- *\$youtubeLinkInsert.+>' : (
            f"[<img src=\"https://raw.githubusercontent.com/Gamemode4Dev/GM4_Datapacks/master/base/images/youtube_logo.png\" "
            f"alt=\"Youtube Logo\" width=\"40\" align=\"center\"/> "
            f"**Watch on Youtube**]({ctx.meta['gm4']['video']})" # TODO should this reference the cached manifeset?
        )
    })
    
    # Wiki Info
    global_replacements.update({
        r'<!-- *\$wikiLinkInsert.+>' : (
            f"[<img src=\"https://raw.githubusercontent.com/Gamemode4Dev/GM4_Datapacks/master/base/images/gm4_wiki_logo.png\" "
            f"alt=\"Gamemode 4 Wiki Logo\" width=\"40\" align=\"center\"/> "
            f"**Read the Wiki**]({ctx.meta['gm4']['wiki']})"
        )
    })

    # Recommended modules dynamic linking; to gm4.co, serves as fallback link if modrinth post does not exist
    download_links = ctx.cache["download_links"].json
    rec_modules = re.findall(r"\[(.+)\]\(\$dynamicLink:(\w+)\)", global_contents)
    for m in [m for _, m in rec_modules]:
        # TODO relative links
        global_replacements.update({
            f"\\[(.+)\\]\\((\\$dynamicLink:{m})\\)": f"[\\1](https://gm4.co/modules/{m[4:].replace('_','-')})<!--$dynamicLink:{m}-->"
        })

    # Perform global replacements
    for pattern, repl in global_replacements.items():
        global_contents = re.sub(pattern, repl, global_contents)

    # TODO handle these by subfunction? For command line toggle options?
    # download-site specific edits
    site_replacements: dict[str, dict[str, str]] = {
        "gm4": {},
        "modrinth": {},
        "smithed": {},
        "pmc": {}
    }

    # Remove lingering comments in main readme
    site_replacements["gm4"].update({r"\n?<!--.+?-->": ""})

    # Recommended modules dynamic linking; from gm4.co to modrinth/smithed/pmc
    rec_modules = re.findall(r"\(.+\)<!--\$dynamicLink:(.+)-->", global_contents)
        # TODO relative links
    for m in rec_modules:
        if (v:=download_links[m].get('modrinth_id')):
            site_replacements["modrinth"].update({
                f"\\(.+\\)<!--\\$dynamicLink:{m}-->": f"(https://modrinth.com/datapack/{v})"
        })
        if (v:=download_links[m].get('smithed_link')):
            site_replacements["smithed"].update({
                f"\\(.+\\)<!--\\$dynamicLink:{m}-->": f"(https://beta.smithed.dev/packs/{v})" # NOTE links to in-beta browser smithed access
        })
        if (v:=download_links[m].get('pmc_link')):
            site_replacements["pmc"].update({
                f"\\(.+\\)<!--\\$dynamicLink:{m}-->": f"(https://planetminecraft.com/data-pack/{v})" # NOTE links to in-beta browser smithed access
        })

    # Modrinth Youtube Video Embed
    if (vid_url:=ctx.meta['gm4']['video']) is not None:
        embed_url = re.sub(r'https:\/\/www.youtube.com\/watch\?v=(\w+)', r'https://www.youtube.com/embed/\1', vid_url)

        site_replacements["modrinth"].update({
            r"(.+)<!-- *\$modrinth:replaceWithVideo[ -]+?>" : (
                "<iframe\n"
                "width=\"640\"\n"
                "height=\"480\"\n"
                f"src=\"{embed_url}\"\n"
                "frameborder=\"0\"\n"
                "allow=\"autoplay; encrypted-media\"\n"
                "allowfullscreen\n"
                "></iframe>"
            )
        })

    # PMC Element Deletion
    site_replacements['pmc'].update({
        r".+<!--\$pmc:delete.+>\n\n": ""
    })

    # PMC BBCode Translation # TODO only process if needed?
        # tables are gross to autodetect and capture, so we'll cheat with helper tags
    tables = re.findall(r'<!-- *\$pmc:startTable ?-->\n((?:.+\n)+)<!-- *\$pmc:endTable ?-->', global_contents)
    print(tables)
    for table in tables:
        repl = "[table]\n"
        for line in table.strip('\n').split('\n'):
            if set(line).issubset(set("| -:")):
                continue
            repl += "[tr]\n"
            for value in [v for v in line.split('|') if v != ""]:
                repl += f"\t[td]{value.strip()}[/td]\n"
            repl += "[/tr]"
        repl += "[/table]"

        site_replacements['pmc'].update({
            f'<!-- *\\$pmc:startTable ?-->\n{re.escape(table)}<!-- *\\$pmc:endTable ?-->':
                repl
        })

        # static BBCode translations
    site_replacements['pmc'].update({
        r"(.+)<!-- *\$pmc:headerSize.+>": r"[size=14px]\1[/size]",
        r"#{2,3} (.+)": r"[style b size=14px]\1[/style]",
        r"!\[(?!size|style|img|url)(.+)\]\((.+)\)": r"[img=\1]\2[/img]",
        r"\[(?!size|style|img|url)(.+)\]\((.+)\)": r"[url=\2]\1[/url]",
        r"<img src=\"(.+?)\" alt=(\".+?\") width=\"(.+?)\".+>": r"[img title=\2 width=\3]\1[/img]",
        r"\*\*(.+)\*\*": r"[b]\1[/b]",
        r"\*(.+)\*": r"[i]\1[/i]",
        r"_([^_\n]+?)_(?![\w])": r"[i]\1[/i]",
        r"__(.+)__": r"[u]\1[/u]",
        r"~~(.+)~~": r"[s]\1[/s]",
        r"`(.+)`": r"\1", # BBCode has no inline code blocks
        r"```(.+)```": r"[code]\1[/code]",
        r"---*\n": r"[hr]"
    })


            


    site_replacements['pmc'].update({
        r"\n?<!--.+?-->": ""
    })
    
    # Apply site-specific edits
    for site, replacements in site_replacements.items():
        site_contents = global_contents
        for pattern, repl in replacements.items():
            site_contents = re.sub(pattern, repl, site_contents)

        if site == "gm4":
            ctx.data.extra["README.md"] = TextFile(site_contents)
        else:
            ctx.meta[f'{site}_readme'] = TextFile(site_contents)
