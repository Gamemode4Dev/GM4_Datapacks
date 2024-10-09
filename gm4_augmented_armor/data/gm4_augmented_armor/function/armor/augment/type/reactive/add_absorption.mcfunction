
tellraw @s[tag=gm4_sr_dev] [{"text":" - Reactive Absorption: +","color":"gray"},{"score":{"name":"$reactive.add_absorption","objective":"gm4_aa_data"},"color":"white"}]

# playsound


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
scoreboard players operation $damage_absorption gm4_sr_data += $target_absorption_hearts gm4_aa_data

# if player was not going to be damaged make sure they are
execute unless score @s gm4_sr_stat.damage_resisted matches 1.. run scoreboard players set @s gm4_sr_stat.damage_resisted 1

# apply absorption level
execute store result storage gm4_augmented_armor:temp absorption.level int 1 run scoreboard players remove $apply_absorption_level gm4_aa_data 1
function gm4_augmented_armor:armor/augment/type/reactive/eval_absorption with storage gm4_augmented_armor:temp absorption

# set the absorption level, to be reduced from gm4_survival_refightalized:player/health/damaged/calculate_damage later this tick
data remove storage gm4_augmented_armor:temp absorption

# cleanup the add absorption score for next time
scoreboard players reset $reactive.add_absorption gm4_aa_data
