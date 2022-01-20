# destroys the smeltery
# @s = smeltery marker
# located at @s
# run from gm4_smelteries:machine/verify_destroy

# kill entities related to machine block
execute positioned ~ ~-0.3 ~ run kill @e[type=armor_stand,tag=gm4_smeltery_stand,limit=1,distance=..0.01]
scoreboard players operation $current gm4_smelt_id = @s gm4_smelt_id
execute positioned ^ ^-1.5 ^-1 as @e[type=armor_stand,tag=gm4_smeltery_cauldron,limit=1,distance=..0.01] if score @s gm4_smelt_id = $current gm4_smelt_id run kill @s
execute store result score $dropped_item gm4_machine_data run kill @e[type=item,distance=..1,nbt={Age:0s,Item:{id:"minecraft:furnace",Count:1b,tag:{display:{Name:'{"translate":"%1$s%3427655$s","with":[{"translate":"%1$s%3427656$s","with":[{"text":"Smeltery","font":"minecraft:default","color":"#373737"},[{"text":"Smeltery","font":"gm4:half_scale"},{"text":"Smeltery","font":"gm4:inverted"},{"text":"Smeltery","font":"gm4:inverted_spacing"},{"text":"Smeltery","font":"gm4:offscreen"},{"translate":"gui.gm4.smeltery","font":"gm4:container_gui","color":"white"},{"text":"Smeltery","font":"gm4:half_scale"},{"text":"Smeltery","font":"gm4:inverted"},{"text":"Smeltery","font":"gm4:inverted_spacing"},{"text":"Smeltery","font":"minecraft:default","color":"#373737"}]]},{"translate":"%1$s%3427656$s","with":[{"translate":"container.gm4.smeltery","font":"minecraft:default","color":"#373737"},[{"translate":"container.gm4.smeltery","font":"gm4:half_scale"},{"translate":"container.gm4.smeltery","font":"gm4:inverted"},{"translate":"container.gm4.smeltery","font":"gm4:inverted_spacing"},{"translate":"container.gm4.smeltery","font":"gm4:offscreen"},{"translate":"gui.gm4.smeltery","font":"gm4:container_gui","color":"white"},{"translate":"container.gm4.smeltery","font":"gm4:half_scale"},{"translate":"container.gm4.smeltery","font":"gm4:inverted"},{"translate":"container.gm4.smeltery","font":"gm4:inverted_spacing"},{"translate":"container.gm4.smeltery","font":"minecraft:default","color":"#373737"}]]}]}'}}}},limit=1,sort=nearest]
kill @s

# drop item (unless broken in creative mode)
execute if score $dropped_item gm4_machine_data matches 1 run loot spawn ~ ~ ~ loot gm4_smelteries:items/smeltery
