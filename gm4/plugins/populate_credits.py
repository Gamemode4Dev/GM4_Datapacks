from beet import Context, TextFile

def beet_default(ctx: Context):
	manifest = ctx.cache["gm4_manifest"].json
	contributors = manifest.get("contributors", {})
	credits: dict[str, list[str]] = next((m["credits"] for m in manifest.get("modules", []) if m["id"] == ctx.project_id), {})
	if credits is None or len(credits) == 0:
		return

	text = "# Credits\n"
	for title in credits:
		people = credits[title]
		if not isinstance(people, list) or len(people) == 0:
			continue
		text += f"\n## {title}\n"
		for p in people:
			contributor = contributors.get(p, { "name": p })
			name = contributor.get("name", p)
			links: list[str] | str = contributor.get("links", [])
			if isinstance(links, list) and len(links) >= 1:
				text += f"- [{name}]({links[0]})\n"
			else:
				text += f"- {name}\n"
	ctx.data.extra["CREDITS.md"] = TextFile(text)
