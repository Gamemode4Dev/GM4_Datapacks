
data merge entity @s {Tags:[],PickupDelay:30,Item:{tag:{gm4_metallurgy:{has_shamir:1b,ore_type:"aluminium"},SkullOwner:{Id:"74e6f9f4-5d04-f326-34cd-c85a36919aab",Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0ODE2NjMyMjQ2MTUsInByb2ZpbGVJZCI6IjkxYTBlZmEyM2QxODQ5Y2ZiM2JkMGExNzdjZjM3Nzg4IiwicHJvZmlsZU5hbWUiOiJEdWNrSnIiLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTc5ZWRhYmI2MjU1YzhkMjQyOWE3ZTUzM2U4MzUxOWE4NjVhNTk0ZGJmMTRhMTdjZjVhYzIxMzUzYTM5N2U3In19fQ=="}]}},display:{Name:'{"translate":"%1$s%3427655$s","with":["Obsidian Cast",{"translate":"item.gm4.metallurgy.obsidian_cast"}],"italic":false}'}}}}
data modify entity @s Item.tag.display.Lore prepend value '{"translate":"%1$s%3427655$s","with":["Shamir",{"translate":"item.gm4.metallurgy.shamir"}],"italic":false,"color":"aqua"}'
data modify entity @s Item.tag.display.Lore prepend value '{"translate":"%1$s%3427655$s","with":["Aluminium Band",{"translate":"item.gm4.metallurgy.band","with":[{"translate":"item.gm4.metallurgy.aluminium"}]}],"italic":false,"color":"red"}'

scoreboard players set band_applied gm4_ml_data 1
