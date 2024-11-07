# code taken from sweethearts
# @s = player to heal
# at unspecified
# run from any armor/active/heal/heal_calc

# calculate health
function gm4_survival_refightalized:player/health/heal/activate

# calculate max health to get player to new health
# we can use stat.current_health as that already has the restoration added to it
scoreboard players operation $remove_health gm4_sr_data = @s gm4_sr_stat.max_health
scoreboard players operation $remove_health gm4_sr_data -= @s gm4_sr_stat.current_health
execute store result storage gm4_survival_refightalized:temp heal_player.remove_health float 0.1 run scoreboard players get $remove_health gm4_sr_data

execute unless score $remove_health gm4_sr_data matches 0 run function gm4_survival_refightalized:player/health/heal/eval with storage gm4_survival_refightalized:temp heal_player
data remove storage gm4_survival_refightalized:temp heal_player

# prepare reverting
tag @s add gm4_sr_healed
schedule function gm4_survival_refightalized:player/health/heal/context 1t

# heal player
effect give @s minecraft:instant_health 1 10 true

# cleanup
scoreboard players reset @s gm4_sr_health.restoration
