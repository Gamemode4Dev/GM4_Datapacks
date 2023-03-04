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

    # Perform global replacements
    for pattern, repl in global_replacements.items():
        global_contents = re.sub(pattern, repl, global_contents)

    # Remove lingering comments and print to file
    gm4_contents = re.sub(r"<!--.+?-->", "", global_contents)
    ctx.data.extra["README.md"] = TextFile(gm4_contents)

    # TODO handle these by subfunction? For command line toggle options?
    # Modrinth-specific edits
    modrinth_replacements = {"":""}

    if (vid_url:=ctx.meta['gm4']['video']) is not None:
        embed_url = re.sub(r'https:\/\/www.youtube.com\/watch\?v=(\w+)', r'https://www.youtube.com/embed/\1', vid_url)

        modrinth_replacements.update({
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
                
    modrinth_contents = global_contents
    for pattern, repl in modrinth_replacements.items():
        modrinth_contents = re.sub(pattern, repl, modrinth_contents)

    ctx.data.extra["README.md"] = TextFile(modrinth_contents) # TEMP to see output

    ctx.meta['modrinth_readme'] = TextFile(modrinth_contents) # can throw non output versions to the meta object 
        # to get dumped into the release directory in output.py

    # NOTE
        # next is handling recommended module links. THese need to reference the manifest cache or meta.json
        # in order to get the right project-id either for modrinth or gm4.co