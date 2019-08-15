#@s refers to player shooting the arrow
#run from advancement shot_spooled_crossbow

#reset advancement
advancement revoke @s only roped_arrows:shot_crossbow

#give advancement
advancement grant @s only gm4:almost_a_grappling_hook

#gm4_rot_y -20..20 means looking relatively near to horizon
execute at @s if score @s gm4_rot_x matches -20..20 if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:string"}]}] run function roped_arrows:determine_direction
execute at @s if score @s gm4_rot_x matches -20..20 if entity @s[gamemode=creative] run function roped_arrows:determine_direction