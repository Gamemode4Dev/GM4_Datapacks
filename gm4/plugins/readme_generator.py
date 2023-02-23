from beet import Context, TextFile
import re
from pathlib import Path

REPLACEMENT_PATTERNS = {
    r"https:\/\/wiki\.gm4\.co\/wiki\/([\w_]+)": r"https:MY_URL\\\1"
}

def beet_default(ctx: Context):
    """Loads the README.md and modifies for respective download sites"""
    print(ctx)
    readme_path = Path(ctx.project_id) / "README.md"
    my_readme = TextFile(source_path=readme_path)
        # this step handled by release plugin? doesnt seem to bind to ctx
    # my_readme = ctx.data.extra["README.md"]
    file_contents = my_readme.text

    for pattern, repl in REPLACEMENT_PATTERNS.items():
        file_contents = re.sub(pattern, repl, file_contents)

    print(file_contents)
