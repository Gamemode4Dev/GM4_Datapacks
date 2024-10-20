# calculate the red health of player calling this function and store in scoreboards
# @s = player to calculate health from
# at unspecified
# run from player/health/detect_sleep
# run from player/health/regen_combat_health
# run from player/health/regen_fast_health
# run from player/health/heal/heal_calc
# run from player/health/reduce/activate
# called from expansion modules to get player health stats

# get max health x10
execute store result score @s gm4_sr_stat.max_health run attribute @s minecraft:generic.max_health get 10

# calculate current health x10 (only red hearts)
# add healstore as that will be added to health this tick and should be counted
execute store result score @s gm4_sr_stat.current_health run data get entity @s Health 10
scoreboard players operation @s gm4_sr_stat.current_health += @s gm4_sr_health.restoration

# calculate percentage of max health
# this uses the rounded values displayed to the player
scoreboard players operation @s gm4_sr_stat.health_percentage = @s gm4_sr_stat.current_health
scoreboard players operation @s gm4_sr_stat.health_percentage *= #100 gm4_sr_data
scoreboard players operation @s gm4_sr_stat.health_percentage /= @s gm4_sr_stat.max_health

# calculate absorption health same as red hearts
execute store result score @s gm4_sr_stat.max_absorption run attribute @s generic.max_absorption get 10
execute store result score @s gm4_sr_stat.current_absorption run data get entity @s AbsorptionAmount 10
