#@s = obsidian that needs to become a shamir Band
#run from remove_band
data remove entity @s Item.tag
data merge entity @s {Item:{id:"minecraft:player_head",tag:{gm4_metallurgy:{has_shamir:1b,stored_shamir:"gemini",ore_type:"barimium"},SkullOwner:{Id: "ebb11c53-5ae5-d38f-0303-7eea8bdd1684",Properties:{textures:[{Value: "eyJ0aW1lc3RhbXAiOjE0ODg0Njc2MDc5ODMsInByb2ZpbGVJZCI6IjkxYTBlZmEyM2QxODQ5Y2ZiM2JkMGExNzdjZjM3Nzg4IiwicHJvZmlsZU5hbWUiOiJEdWNrSnIiLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZTg1M2IxMWFiYmYxN2UzOGVhZTRiMjFmNGZlYzRmZmE3ZTczZDBmZTRlMjcxOTZjOWJkNTdkMzdiZGUyOTZkYyJ9fX0="}]}},display:{Name:'{"text":"Obsidian Cast","italic":False}',Lore:['{"text":"Barimium Band","color":"light_purple","italic":false}','{"text":"Shamir","color":"aqua","italic":false}','{"text":"Gemini","color":"gray","italic":false}']}}}}
scoreboard players set valid_obsidian gm4_ml_data 1
