# check if wolf has matching armor equipped by player
# @s = wolf from canine armor
# at unspecified
# run from main

# despawn wolf if it was not matched to armor this check
execute if score @s gm4_ae_t_wolf matches 0 at @s run function gm4_armor_expanded:armor/modifier/type/canine/wolf_kill
scoreboard players set @s gm4_ae_t_wolf 0