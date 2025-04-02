# reduce damage with armor toughness
# @s = damaged player
# at @s
# run from player/health/damaged/calculate_reduction

# Formula:
# Damage reduction percentage = (damage * armor_toughness * 50) / ( damage * armor_toughness + 3500 )

# dividend = damage * armor_toughness * 50
scoreboard players operation $armor_toughness.dividend gm4_sr_data = $damage_total gm4_sr_data
scoreboard players operation $armor_toughness.dividend gm4_sr_data *= $armor_toughness gm4_sr_data
scoreboard players operation $armor_toughness.dividend gm4_sr_data *= #50 gm4_sr_data

# divisor = damage * armor_toughness + 3500
scoreboard players operation $armor_toughness.divisor gm4_sr_data = $damage_total gm4_sr_data
scoreboard players operation $armor_toughness.divisor gm4_sr_data *= $armor_toughness gm4_sr_data
scoreboard players add $armor_toughness.divisor gm4_sr_data 3500

# dividend / divisor (this rounds down!), can max reduce damage by 25%
scoreboard players operation $armor_toughness.dividend gm4_sr_data /= $armor_toughness.divisor gm4_sr_data
scoreboard players operation $armor_toughness.dividend gm4_sr_data < #25 gm4_sr_data

# get damage reduction
scoreboard players operation $armor_toughness_effect gm4_sr_data = $damage_total gm4_sr_data
scoreboard players operation $armor_toughness_effect gm4_sr_data *= $armor_toughness.dividend gm4_sr_data
scoreboard players operation $armor_toughness_effect gm4_sr_data /= #100 gm4_sr_data

# reduce damage taken
scoreboard players operation $damage_total gm4_sr_data -= $armor_toughness_effect gm4_sr_data

# dev damage log
tellraw @s[tag=gm4_sr_dev.damage_log] [{"text":"Armor Toughness: ","color":"gray"},{"text":"-","color":"white"},{"score":{"name":"$armor_toughness_effect","objective":"gm4_sr_data"},"color":"white"},{"text":" = ","color":"gray"},{"score":{"name":"$damage_total","objective":"gm4_sr_data"},"color":"white"},{"text":" (","color":"dark_gray"},{"score":{"name":"$armor_toughness.dividend","objective":"gm4_sr_data"},"color":"dark_gray"},{"text":"%)","color":"dark_gray"}]
