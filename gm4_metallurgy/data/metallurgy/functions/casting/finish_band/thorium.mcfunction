
data merge entity @s {Tags:[],PickupDelay:30,Item:{tag:{gm4_metallurgy:{has_shamir:1b,ore_type:"thorium"},SkullOwner:{Id:"65decca6-cb7a-f161-ee5c-53495f7ef65b",Properties:{textures:[{Value: "eyJ0aW1lc3RhbXAiOjE0ODE2NjM1MTAwNzIsInByb2ZpbGVJZCI6IjkxYTBlZmEyM2QxODQ5Y2ZiM2JkMGExNzdjZjM3Nzg4IiwicHJvZmlsZU5hbWUiOiJEdWNrSnIiLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvOTYzOTJhNmQ5OWY5MzE5ZWU3YzRmNGMxYTE5NzQ5ZDY4N2NkY2M4ZWVjOGZjNjY4ZTczZDM3YTZkYWY3N2EifX19"}]}},display:{Name:'{"translate":"%1$s%3427655$s","with":["Obsidian Cast",{"translate":"item.gm4.metallurgy.obsidian_cast"}],"italic":false}'}}}}
data modify entity @s Item.tag.display.Lore prepend value '{"translate":"%1$s%3427655$s","with":["Shamir",{"translate":"item.gm4.metallurgy.shamir"}],"italic":false,"color":"aqua"}'
data modify entity @s Item.tag.display.Lore prepend value '{"translate":"%1$s%3427655$s","with":["Thorium Band",{"translate":"item.gm4.metallurgy.band","with":[{"translate":"item.gm4.metallurgy.thorium"}]}],"italic":false,"color":"dark_gray"}'

scoreboard players set band_applied gm4_ml_data 1
