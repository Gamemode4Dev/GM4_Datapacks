# reduce poison duration from cave spider attacks
# @s = damaged player
# at @s
# run from player/health/damaged/run

# dont run on easy, no poison applied
execute store result score $worlddiff gm4_sr_data run difficulty
execute if score $worlddiff gm4_sr_data matches 1 run return 0

# get effect data
data modify storage gm4_survival_refightalized:temp active_effects set from entity @s active_effects
execute store result score $poison.amplifier gm4_sr_data run data get storage gm4_survival_refightalized:temp active_effects[{id:"minecraft:poison"}].amplifier
execute store result score $poison.duration gm4_sr_data run data get storage gm4_survival_refightalized:temp active_effects[{id:"minecraft:poison"}].duration

# dont run if there is a stronger poison running
execute unless score $poison.amplifier gm4_sr_data matches 0 run return 0
execute unless score $poison.duration gm4_sr_data matches 299 unless score $poison.duration gm4_sr_data matches 139 run return 0

# reapply weaker poison, 1 damage for normal, 2 damage for hard
effect clear @s poison
execute if score $worlddiff gm4_sr_data matches 2 run effect give @s poison 2 0
execute if score $worlddiff gm4_sr_data matches 3 run effect give @s poison 4 0
