
# in ground no longer process this arrow
execute store result score $in_ground gm4_aa_data run data get entity @s inGround
execute if score $in_ground gm4_aa_data matches 1 run return run tag @s remove gm4_aa_hawkeye_arrow.process

# add damage to arrow
execute store result score $damage gm4_aa_data run data get entity @s damage 1000
execute store result entity @s damage float 0.001 run scoreboard players operation $damage gm4_aa_data += @s gm4_aa_augment.hawkeye.count

# if damage reached max stop processing this arrow
execute if score $damage gm4_aa_data >= @s gm4_aa_augment.hawkeye.max_damage run return run tag @s remove gm4_aa_hawkeye_arrow.process

# keep clock on
scoreboard players set $keep_tick.hawkeye gm4_aa_keep_tick 1
