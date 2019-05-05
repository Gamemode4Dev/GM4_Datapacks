#checks dispensers around firework
#@s - @e[type=minecraft:firework_rocket,tag=!gm4_df_modified]
#called by dispenser_fireworks:pulse_check

#check dispensers
execute if block ~ ~ ~ minecraft:dispenser[triggered=true,facing=up] run function dispenser_fireworks:direction/up
execute if block ~ ~ ~ minecraft:dispenser[triggered=true,facing=down] run function dispenser_fireworks:direction/down
execute if block ~ ~ ~1 minecraft:dispenser[triggered=true,facing=north] run function dispenser_fireworks:direction/north
execute if block ~ ~ ~-1 minecraft:dispenser[triggered=true,facing=south] run function dispenser_fireworks:direction/south
execute if block ~-1 ~ ~ minecraft:dispenser[triggered=true,facing=east] run function dispenser_fireworks:direction/east
execute if block ~1 ~ ~ minecraft:dispenser[triggered=true,facing=west] run function dispenser_fireworks:direction/west

#if more than one dispenser, go up
execute if score @s gm4_df_mod_count matches 2.. run function dispenser_fireworks:direction/up

#reset scores
scoreboard players reset @s gm4_df_mod_count

#prevent re-appliance
tag @s add gm4_df_ignore
