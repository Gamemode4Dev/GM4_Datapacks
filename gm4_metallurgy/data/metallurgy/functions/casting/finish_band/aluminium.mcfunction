
data merge entity @s {PickupDelay:30,Item:{tag:{gm4_metallurgy:{has_shamir:1b,ore_type:"aluminium"},SkullOwner:{Id:"74e6f9f4-5d04-f326-34cd-c85a36919aab",Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0ODE2NjMyMjQ2MTUsInByb2ZpbGVJZCI6IjkxYTBlZmEyM2QxODQ5Y2ZiM2JkMGExNzdjZjM3Nzg4IiwicHJvZmlsZU5hbWUiOiJEdWNrSnIiLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTc5ZWRhYmI2MjU1YzhkMjQyOWE3ZTUzM2U4MzUxOWE4NjVhNTk0ZGJmMTRhMTdjZjVhYzIxMzUzYTM5N2U3In19fQ=="}]}},display:{Name:'{"text":"Obsidian Cast","italic":False}'}}}}
data modify entity @s Item.tag.display.Lore prepend value '{"text":"Shamir","color":"aqua","italic":false}'
data modify entity @s Item.tag.display.Lore prepend value '{"text":"Aluminium Band","color":"red","italic":false}'

scoreboard players set band_applied gm4_ml_data 1
tag @s remove gm4_ml_band
