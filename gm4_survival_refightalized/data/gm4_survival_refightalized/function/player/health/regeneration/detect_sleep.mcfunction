# process a player sleeping in a bed
# @s = sleeping player
# at @s
# run from player/process

# reset score to check for sleep again
scoreboard players reset @s gm4_sr_stat.sleep_in_bed

# turn all lost health of this player to fast regen health (once per night)
execute store result score $current_night gm4_sr_data run time query day
execute if score @s gm4_sr_stat.last_slept_night = $current_night gm4_sr_data run return 0
scoreboard players operation @s gm4_sr_stat.last_slept_night = $current_night gm4_sr_data
function gm4_survival_refightalized:player/health/calculate_hp
scoreboard players operation @s gm4_sr_health.quick_regeneration_health = @s gm4_sr_stat.max_health
scoreboard players operation @s gm4_sr_health.quick_regeneration_health -= @s gm4_sr_stat.current_health

# make this player fast regen health faster until it runs out
tag @s add gm4_sr_quicker_regeneration_slept
