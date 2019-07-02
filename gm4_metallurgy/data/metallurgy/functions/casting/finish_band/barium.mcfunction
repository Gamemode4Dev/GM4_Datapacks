
data merge entity @s {Tags:[],PickupDelay:30,Item:{tag:{gm4_metallurgy:{has_shamir:1b,ore_type:"barium"},SkullOwner:{Id:"d2ceee89-070e-de20-63fe-f4687bc05eff",Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0ODE2NjM0NTY5OTYsInByb2ZpbGVJZCI6IjkxYTBlZmEyM2QxODQ5Y2ZiM2JkMGExNzdjZjM3Nzg4IiwicHJvZmlsZU5hbWUiOiJEdWNrSnIiLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2ZkNDM2N2QzY2UxMmRlZGMzNGY3YjU5ZGRkYzQ4ZmJlYjQ3MjFhNGQ5M2Q3ZTRkY2FkMjMyNDY5NTBhNzY4In19fQ=="}]}},display:{Name:'{"text":"Obsidian Cast","italic":false}'}}}}
data modify entity @s Item.tag.display.Lore prepend value '{"text":"Shamir","color":"aqua","italic":false}'
data modify entity @s Item.tag.display.Lore prepend value '{"text":"Barium Band","color":"white","italic":false}'

scoreboard players set band_applied gm4_ml_data 1
