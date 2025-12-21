# reduce damage with armor toughness
# @s = damaged player
# at @s
# run from player/damage/calculate_reduction

# Formula:
# Damage reduction percentage = (6 * armor_toughness + 2 * armor_toughness * damage) / (damage + 5 * armor_toughness)

scoreboard players operation $armor_toughness.times_5 gm4_sr_data = $armor_toughness gm4_sr_data
scoreboard players operation $armor_toughness.times_5 gm4_sr_data *= #5 gm4_sr_data

# dividend = 6 * armor_toughness + 2 * armor_toughness * damage
scoreboard players operation $armor_toughness.dividend gm4_sr_data += $armor_toughness.times_5 gm4_sr_data
scoreboard players operation $armor_toughness.dividend gm4_sr_data *= $armor_toughness gm4_sr_data
scoreboard players operation $armor_toughness.dividend2 gm4_sr_data = $damage_total gm4_sr_data
scoreboard players operation $armor_toughness.dividend2 gm4_sr_data *= $armor_toughness gm4_sr_data
scoreboard players operation $armor_toughness.dividend2 gm4_sr_data *= #2 gm4_sr_data
scoreboard players operation $armor_toughness.dividend gm4_sr_data += $armor_toughness.dividend2 gm4_sr_data

# divisor = damage + 5 * armor_toughness
scoreboard players operation $armor_toughness.divisor gm4_sr_data = $damage_total gm4_sr_data
scoreboard players operation $armor_toughness.divisor gm4_sr_data += $armor_toughness.times_5 gm4_sr_data

# dividend / divisor (this rounds down!), can max reduce damage by 2x armor_toughness
scoreboard players operation $armor_toughness.dividend gm4_sr_data /= $armor_toughness.divisor gm4_sr_data
scoreboard players operation $armor_toughness.max_reduction gm4_sr_data = $armor_toughness gm4_sr_data
scoreboard players operation $armor_toughness.max_reduction gm4_sr_data *= #2 gm4_sr_data
scoreboard players operation $armor_toughness.dividend gm4_sr_data < $armor_toughness.max_reduction gm4_sr_data

# get damage reduction
scoreboard players operation $armor_toughness_effect gm4_sr_data = $damage_total gm4_sr_data
scoreboard players operation $armor_toughness_effect gm4_sr_data *= $armor_toughness.dividend gm4_sr_data
scoreboard players operation $armor_toughness_effect gm4_sr_data /= #100 gm4_sr_data

# reduce damage taken
scoreboard players operation $damage_total gm4_sr_data -= $armor_toughness_effect gm4_sr_data

# dev damage log
tellraw @s[tag=gm4_sr_dev.damage_log] [{"text":"Armor Toughness: ","color":"gray"},{"text":"-","color":"white"},{"score":{"name":"$armor_toughness_effect","objective":"gm4_sr_data"},"color":"white"},{"text":" = ","color":"gray"},{"score":{"name":"$damage_total","objective":"gm4_sr_data"},"color":"white"},{"text":" (","color":"dark_gray"},{"score":{"name":"$armor_toughness.dividend","objective":"gm4_sr_data"},"color":"dark_gray"},{"text":"%)","color":"dark_gray"}]
