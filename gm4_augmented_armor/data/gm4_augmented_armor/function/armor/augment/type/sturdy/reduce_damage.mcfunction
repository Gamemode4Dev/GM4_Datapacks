# add absorption to player that got hit (red health hits only)
# @s = player wearing armor
# at @s
# run from armor/augment/damage_taken

# calculate damage reduction % x10
execute store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[0] 10
scoreboard players operation $level gm4_aa_data *= @s gm4_sr_stat.armor
scoreboard players operation $level gm4_aa_data /= #20 gm4_aa_data

# calculate damage reduction
scoreboard players operation $damage_reduction gm4_aa_data = $level gm4_aa_data
scoreboard players operation $damage_reduction gm4_aa_data *= $damage_total gm4_sr_data
scoreboard players operation $damage_reduction gm4_aa_data /= #1000 gm4_aa_data

# reduce damage, it will be set to at least 1 later if needed
scoreboard players operation $damage_total gm4_sr_data -= $damage_reduction gm4_aa_data

# dev damage log
tellraw @s[tag=gm4_sr_dev.damage_log] [{"text":"Sturdy Augment: ","color":"gray"},{"text":"-","color":"white"},{"score":{"name":"$damage_reduction","objective":"gm4_aa_data"},"color":"white"},{"text":" = "},{"score":{"name":"$damage_total","objective":"gm4_sr_data"},"color":"white"},{"text":" (","color":"dark_gray"},{"score":{"name":"$level","objective":"gm4_aa_data"},"color":"dark_gray"},{"text":"‰)","color":"dark_gray"}]
