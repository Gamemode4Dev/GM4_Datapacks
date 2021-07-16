# @s = player with expeditious pneuma who stopped sneaking
# run from pneumas/expeditious/attempt

scoreboard players operation randomZ gm4_pneuma_data = randomX gm4_pneuma_data
scoreboard players set #10 gm4_pneuma_data 10
scoreboard players operation randomZ gm4_pneuma_data %= #10 gm4_pneuma_data

scoreboard players operation randomX gm4_pneuma_data %= @a[tag=gm4_expeditious_player,limit=1] gm4_pneuma_data
scoreboard players operation randomZ gm4_pneuma_data %= @a[tag=gm4_expeditious_player,limit=1] gm4_pneuma_data

execute as @e[type=marker,tag=gm4_oa_expeditious,limit=1] at @s run function gm4_orb_of_ankou:pneumas/expeditious/tp_aec
