# @s = player with expeditious pneuma who stopped sneaking
# located at a random distance from player
# run from pneumas/expeditious/tp_aec

# tp if block is safe
execute if block ~ ~ ~ #gm4:no_collision unless block ~ ~-1 ~ #gm4:no_collision run function gm4_orb_of_ankou:pneumas/expeditious/tp_player

# check 1 block down
scoreboard players add set_y gm4_pneuma_data 1
execute unless score set_y gm4_pneuma_data matches 11.. positioned ~ ~-1 ~ run function gm4_orb_of_ankou:pneumas/expeditious/set_ypos
