# @s = player that has lost soul fragments
# at @s
# from submain

# manage regeneration
execute if score @s gm4_sf_fragments matches 1..9 run scoreboard players add @s gm4_sf_timer 1
execute if score @s gm4_sf_timer matches 6750 at @s run function gm4_soul_fragments:intake_fragment
