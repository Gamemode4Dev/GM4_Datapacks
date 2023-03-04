from beet import Context, TextFile
import re
from pathlib import Path

REPLACEMENT_PATTERNS = {
    r"https:\/\/wiki\.gm4\.co\/wiki\/([\w_]+)": r"https:MY_URL\\\1",
    }
    # TODO use .update for this dict

def beet_default(ctx: Context):
    """Loads the README.md and modifies:
        - converts local images to URLs pointed at the repo
        - download links for respective download sites
        - pulls credits from beet.yaml and contributors.json
        - pulls YT link from beet.yaml"""
    readme_path = Path(ctx.project_id) / "README.md"
    my_readme = TextFile(source_path=readme_path)
        # this step handled by release plugin? doesnt seem to bind to ctx
    # my_readme = ctx.data.extra["README.md"]
    file_contents = my_readme.text

    # Local Images to raw.githubusercontent URLs
    REPLACEMENT_PATTERNS.update({
        r"([!<].*?[\"(])(.*?)([\")].*) *<!-- *\$localAssetToURL.+>":
            f"\\1https://raw.githubusercontent.com/Gamemode4Dev/GM4_Datapacks/master/{ctx.project_id}/\\2\\3"
    })

    # Credits
        # TODO replacement patterns gets added to?
    linked_credits = ctx.meta['linked_credits'] # NOTE this relies on the credits portion of manifest running first. Is that okay?
    credits_text = ""
    for title in linked_credits:
        credits_text += f"- {title}: {', '.join(linked_credits[title])}\n"
    REPLACEMENT_PATTERNS.update({r'<!-- *\$creditsInsert.+>' : credits_text})

    # Youtube Info
    REPLACEMENT_PATTERNS.update({
        r'<!-- *\$youtubeLinkInsert.+>' : (
            f"[<img src=\"https://raw.githubusercontent.com/Gamemode4Dev/GM4_Datapacks/master/base/images/youtube_logo.png\" "
            f"alt=\"Youtube Logo\" width=\"40\" align=\"center\"/> "
            f"**Watch on Youtube**]({ctx.meta['gm4']['video']})" # TODO should this reference the cached manifeset?
        )
    })
    
    # Wiki Info
    REPLACEMENT_PATTERNS.update({
        r'<!-- *\$wikiLinkInsert.+>' : (
            f"[<img src=\"https://raw.githubusercontent.com/Gamemode4Dev/GM4_Datapacks/master/base/images/gm4_wiki_logo.png\" "
            f"alt=\"Gamemode 4 Wiki Logo\" width=\"40\" align=\"center\"/> "
            f"**Read the Wiki**]({ctx.meta['gm4']['wiki']})"
        )
    })


    for pattern, repl in REPLACEMENT_PATTERNS.items():
        file_contents = re.sub(pattern, repl, file_contents)

    # add file to datapack, sending to release dir
    ctx.meta['MY_FILE'] = TextFile(file_contents) # can throw non output versions to the meta object 
        # to get dumped into the release directory in output.py
    ctx.data.extra["README.md"] = TextFile(file_contents)

    print(ctx.cache)
    # NOTE
        # next is handling recommended module links. THese need to reference the manifest cache or meta.json
        # in order to get the right project-id either for modrinth or gm4.co
