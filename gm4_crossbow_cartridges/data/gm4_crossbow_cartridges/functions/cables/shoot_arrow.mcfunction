#@s refers to player shooting the arrow
#run from advancement shot_spooled_crossbow

#give advancement
#advancement grant @s only gm4:almost_a_grappling_hook

execute as @a run function gm4_crossbow_cartridges:cables/update_scoreboards

#gm4_rot_y -20..20 means looking relatively near to horizon
execute at @s if score @s gm4_rot_x matches -15..15 if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:string"}]}] if block ~ ~1 ~ minecraft:tripwire_hook run function gm4_crossbow_cartridges:cables/determine_direction
#execute at @s if score @s gm4_rot_x matches -15..15 if entity @s[gamemode=creative] run function gm4_crossbow_cartridges:cables/determine_direction
