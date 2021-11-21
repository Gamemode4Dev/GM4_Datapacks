# finds custom gm4 potions
# @s = forceloaded command block 
# located at 29999998 1 7131
# run from gm4_potion_tracking-1.0:resolve_tick

# function tag so modules can tag their custom potions (should add the "gm4_potion" tag)
execute as @e[type=potion,tag=!gm4_potion_tracking_checked] run function #gm4_potion_tracking:tag_potion
tag @e[type=potion] add gm4_potion_tracking_checked

# track custom potions
execute as @e[type=potion,tag=gm4_potion] at @s run function gm4_potion_tracking-1.0:track/potion
