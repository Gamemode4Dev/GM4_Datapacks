# add absorption to player that got hit (red health hits only)
# @s = player wearing armor
# at @s
# run from armor/augment/damage_taken

# calculate damage taken to health
scoreboard players operation $health_damage gm4_aa_data = $damage_total gm4_sr_data
execute unless score $damage_total gm4_sr_data matches 1.. run scoreboard players operation $health_damage gm4_aa_data = @s gm4_sr_stat.damage_taken
scoreboard players add $health_damage gm4_aa_data 5
scoreboard players operation $health_damage gm4_aa_data /= #10 gm4_aa_data
scoreboard players operation $health_damage gm4_aa_data -= @s gm4_sr_stat.armor
scoreboard players operation $health_damage gm4_aa_data -= @s gm4_sr_stat.current_absorption

# only run if health damage is taken
execute unless score $health_damage gm4_aa_data matches 1.. run return 0

# get percentage of this that should be converted to fast regen health, rounded
execute store result score $quick_regen_health gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[0]
scoreboard players operation $quick_regen_health gm4_aa_data *= $health_damage gm4_aa_data
scoreboard players add $quick_regen_health gm4_aa_data 50
scoreboard players operation $quick_regen_health gm4_aa_data /= #100 gm4_aa_data

# add to players quick regeneration health
scoreboard players operation @s gm4_sr_health.quick_regeneration_health += $quick_regen_health gm4_aa_data

# dev damage log
tellraw @s[tag=gm4_sr_dev] [{"text":"Rejuvenating Augment: ","color":"gray"},{"score":{"name":"$quick_regen_health","objective":"gm4_aa_data"},"color":"white"},{"text":" to quick regeneration"}]
