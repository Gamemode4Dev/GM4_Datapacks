# effects after a sucessful place
# @s = player that interacts with a rcd interaction while holding ladder
# at @s
# run from function: gm4_rope_ladders:mechanics/ladder_placement/interact_right_click_detection

# sound
playsound minecraft:block.ladder.place ambient @a[distance=..15] ~ ~ ~

# remove 1 ladder from players hand
execute store success score $mainhand gm4_rol_data if items entity @s weapon.mainhand ladder
execute if score $mainhand gm4_rol_data matches 1 run item modify entity @s[gamemode=!creative] weapon.mainhand {"function": "minecraft:set_count","count": -1,"add": true}
execute if score $mainhand gm4_rol_data matches 0 run item modify entity @s[gamemode=!creative] weapon.offhand {"function": "minecraft:set_count","count": -1,"add": true}

# grant advancement
advancement grant @s only gm4:rope_ladders
