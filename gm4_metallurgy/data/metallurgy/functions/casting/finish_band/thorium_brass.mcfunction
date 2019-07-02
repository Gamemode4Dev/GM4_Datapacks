
data merge entity @s {Tags:[],PickupDelay:30,Item:{tag:{gm4_metallurgy:{has_shamir:1b,ore_type:"thorium_brass"},SkullOwner:{Id:"b0a5c009-2751-9bf2-7d48-befc27779770",Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0ODg0NjY1NTQzODUsInByb2ZpbGVJZCI6IjkxYTBlZmEyM2QxODQ5Y2ZiM2JkMGExNzdjZjM3Nzg4IiwicHJvZmlsZU5hbWUiOiJEdWNrSnIiLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZDk2ZWJmMzMxZmQ1MzM3MjM0ZmU0OTM2ZWMyOTU2NTI4ZDQ3N2FiYTU4NzU5YmM2ZWIyODRiMmU5MmQxNDI4In19fQ=="}]}},display:{Name:'{"text":"Obsidian Cast","italic":false}'}}}}
data modify entity @s Item.tag.display.Lore prepend value '{"text":"Shamir","color":"aqua","italic":false}'
data modify entity @s Item.tag.display.Lore prepend value '{"text":"Thorium Brass Band","color":"dark_green","italic":false}'

scoreboard players set band_applied gm4_ml_data 1
