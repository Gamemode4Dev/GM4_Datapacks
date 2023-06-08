scoreboard objectives add gm4_armor armor
scoreboard objectives add gm4_armor_weight dummy

execute unless score weighted_armour gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Weighted Armour"}
scoreboard players set weighted_armour gm4_modules 1

data remove storage gm4_player_heads:register heads[{id:"gm4_helious_shamir:band/v0"}]

# register shamir with lib_player_heads
execute unless data storage gm4_player_heads:register heads[{id:"gm4_helious_shamir:band/v1"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_helious_shamir:band/v1",name:"[Drop to Fix Item] gm4_helious_shamir:band/v0",item:{gm4_metallurgy:{has_shamir:1b,stored_shamir:"helious",metal:{type:"aluminium",amount:[12s],castable:1b},item:"obsidian_cast"},SkullOwner:{Id:[I;1961294324,1560605478,885901402,915511979],Properties:{textures:[{Value:"ewogICJ0aW1lc3RhbXAiIDogMTYyODc4ODAzNjY3NCwKICAicHJvZmlsZUlkIiA6ICI2MjM5ZWRhM2ExY2Y0YjJiYWMyODk2NGQ0NmNlOWVhOSIsCiAgInByb2ZpbGVOYW1lIiA6ICJGYXRGYXRHb2QiLAogICJzaWduYXR1cmVSZXF1aXJlZCIgOiB0cnVlLAogICJ0ZXh0dXJlcyIgOiB7CiAgICAiU0tJTiIgOiB7CiAgICAgICJ1cmwiIDogImh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNGQ3MTQ5OTY0MDNlMTNhNGE4ZTc4OTQ0OWNjN2I5OGRhMmI4NDc1NTRjNDgwZGUyMDUxOTcwYjIxODIzZGJkOSIKICAgIH0KICB9Cn0="}]}},CustomModelData:3420103,display:{Name:'{"italic":false,"translate":"item.gm4.metallurgy.obsidian_cast","fallback":"Obsidian Cast"}',Lore:['{"italic":false,"color":"#F47989","translate":"item.gm4.metallurgy.band","fallback":"Aluminium Band","with":[{"translate":"item.gm4.metallurgy.aluminium"}]}','{"italic":false,"color":"aqua","translate":"item.gm4.metallurgy.shamir","fallback":"Shamir"}','{"italic":false,"color":"gray","translate":"item.gm4.shamir.helious","fallback":"Helious"}']}}}

schedule function gm4_weighted_armour:main 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 4776.242502981829 ~ {CustomName:'"gm4_weighted_armour_guide"',Tags:["gm4_guide"],data:{type:"module",id:"weighted_armour",page_count:1,line_count:1,module_name:"Weighted Armour"}}
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 1688.746464910336 ~ {CustomName:'"gm4_helious_shamir_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"metallurgy",id:"helious_shamir",page_count:2,line_count:1,module_name:"Helious Shamir"}}

#$moduleUpdateList
