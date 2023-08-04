# executes commands as all potion entities
# @s = all potion entities
# located at world spawn
# run from gm4_potion_tracking-1.0:tick

# allow modules to check if potions should be tracked
execute if entity @s[tag=!gm4_potion_tracking_checked] run function gm4_potion_tracking:track/check_potion

# track custom potions
execute if entity @s[tag=gm4_potion] at @s run function gm4_potion_tracking:track/potion
