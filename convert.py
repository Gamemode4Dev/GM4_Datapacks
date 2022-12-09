from glob import glob
import json

NL = '\n'
QUOTE = "'"

for id in glob("gm4_*/pack.mcmeta"):
	id = id.replace("\\", "/").removesuffix("/pack.mcmeta")
	with open(f"{id}/pack.mcmeta", "r") as f:
		pack = json.load(f)

	recommended = pack.get("recommended_modules", [])
	required = pack.get("required_modules", [])
	note = pack.get("important_note", None)
	video = pack.get("video_link", "")
	wiki = pack.get("wiki_link", "")
	credits = pack.get("credits", {})
	libraries = pack.get("libraries", [])

	config = f"""extend: '../module.yaml'

id: {id}
name: {pack['module_name']}

data_pack:
  load: .
{'' if len(libraries) == 0 else f'{NL}pipeline:{"".join([f"{NL}  - data_pack:{NL}      load: {QUOTE}../{l}{QUOTE}"for l in libraries])}{NL}'}
meta:
  gm4:{f'{NL}    hidden: true' if pack.get('hidden', False) else ''}
    description: {pack['site_description']}
    required:{' []' if len(required) == 0 else ''.join([f'{NL}      - gm4_{r}' for r in required])}
    recommended:{' []' if len(recommended) == 0 else ''.join([f'{NL}      - gm4_{r}' for r in recommended])}
    notes:{' []' if note is None else f'{NL}      - {note}'}
    video: {'null' if len(video) == 0 else video}
    wiki: {'null' if len(wiki) == 0 else wiki}
    credits:{''.join([f'{NL}      {c}:{"".join([f"{NL}        - {p}" for p in credits[c]])}' for c in credits])}
"""

	with open(f"{id.removesuffix('pack.mcmeta')}/beet.yaml", "w") as f:
		f.write(config)
