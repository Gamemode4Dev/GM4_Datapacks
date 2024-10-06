# calculate the red health of player calling this function and store in scoreboards
# @s = player to calculate health from
# at unspecified
# run from player/health/detect_sleep
# run from player/health/regen_combat_health
# run from player/health/regen_fast_health
# run from player/health/heal/heal_calc
# run from player/health/reduce/activate
# called from expansion modules to get player health stats

# get max health
execute store result score @s gm4_sr_health.max run attribute @s minecraft:generic.max_health get

# calculate current health (only red hearts)
# Health stores as float, but minecraft displays as int rounded up, this
# mimics that so the value always matches what the player sees
# add healstore as that will be added to health this tick and should be counted
execute store result score @s gm4_sr_health.current run data get entity @s Health 10
scoreboard players add @s gm4_sr_health.current 9
scoreboard players operation @s gm4_sr_health.current /= #10 gm4_sr_data
scoreboard players operation @s gm4_sr_health.current += @s gm4_sr_healstore

# calculate percentage of max health
# this uses the rounded values displayed to the player
scoreboard players operation @s gm4_sr_health.percentage = @s gm4_sr_health.current
scoreboard players operation @s gm4_sr_health.percentage *= #100 gm4_sr_data
scoreboard players operation @s gm4_sr_health.percentage /= @s gm4_sr_health.max

# calculate absorption health same as red hearts
execute store result score @s gm4_sr_health.absorption_max run attribute @s generic.max_absorption get
execute store result score @s gm4_sr_health.absorption run data get entity @s AbsorptionAmount 10
scoreboard players add @s gm4_sr_health.absorption 9
scoreboard players operation @s gm4_sr_health.absorption /= #10 gm4_sr_data
