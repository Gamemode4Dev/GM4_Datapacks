scoreboard objectives add gm4_dl_random dummy
scoreboard objectives add gm4_desire_lines minecraft.custom:minecraft.walk_one_cm
scoreboard objectives add gm4_dl_sprint minecraft.custom:minecraft.sprint_one_cm
scoreboard objectives add gm4_dl_affcoarse dummy

execute unless score desire_lines gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Desire Lines"}
scoreboard players set desire_lines gm4_modules 1

data remove storage gm4_player_heads:register heads[{id:"gm4_celaro_shamir:band/v0"}]

# register shamir with lib_player_heads
execute unless data storage gm4_player_heads:register heads[{id:"gm4_celaro_shamir:band/v1"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_celaro_shamir:band/v1",name:"[Drop to Fix Item] gm4_celaro_shamir:band/v0",item:{gm4_metallurgy:{has_shamir:1b,stored_shamir:"celaro",metal:{type:"aluminium",amount:[12s],castable:1b},item:"obsidian_cast"},SkullOwner:{Id:[I;1961294324,1560605478,885901402,915511979],Properties:{textures:[{Value:"ewogICJ0aW1lc3RhbXAiIDogMTYyODc4ODAzNjY3NCwKICAicHJvZmlsZUlkIiA6ICI2MjM5ZWRhM2ExY2Y0YjJiYWMyODk2NGQ0NmNlOWVhOSIsCiAgInByb2ZpbGVOYW1lIiA6ICJGYXRGYXRHb2QiLAogICJzaWduYXR1cmVSZXF1aXJlZCIgOiB0cnVlLAogICJ0ZXh0dXJlcyIgOiB7CiAgICAiU0tJTiIgOiB7CiAgICAgICJ1cmwiIDogImh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNGQ3MTQ5OTY0MDNlMTNhNGE4ZTc4OTQ0OWNjN2I5OGRhMmI4NDc1NTRjNDgwZGUyMDUxOTcwYjIxODIzZGJkOSIKICAgIH0KICB9Cn0="}]}},CustomModelData:3420118,display:{Name:'{"italic":false,"translate":"item.gm4.metallurgy.obsidian_cast","fallback":"Obsidian Cast"}',Lore:['{"italic":false,"color":"#F47989","translate":"item.gm4.metallurgy.band","fallback":"Aluminium Band","with":[{"translate":"item.gm4.metallurgy.aluminium"}]}','{"italic":false,"color":"aqua","translate":"item.gm4.metallurgy.shamir","fallback":"Shamir"}','{"italic":false,"color":"gray","translate":"item.gm4.shamir.celaro","fallback":"Celaro"}']}}}

schedule function gm4_desire_lines:tick 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 867.159872053633 ~ {CustomName:'"gm4_desire_lines_guide"',Tags:["gm4_guide"],data:{type:"module",id:"desire_lines",page_count:2,line_count:1,module_name:"Desire Lines"}}
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 659.208197558196 ~ {CustomName:'"gm4_celaro_shamir_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"metallurgy",id:"celaro_shamir",page_count:2,line_count:1,module_name:"Celaro Shamir"}}

#$moduleUpdateList
