import json
import os
import nbtlib
from mecha import Mecha
from mecha import AstNbt, AstNbtPath
import yaml

mc = Mecha()

UNDISCOVERED = "[\"\",{\"text\":\"???\",\"hoverEvent\":{\"action\":\"show_text\",\"contents\":[{\"translate\":\"%1$s%3427655$s\",\"with\":[{\"text\":\"Undiscovered\"},{\"translate\":\"text.gm4.guidebook.undiscovered\"}],\"italic\":true,\"color\":\"red\"}]}}]"
BASE_MODULES = ["better_armour_stands", "metallurgy",
                "liquid_tanks", "mysterious_midnights", "orbis", "custom_crafters"]
EXPANSION_MODULES = ["cement_mixers",
                     "liquid_minecarts", "standard_liquids", "mending_tanks",
                     "slime_fests", "sandy_husks", "menacing_goblins", "illusioner_nights",
                     "icy_strays", "enlarging_phantoms", "tipped_skeletons", "resurrecting_zombies",
                     "resurrecting_skeletons", "nightmare_nights", "harvest_moons", "falling_stars",
                     "particles_pack", "poses_pack", "potion_liquids", "record_crafting",
                     "standard_crafting", "washing_tanks", "zauber_liquids", ]
TIES = {
  "poses_pack": "better_armour_stands",
  "particles_pack": "better_armour_stands",
  "record_crafting": "custom_crafters",
  "standard_crafting": "custom_crafters",
  "washing_tanks": "liquid_tanks",
  "mending_tanks": "liquid_tanks",
  "liquid_minecarts": "liquid_tanks",
  "standard_liquids": "liquid_tanks",
  "cement_mixers": "liquid_tanks",
  "sandy_husks": "mysterious_midnights",
  "menacing_goblins": "mysterious_midnights",
  "illusioner_nights": "mysterious_midnights",
  "slime_fests": "mysterious_midnights",
  "icy_strays": "mysterious_midnights",
  "enlarging_phantoms": "mysterious_midnights",
  "tipped_skeletons": "mysterious_midnights",
  "resurrecting_zombies": "mysterious_midnights",
  "resurrecting_skeletons": "mysterious_midnights",
  "nightmare_nights": "mysterious_midnights",
  "harvest_moons": "mysterious_midnights",
  "falling_stars": "mysterious_midnights",
  "potion_liquids": "liquid_tanks",
  "zauber_liquids": "liquid_tanks",
}

TO_DELETE = [{
    "condition": "minecraft:inverted",
    "term": {
        "condition": "minecraft:entity_properties",
        "entity": "this",
        "predicate": {
            "type_specific": {
                  "type": "player",
                  "gamemode": "spectator"
            }
        }
    }
}]

ID_TO_NAME = {
    "animi_shamir": "Animi Shamir",
    "apple_trees": "Apple Trees",
    "audere_shamir": "Audere Shamir",
    "bat_grenades": "Bat Grenades",
    "beehive_inspector": "Beehive Inspector",
    "better_armour_stands": "Better Armour Stands",
    "better_fire": "Better Fire",
    "block_compressors": "Block Compressors",
    "book_binders": "Book Binders",
    "boots_of_ostara": "Boots of Ostara",
    "cement_mixers": "Cement Mixers",
    "chairs": "Chairs",
    "cooler_caves": "Cooler Caves",
    "cozy_campfires": "Cozy Campfires",
    "crossbow_cartridges": "Crossbow Cartridges",
    "dangerous_dungeons": "Dangerous Dungeons",
    "desire_lines": "Desire Lines",
    "celaro_shamir": "Celaro Shamir",
    "disassemblers": "Disassemblers",
    "display_frames": "Display Frames",
    "enchantment_extractors": "Enchantment Extractors",
    "end_fishing": "End Fishing",
    "ender_hoppers": "Ender Hoppers",
    "enderman_support_class": "Enderman Support Class",
    "everstone": "Everstone",
    "forming_press": "Forming Press",
    "fulcio_shamir": "Fulcio Shamir",
    "heart_canisters": "Heart Canisters",
    "holographic_tags": "Holographic Tags",
    "iacio_shamir": "Iacio Shamir",
    "ink_spitting_squid": "Ink Spitting Squid",
    "liquid_minecarts": "Liquid Minecarts",
    "standard_liquids": "Standard Liquids",
    "liquid_tanks": "Liquid Tanks",
    "live_catch": "Live Catch",
    "lumos_shamir": "Lumos Shamir",
    "mending_tanks": "Mending Tanks",
    "vibro_shamir": "Vibro Shamir",
    "tinker_shamir": "Tinker Shamir",
    "spiraculum_shamir": "Spiraculum Shamir",
    "sensus_shamir": "Sensus Shamir",
    "musical_shamir": "Musical Shamir",
    "moneo_shamir": "Moneo Shamir",
    "metallurgy": "Metallurgy",
    "hypexperia_shamir": "Hypexperia Shamir",
    "gemini_shamir": "Gemini Shamir",
    "forterra_shamir": "Forterra Shamir",
    "ender_bolt_shamir": "Ender Bolt Shamir",
    "defuse_shamir": "Defuse Shamir",
    "arborenda_shamir": "Arborenda Shamir",
    "slime_fests": "Slime Fests",
    "sandy_husks": "Sandy Husks",
    "menacing_goblins": "Menacing Goblins",
    "illusioner_nights": "Illusioner Nights",
    "icy_strays": "Icy Strays",
    "enlarging_phantoms": "Enlarging Phantoms",
    "mob_curing": "Mob Curing",
    "tipped_skeletons": "Tipped Skeletons",
    "resurrecting_zombies": "Resurrecting Zombies",
    "resurrecting_skeletons": "Resurrecting Skeletons",
    "nightmare_nights": "Nightmare Nights",
    "mysterious_midnights": "Mysterious Midnights",
    "harvest_moons": "Harvest Moons",
    "falling_stars": "Falling Stars",
    "note_block_interface": "Note Block Interface",
    "orb_of_ankou": "Orb of Ankou",
    "corripio_shamir": "Corripio Shamir",
    "orbis": "Orbis",
    "particles_pack": "Particles Pack",
    "percurro_shamir": "Percurro Shamir",
    "phantom_scarecrows": "Phantom Scarecrows",
    "pig_tractors": "Pig Tractors",
    "podzol_rooting_soil": "Podzol Rooting Soil",
    "poses_pack": "Poses Pack",
    "potion_liquids": "Potion Liquids",
    "potion_swords": "Potion Swords",
    "record_crafting": "Record Crafting",
    "relocators": "Relocators",
    "scuba_gear": "SCUBA Gear",
    "shroomites": "Shroomites",
    "smelteries": "Smelteries",
    "soul_glass": "Soul Glass",
    "spawner_minecarts": "Spawner Minecarts",
    "speed_paths": "Speed Paths",
    "standard_crafting": "Standard Crafting",
    "sunken_treasure": "Sunken Treasure",
    "sweethearts": "Sweethearts",
    "tinkering_compressors": "Tinkering Compressors",
    "tnt_landmines": "TNT Landmines",
    "tower_structures": "Tower Structures",
    "trapped_signs": "Trapped Signs",
    "tunnel_bores": "Tunnel Bores",
    "undead_players": "Undead Players",
    "vecto_shamir": "Vecto Shamir",
    "vertical_rails": "Vertical Rails",
    "vigere_shamir": "Vigere Shamir",
    "washing_tanks": "Washing Tanks",
    "weighted_armour": "Weighted Armour",
    "helious_shamir": "Helious Shamir",
    "xp_storage": "XP Storage",
    "zauber_cauldrons": "Zauber Cauldrons",
    "zauber_liquids": "Zauber Liquids",
    "ziprails": "Ziprails",
    "custom_crafters": "Custom Crafters",
  }

num_id = 1
for folder in os.listdir():
  if not folder.startswith("gm4_") and not folder.startswith("lib_"):
    continue
  if not os.path.exists(f"{folder}/data"):
    continue
  if not os.path.exists(f"{folder}/data/gm4_guidebook"):
    continue
  if folder.startswith("gm4_guidebook"):
    continue

  with open(f"{folder}/data/gm4_guidebook/tags/functions/add_pages.json") as f:
    gen_function_path = json.load(f)["values"][0]

  gen_function_path = gen_function_path.split(":")
  gen_function_path = f"{folder}/data/{gen_function_path[0]}/functions/{gen_function_path[1]}.mcfunction"
  adder_paths = {}
  to_handle = ""
  with open(gen_function_path) as f:
    lines = f.readlines()
    lines = [line for line in lines if not line.startswith(
      "#") and line != "\n"]
    for line in lines:
      if len(line.split(" ")) != 9:
        to_handle = line
        continue
      adder_paths[line.split(" ")[5].removeprefix(
        'module{id:"').removesuffix('"}')] = line.split(" ")[8][:-1]

  for key in adder_paths:
    nbts = []
    fallbacknbts = []
    advancements = set()

    adder_paths[key] = adder_paths[key].split(":")
    adder_paths[key] = f"{folder}/data/{adder_paths[key][0]}/functions/{adder_paths[key][1]}.mcfunction"
    lines = []
    with open(adder_paths[key], encoding="utf-8") as f:
      lines = f.readlines()
      lines = [line for line in lines if not line.startswith("#") and line != "\n"]

    for line in lines:
      ast = mc.parse(line).commands[0]
      enable = []
      requirements = []
      fallbacks = []
      page = -1

      section = ast
      while not isinstance(section, AstNbt):

        if section.identifier.startswith("data"):
          path: AstNbtPath = section.arguments[1]  # type: ignore
          if len(path.components) == 2:
            page = path.components[1].index.value  # type: ignore
        if section.identifier.startswith("execute:if:entity"):
          requirements.append([section.arguments[0].arguments[0].value.advancements[0].key.path])  # type: ignore
          advancements.add(section.arguments[0].arguments[0].value.advancements[0].key.path)  # type: ignore
        if section.identifier.startswith("execute:unless:entity"):
          fallbacks.append([section.arguments[0].arguments[0].value.advancements[0].key.path])  # type: ignore
          advancements.add(section.arguments[0].arguments[0].value.advancements[0].key.path)  # type: ignore
        if section.identifier.startswith("execute:if:score"):
          enable.append({"id": mc.serialize(section.arguments[0]), "load": int(mc.serialize(section.arguments[2]))})
        if section.identifier.startswith("execute:unless:score"):
          enable.append({"id": mc.serialize(section.arguments[0]), "load": -1})
        section = section.arguments[-1]

      if len(fallbacks) > 0:
        fallbacknbts.append({"enable": enable, "requirements": fallbacks,
                             "pages_locked": nbtlib.parse_nbt(mc.serialize(section))})
      else:
        nbts.append({"enable": enable, "requirements": requirements,
                    "pages": nbtlib.parse_nbt(mc.serialize(section)), "page": page})

    guidebook = {}
    for fallbacknbt in fallbacknbts:
      for section in nbts:
        if (section["requirements"] == fallbacknbt["requirements"]) and (section["enable"] == fallbacknbt["enable"]):
          section["pages_locked"] = fallbacknbt["pages_locked"]
          break
      else:
        for section in nbts:
          if (section["requirements"] == fallbacknbt["requirements"]):
            section["pages_locked"] = fallbacknbt["pages_locked"]

    for section in nbts:
      if type(section["pages"]) == nbtlib.tag.String:
        section["pages"] = nbtlib.tag.List[nbtlib.tag.String]([section["pages"]])

      if "pages_locked" in section and type(section["pages_locked"]) == str:
        section["pages_locked"] = [section["pages_locked"]]

    for section in nbts:
      for k, page in enumerate(section["pages"]):
        if page == UNDISCOVERED:
          section["pages"][k] = nbtlib.tag.String("???")
      if "pages_locked" in section:
        for k, page in enumerate(section["pages_locked"]):
          if page == UNDISCOVERED:
            section["pages_locked"][k] = nbtlib.tag.String("???")

    temp_nbts = []
    for section in nbts:
      for section2 in temp_nbts:
        if (section["requirements"] == section2["requirements"]) and (section["enable"] == section2["enable"]):
          section2["temp_pages"][section["page"]] = section["pages"]
          break
      else:
        section["temp_pages"] = {section["page"]: section["pages"]}
        temp_nbts.append(section)

    for section in temp_nbts:
      section["pages"] = nbtlib.tag.List[nbtlib.tag.String]()
      for k in sorted(section["temp_pages"].keys()):
        for page in section["temp_pages"][k]:
          section["pages"].append(page)
      name = []
      if len(section["requirements"]) == 1:
        name.append(f'{section["requirements"][0][0]}')
      if len(section["enable"]) == 1:
        name.append(f'{section["enable"][0]["id"]}.{section["enable"][0]["load"]}')
      section["name"] = "-".join(name) if name != [] else "initial"
      del section["temp_pages"]

    nbts = temp_nbts

    conditions = {}
    icon = {}
    unlocks = {}
    granters = {}
    prereqs = {}
    for advancement in advancements:
      with open(f"{folder}/data/gm4_guidebook/advancements/{advancement}.json") as f:
        advancementdata = json.load(f)
        requirements = []
        granted_by = ""

        for criteria in advancementdata["criteria"]:
          if criteria == "unlocked_future_page":
            granted_by = list(dict.keys([x for x in advancementdata["criteria"][criteria]["conditions"]["player"]
                                         if x["condition"] == "minecraft:entity_properties"][0]["predicate"]["type_specific"]["advancements"]))[0].removeprefix("gm4_guidebook:")
            if granted_by not in granters:
              granters[granted_by] = []
            granters[granted_by].append(advancement)
          else:
            conditions[f"{advancement}/{criteria}"] = advancementdata["criteria"][criteria]
            requirements.append(f"{advancement}/{criteria}")
            try:
              to_keep_in_mind = [x for x in advancementdata["criteria"][criteria]
                                 ["conditions"]["player"] if "predicate" in x and "type_specific" in x["predicate"] and "advancements" in x["predicate"]["type_specific"]]
              for thing in to_keep_in_mind:
                advs = list(thing["predicate"]["type_specific"]["advancements"].keys())
                for adv in advs:
                  if adv.startswith("gm4_guidebook:"):
                    if advancement not in prereqs:
                      prereqs[advancement] = []
                    prereqs[advancement].append(adv.removeprefix("gm4_guidebook:"))

            except Exception as e:
              pass

        for section in nbts:
          actual_requirements = []
          if [advancement] in section["requirements"]:
            for req in requirements:
              actual_requirements.append([f"{req}"])
            if granted_by != "":
              section["granted_by"] = granted_by
            section["requirements"] = actual_requirements
            section["orig_adv"] = advancement

        icon = advancementdata["display"]["icon"]

    for section in nbts:
      if "orig_adv" in section and section["orig_adv"] in granters:
        for section2 in nbts:
          if "orig_adv" in section2 and section2["orig_adv"] in granters[section["orig_adv"]]:
            if "grants" not in section:
              section["grants"] = []
            if section2["orig_adv"] not in section["grants"]:
              section["grants"].append(section2["name"])

    for section in nbts:
      if "orig_adv" in section and section["orig_adv"] in prereqs:
        for section2 in nbts:
          if "orig_adv" in section2 and section2["orig_adv"] in prereqs[section["orig_adv"]]:
            if "prerequisites" not in section:
              section["prerequisites"] = [[]]
            if section2["orig_adv"] not in section["prerequisites"]:
              section["prerequisites"][0].append(section2["name"])

    guidebook["id"] = key
    guidebook["name"] = ID_TO_NAME[key]
    guidebook["trigger_id"] = num_id
    num_id += 1
    guidebook["module_type"] = "expansion" if key.endswith("shamir") or key in EXPANSION_MODULES else "module"
    guidebook["module_type"] = "base" if key in BASE_MODULES else guidebook["module_type"]
    if guidebook["module_type"] == "expansion":
      if key.endswith("shamir"):
        guidebook["base_module"] = "metallurgy"
      else:
        guidebook["base_module"] = TIES[key]

    guidebook["icon"] = icon
    guidebook["criteria"] = {k: conditions[k]
                             for k in sorted(conditions, key=lambda i: int(i.split("/")[-2].split("_")[-1]))}
    guidebook["sections"] = sorted(nbts, key=lambda i: i["page"])

    for section in guidebook["sections"]:
      if "orig_adv" in section:
        del section["orig_adv"]
      if "granted_by" in section:
        del section["granted_by"]
      del section["page"]
    for criteria in guidebook["criteria"]:
      if "player" in guidebook["criteria"][criteria]["conditions"]:
        for thing in TO_DELETE:
          if thing in guidebook["criteria"][criteria]["conditions"]["player"]:
            guidebook["criteria"][criteria]["conditions"]["player"].remove(thing)

        try:
          to_remove = [x for x in guidebook["criteria"][criteria]
                       ["conditions"]["player"] if "value" in x and "score" in x["value"] and x["value"]["score"] == "load.status"]
          for thing in to_remove:
            guidebook["criteria"][criteria]["conditions"]["player"].remove(thing)
        except Exception as e:
          pass
        if guidebook["criteria"][criteria]["conditions"]["player"] == []:
          del guidebook["criteria"][criteria]["conditions"]["player"]

    to_remove2 = []
    for criteria in guidebook["criteria"]:
      try:
        to_keep_in_mind = [x for x in guidebook["criteria"][criteria]
                           ["conditions"]["player"] if "predicate" in x and "type_specific" in x["predicate"] and "advancements" in x["predicate"]["type_specific"]]
        for thing in to_keep_in_mind:
          advs = list(thing["predicate"]["type_specific"]["advancements"].keys())
          for adv in advs:
            if adv.startswith("gm4_guidebook:"):
              to_remove2.append(thing)
      except Exception as e:
        pass
    for criteria in guidebook["criteria"]:
      if not "player" in guidebook["criteria"][criteria]["conditions"]:
        continue
      for thing in to_remove2:
        if thing in guidebook["criteria"][criteria]["conditions"]["player"]:
          guidebook["criteria"][criteria]["conditions"]["player"].remove(thing)
      if guidebook["criteria"][criteria]["conditions"]["player"] == []:
        del guidebook["criteria"][criteria]["conditions"]["player"]

    for section in guidebook["sections"]:
      if "grants" in section:
        section["grants"] = sorted(section["grants"])
      if "prerequisites" in section:
        section["prerequisites"] = sorted(section["prerequisites"])
      to_remove3 = []
      for page in section["pages"]:
        if page == '':
          to_remove3.append(page)
        if page == '???':
          to_remove3.append(page)
      for page in to_remove3:
        section["pages"].remove(page)
      to_remove3 = []
      if "pages_locked" in section:
        for page in section["pages_locked"]:
          if page == '':
            to_remove3.append(page)
          if page == '???':
            to_remove3.append(page)
        for page in to_remove3:
          section["pages_locked"].remove(page)

    for k, v in enumerate(guidebook["sections"]):
      namedict = {"name": v["name"]}
      guidebook["sections"][k] = namedict | v

    for criteria in list(guidebook["criteria"].keys()):
      guidebook["criteria"][criteria.removeprefix(f"{key}/")] = guidebook["criteria"][criteria]
      del guidebook["criteria"][criteria]

    for section in guidebook["sections"]:
      section["name"] = section["name"].removeprefix(f"{key}/")
      if "grants" in section:
        for index, grant in enumerate(section["grants"]):
          section["grants"][index] = grant.removeprefix(f"{key}/")
      if "prerequisites" in section:
        for prereq in section["prerequisites"]:
          for index, p in enumerate(prereq):
            section["prerequisites"][index] = p.removeprefix(f"{key}/")
      if "requirements" in section:
        for req in section["requirements"]:
          for index, r in enumerate(req):
            req[index] = r.removeprefix(f"{key}/")

    with open(f"{folder}/data/gm4_guidebook/{key}.json", "w") as f:
      json.dump(guidebook, f, indent=2)
