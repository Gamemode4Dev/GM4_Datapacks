# @s = (survival/adventure) player hit by sonic boom
# run from pneumas/shrieking/boom

tag @s add gm4_oa_magic_ignore
tag @s add gm4_oa_magic_damaged
schedule function gm4_orb_of_ankou:pneumas/temp_tick/magic_damaged 1t

execute store result score $player_health gm4_pneuma_data run data get entity @s Health 100
execute if score $player_health gm4_pneuma_data matches ..1200 run function gm4_orb_of_ankou:pneumas/shrieking/player_death

effect give @s instant_damage 1 1
