# add absorption to player that got hit (red health hits only)
# @s = player wearing armor
# at @s
# run from armor/trigger/armor_break

# store armor items to storage
item replace block 29999998 1 7134 container.0 from entity @s armor.head
item replace block 29999998 1 7134 container.1 from entity @s armor.chest
item replace block 29999998 1 7134 container.2 from entity @s armor.legs
item replace block 29999998 1 7134 container.3 from entity @s armor.feet
data modify storage gm4_augmented_armor:temp Items set from block 29999998 1 7134 Items
data remove block 29999998 1 7134 Items

# playsound

function gm4_survival_refightalized:player/health/calculate_hp

# add levels together
scoreboard players set $total_level gm4_aa_data 0

scoreboard players set $level gm4_aa_data 0
execute if data storage gm4_augmented_armor:temp Items[{Slot:0b}].components."minecraft:custom_data".gm4_augmented_armor{augment:{name:reactive}} store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:0b}].components."minecraft:custom_data".gm4_augmented_armor.levels[0]
scoreboard players operation $total_level gm4_aa_data += $level gm4_aa_data

scoreboard players set $level gm4_aa_data 0
execute if data storage gm4_augmented_armor:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_augmented_armor{augment:{name:reactive}} store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_augmented_armor.levels[0]
scoreboard players operation $total_level gm4_aa_data += $level gm4_aa_data

scoreboard players set $level gm4_aa_data 0
execute if data storage gm4_augmented_armor:temp Items[{Slot:2b}].components."minecraft:custom_data".gm4_augmented_armor{augment:{name:reactive}} store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:2b}].components."minecraft:custom_data".gm4_augmented_armor.levels[0]
scoreboard players operation $total_level gm4_aa_data += $level gm4_aa_data

scoreboard players set $level gm4_aa_data 0
execute if data storage gm4_augmented_armor:temp Items[{Slot:3b}].components."minecraft:custom_data".gm4_augmented_armor{augment:{name:reactive}} store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp Items[{Slot:3b}].components."minecraft:custom_data".gm4_augmented_armor.levels[0]
scoreboard players operation $total_level gm4_aa_data += $level gm4_aa_data

# get total percentage of max health that should be added as absorption
scoreboard players operation $reactive.add_absorption gm4_aa_data = @s gm4_sr_health.max
scoreboard players operation $reactive.add_absorption gm4_aa_data *= $total_level gm4_aa_data
scoreboard players operation $reactive.add_absorption gm4_aa_data /= #100 gm4_aa_data

# get player absorption amount and add the added absorption
scoreboard players operation $target_absorption_hearts gm4_aa_data = @s gm4_sr_health.absorption
scoreboard players operation $target_absorption_hearts gm4_aa_data += $reactive.add_absorption gm4_aa_data

# check what level of absorption would do this and apply it
scoreboard players operation $apply_absorption_level gm4_aa_data = $target_absorption_hearts gm4_aa_data
scoreboard players add $apply_absorption_level gm4_aa_data 3
scoreboard players operation $apply_absorption_level gm4_aa_data /= #4 gm4_aa_data

# check how many extra hearts this gives the player, add to absorption damage taken
scoreboard players operation $actual_absorption_hearts gm4_aa_data = $apply_absorption_level gm4_aa_data
scoreboard players operation $actual_absorption_hearts gm4_aa_data *= #4 gm4_aa_data
scoreboard players operation $target_absorption_hearts gm4_aa_data -= $actual_absorption_hearts gm4_aa_data
scoreboard players operation $damage_absorption gm4_sr_data -= $target_absorption_hearts gm4_aa_data

# set the absorption level, to be reduced from gm4_survival_refightalized:player/health/damaged/calculate_damage later this tick
execute store result storage gm4_augmented_armor:temp absorption.level int 1 run scoreboard players remove $apply_absorption_level gm4_aa_data 1
function gm4_augmented_armor:armor/augment/type/reactive/eval_absorption with storage gm4_augmented_armor:temp absorption
data remove storage gm4_augmented_armor:temp absorption

# recalc absorption health
scoreboard players operation @s gm4_sr_health.absorption_max = $actual_absorption_hearts gm4_aa_data
scoreboard players operation @s gm4_sr_health.absorption = @s gm4_sr_health.absorption_max

# dev log
tellraw @s[tag=gm4_sr_dev] [{"text":" - Reactive Absorption: +","color":"gray"},{"score":{"name":"$reactive.add_absorption","objective":"gm4_aa_data"},"color":"white"},{"text":" (","color":"dark_gray"},{"score":{"name":"$actual_absorption_hearts","objective":"gm4_aa_data"},"color":"dark_gray"},{"text":")","color":"dark_gray"}]
