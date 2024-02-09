# process active burn armor
# @s = player with active burn armor
# at @s
# run from armor/modifier/type/burn/clock

# stop effect if player is no longer wearing the armor
scoreboard players set @s[predicate=!gm4_combat_expanded:modified_armor/burn] gm4_ce_burning.duration 0
scoreboard players reset @s[scores={gm4_ce_burning.duration=0}] gm4_ce_burning.level
execute if score @s gm4_ce_burning.duration matches 0 run return 0

# keep clock going
scoreboard players set $keep_tick.burn gm4_ce_data 1

# reduce duration
scoreboard players remove @s gm4_ce_burning.duration 1
execute store success score $full_burn gm4_ce_data if score @s gm4_ce_burning.level matches 8..

##TODO: scale with 1.5x attack range (1.20.5)

# particles
execute positioned ~ ~.9 ~ summon marker at @s run function gm4_combat_expanded:armor/modifier/type/burn/particles
playsound minecraft:block.fire.ambient player @s ~ ~ ~ 0.5 1
execute if score $full_burn gm4_ce_data matches 1 run playsound minecraft:block.fire.ambient player @s ~ ~ ~ 1 0.5

# fire damage to nearby entities
execute store result storage gm4_combat_expanded:temp burn.damage float 0.25 run scoreboard players get @s gm4_ce_burning.level
tag @s add gm4_ce_self
execute as @e[tag=!gm4_ce_self,type=!#gm4_combat_expanded:effect_immune,predicate=!gm4_combat_expanded:modified_armor/burn,predicate=gm4_combat_expanded:technical/pvp_able,team=!gm4_ce_team_check,tag=!smithed.strict,distance=..5.25] at @s run function gm4_combat_expanded:armor/modifier/type/burn/eval with storage gm4_combat_expanded:temp burn
tag @s remove gm4_ce_self
data remove storage gm4_combat_expanded:temp burn

# remove level if duration ran out
scoreboard players reset @s[scores={gm4_ce_burning.duration=0}] gm4_ce_burning.level
