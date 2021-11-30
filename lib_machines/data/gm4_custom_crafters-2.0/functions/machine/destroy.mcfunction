# destroys the custom crafter
# @s = custom crafter marker
# located at @s
# run from gm4_custom_crafters-2.0:machine/verify_destroy

# kill entities related to machine block
execute positioned ~ ~-0.4 ~ run kill @e[type=armor_stand,tag=gm4_custom_crafter_stand,limit=1,distance=..0.01]
execute store result score $dropped_item gm4_machine_data run kill @e[type=item,nbt={Age:0s,Item:{id:"minecraft:dropper",Count:1b,tag:{display:{Name:'{"translate":"%1$s%3427655$s","with":[{"translate":"%1$s%3427656$s","with":[{"text":"Custom Crafter","font":"minecraft:default","color":"#373737"},[{"text":"Custom\\u00a0Crafter","font":"gm4:inverted"},{"text":"Custom\\u00a0Crafter","font":"gm4:inverted_spacing"},{"text":"Custom Crafter","font":"gm4:offscreen"},{"translate":"gui.gm4.custom_crafter","font":"gm4:container_gui","color":"white"},{"text":"Custom\\u00a0Crafter","font":"gm4:inverted"},{"text":"Custom\\u00a0Crafter","font":"gm4:inverted_spacing"},{"text":"Custom\\u00a0Crafter","font":"gm4:container_gui","color":"#373737"}]]},{"translate":"%1$s%3427656$s","with":[{"translate":"container.gm4.custom_crafter","font":"minecraft:default","color":"#373737"},[{"translate":"container.gm4.custom_crafter","font":"gm4:inverted"},{"translate":"container.gm4.custom_crafter","font":"gm4:inverted_spacing"},{"translate":"container.gm4.custom_crafter","font":"gm4:offscreen"},{"translate":"gui.gm4.custom_crafter","font":"gm4:container_gui","color":"white"},{"translate":"container.gm4.custom_crafter","font":"gm4:inverted"},{"translate":"container.gm4.custom_crafter","font":"gm4:inverted_spacing"},{"translate":"container.gm4.custom_crafter","font":"gm4:container_gui","color":"#373737"}]]}]}'}}}},limit=1,sort=nearest]
kill @s

# drop item (unless broken in creative mode)
particle block crafting_table ~ ~ ~ .1 .25 .1 .05 30 normal @a
execute if score $dropped_item gm4_machine_data matches 1 run loot spawn ~ ~ ~ loot gm4_custom_crafters-2.0:items/custom_crafter
