# run from main
# @s = player that was guarding

function gm4_armor_identification:player/calculate_hp

# calculate amount of max_health to remove to get to new health
scoreboard players operation $remove_health gm4_ai_data = $max_health gm4_ai_data

scoreboard players operation $remove_health gm4_ai_data -= @s gm4_ai_health
scoreboard players operation @s gm4_ai_guard /= #10 gm4_ai_data
scoreboard players operation $remove_health gm4_ai_data += @s gm4_ai_guard

# damage player if they are alive
execute if score $remove_health gm4_ai_data < $max_health gm4_ai_data run function gm4_armor_identification:armor/modifiers/type/guardian/damage_apply

# kill player if health reached 0
execute if score $remove_health gm4_ai_data >= $max_health gm4_ai_data run function gm4_armor_identification:armor/modifiers/type/guardian/guard_death
