# @s = slime if there are any nearby slimes
# called by event

# store size of all nearby slimes
execute as @e[type=minecraft:slime,tag=!smithed.entity,distance=..3] store result score @s gm4_menace_data run data get entity @s Size

# choose one random slime with the same size
execute as @e[type=minecraft:slime,tag=!smithed.entity,distance=0.01..3] if score @s gm4_menace_data = @e[type=minecraft:slime,distance=0,limit=1] gm4_menace_data run tag @s add gm4_slime_size_match
tag @e[type=minecraft:slime,tag=gm4_slime_size_match,limit=1,sort=random] add gm4_merged_slime
tag @e[type=minecraft:slime,distance=..3] remove gm4_slime_size_match

# kill original slime
execute if entity @e[type=minecraft:slime,tag=gm4_merged_slime,limit=1] run function gm4_slime_fests:complete_merge

# calculations for size and health
## size = (current_size * 2) + 1
scoreboard players operation size gm4_menace_data = @s gm4_menace_data
scoreboard players operation size gm4_menace_data *= 2 gm4_menace_data
scoreboard players add size gm4_menace_data 1
## health = (new_size + 1)^2 
scoreboard players operation health gm4_menace_data = size gm4_menace_data
scoreboard players add health gm4_menace_data 1
scoreboard players operation health gm4_menace_data *= health gm4_menace_data

# apply size to new merged slime
execute store result entity @e[type=minecraft:slime,tag=gm4_merged_slime,limit=1] Size int 1 run scoreboard players get size gm4_menace_data
execute if score size gm4_menace_data matches 7.. run tag @e[type=minecraft:slime,tag=gm4_merged_slime,limit=1] add gm4_giant_slime
data merge entity @e[type=minecraft:slime,tag=gm4_merged_slime,tag=gm4_giant_slime,limit=1] {DeathLootTable:"gm4_slime_fests:entities/giant_slime"}

# apply health and attack damage to new merged slime
execute store result entity @e[type=minecraft:slime,tag=gm4_merged_slime,limit=1] Attributes[{Name:"minecraft:generic.max_health"}].Base double 1 run scoreboard players get health gm4_menace_data
execute store result entity @e[type=minecraft:slime,tag=gm4_merged_slime,limit=1] Health float 1 run scoreboard players get health gm4_menace_data
execute store result entity @e[type=minecraft:slime,tag=gm4_merged_slime,limit=1] Attributes[{Name:"minecraft:generic.attack_damage"}].Base double 1 run scoreboard players get health gm4_menace_data
