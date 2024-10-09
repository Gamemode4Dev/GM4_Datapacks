# code taken from sweethearts
# @s = player to heal
# at unspecified
# run from any armor/active/heal/heal_calc

# calculate max health to get player to new health
scoreboard players operation $remove_health gm4_sr_data = @s gm4_sr_stat.max_health
scoreboard players operation $remove_health gm4_sr_data -= @s gm4_sr_stat.current_health
execute store result storage gm4_survival_refightalized:temp heal_player.remove_health int 1 run scoreboard players operation $remove_health gm4_sr_data -= @s gm4_sr_health.restoration

execute unless score $remove_health gm4_sr_data matches 0 run function gm4_survival_refightalized:player/health/heal/eval with storage gm4_survival_refightalized:temp heal_player
data remove storage gm4_survival_refightalized:temp heal_player

# prepare reverting
tag @s add gm4_sr_healed
schedule function gm4_survival_refightalized:player/health/heal/context 1t
