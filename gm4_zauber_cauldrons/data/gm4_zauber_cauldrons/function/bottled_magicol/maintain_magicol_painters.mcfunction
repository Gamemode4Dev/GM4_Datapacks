# Maintains magicol painters during their painting animation
# @s = none
# at world spawn
# scheduled by bottled_magicol/<color>/<weather_modifier> functions when a magicol potion hits the ground

execute as @e[type=marker,tag=gm4_zc_magicol_painter] at @s run function gm4_zauber_cauldrons:bottled_magicol/age_painters

# reschedule
execute if score $found_painter gm4_zc_data matches 1.. run schedule function gm4_zauber_cauldrons:bottled_magicol/maintain_magicol_painters 1t
scoreboard players reset $found_painter gm4_zc_data
