# @s = none
# at world spawn
# called by mysterious midnights base if this expansion was selected. pulsed every 0.8 seconds throughout the night.

# slow clock for falling star spawning
scoreboard players add $shower_clock gm4_fstar_decay 1
execute if score $shower_clock gm4_fstar_decay matches 150.. run function gm4_falling_stars:star_shower

# hatch endermite eggs
execute as @e[type=item,tag=gm4_endermite_star,nbt={OnGround:1b}] at @s run function gm4_falling_stars:hatch_endermite

# decay all falling star entities (saftey cap)
execute as @e[type=potion,tag=gm4_falling_star] at @s run function gm4_falling_stars:falling_star/decay
