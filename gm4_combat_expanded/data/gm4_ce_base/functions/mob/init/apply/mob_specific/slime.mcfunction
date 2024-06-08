
# set size
execute if score $size gm4_ce_data matches 0 run scoreboard players set $mob_health gm4_ce_data 0
execute if score $size gm4_ce_data matches 2 run attribute @s generic.attack_damage base set 3
execute if score $size gm4_ce_data matches 3 run attribute @s generic.attack_damage base set 4
execute if score $size gm4_ce_data matches 4 run attribute @s generic.attack_damage base set 5
execute store result entity @s Size int 1 run scoreboard players get $size gm4_ce_data
