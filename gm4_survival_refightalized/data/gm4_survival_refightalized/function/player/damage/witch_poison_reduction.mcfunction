# reduce poison duration from witch potions
# @s = damaged player
# at @s
# run from player/damage/run

# get effect data
data modify storage gm4_survival_refightalized:temp active_effects set from entity @s active_effects
execute store result score $poison.amplifier gm4_sr_data run data get storage gm4_survival_refightalized:temp active_effects[{id:"minecraft:poison"}].amplifier
execute store result score $poison.duration gm4_sr_data run data get storage gm4_survival_refightalized:temp active_effects[{id:"minecraft:poison"}].duration

# dont run if there is a stronger poison running
execute unless score $poison.amplifier gm4_sr_data matches 0 run return 0
execute unless score $poison.duration gm4_sr_data matches ..900 run return 0

# reapply shorter poison by dividing duration by 3 (60 as it is in ticks), at least 2 seconds
effect clear @s poison
scoreboard players operation $poison.duration gm4_sr_data /= #60 gm4_sr_data
execute if score $poison.duration gm4_sr_data matches 15.. run return run effect give @s poison 15 0
execute if score $poison.duration gm4_sr_data matches 14 run return run effect give @s poison 14 0
execute if score $poison.duration gm4_sr_data matches 13 run return run effect give @s poison 13 0
execute if score $poison.duration gm4_sr_data matches 12 run return run effect give @s poison 12 0
execute if score $poison.duration gm4_sr_data matches 11 run return run effect give @s poison 11 0
execute if score $poison.duration gm4_sr_data matches 10 run return run effect give @s poison 10 0
execute if score $poison.duration gm4_sr_data matches 9 run return run effect give @s poison 9 0
execute if score $poison.duration gm4_sr_data matches 8 run return run effect give @s poison 8 0
execute if score $poison.duration gm4_sr_data matches 7 run return run effect give @s poison 7 0
execute if score $poison.duration gm4_sr_data matches 6 run return run effect give @s poison 6 0
execute if score $poison.duration gm4_sr_data matches 5 run return run effect give @s poison 5 0
execute if score $poison.duration gm4_sr_data matches 4 run return run effect give @s poison 4 0
execute if score $poison.duration gm4_sr_data matches 3 run return run effect give @s poison 3 0
execute if score $poison.duration gm4_sr_data matches ..2 run effect give @s poison 2 0
