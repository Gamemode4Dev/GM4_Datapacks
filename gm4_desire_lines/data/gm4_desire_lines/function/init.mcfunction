scoreboard objectives add gm4_desire_lines dummy
scoreboard objectives add gm4_dl_affcoarse dummy

# constants
scoreboard players set #base_probability gm4_desire_lines 1
scoreboard players set #sneak_penality gm4_desire_lines -5
scoreboard players set #sprint_penalty gm4_desire_lines 1
scoreboard players set #impact_penalty gm4_desire_lines 31

# considerations
# walking speed = 4.317 blocks/s ~ 4.63 ticks / block
# sprinting speed = 5.612 blocks/s ~ 3.56 ticks / block
# walking ~ 1 - (0.99)^4.63 = 0.045 ~ 5% chance to convert each block
# sprinting ~ 1 - (0.98)^3.56 = 0.069 ~ 7% chance to convert each block

execute unless score desire_lines gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Desire Lines"}
execute unless score desire_lines gm4_earliest_version < desire_lines gm4_modules run scoreboard players operation desire_lines gm4_earliest_version = desire_lines gm4_modules
scoreboard players set desire_lines gm4_modules 1

schedule function gm4_desire_lines:tick 1t

#$moduleUpdateList
