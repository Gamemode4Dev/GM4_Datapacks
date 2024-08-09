
# Formula:
# Damage reduction percentage = (damage * armor_toughness * 10) / ( (armor_toughness + 8) * damage / 10  + 150 )

# dividend = damage * armor_toughness * 10
scoreboard players operation $armor_toughness.dividend gm4_sr_data = $damage_health gm4_sr_data
scoreboard players operation $armor_toughness.dividend gm4_sr_data *= $armor_toughness gm4_sr_data
scoreboard players operation $armor_toughness.dividend gm4_sr_data *= #100 gm4_sr_data

# divisor = (armor_toughness + 8) * damage / 10  + 150
scoreboard players operation $armor_toughness.divisor gm4_sr_data = $armor_toughness gm4_sr_data
scoreboard players add $armor_toughness.divisor gm4_sr_data 8
scoreboard players operation $armor_toughness.divisor gm4_sr_data *= $damage_health gm4_sr_data
scoreboard players add $armor_toughness.divisor gm4_sr_data 1500

# dividend / divisor (this rounds down!)
scoreboard players operation $armor_toughness.dividend gm4_sr_data /= $armor_toughness.divisor gm4_sr_data

# get damage reduction
scoreboard players operation $armor_toughness_effect gm4_sr_data = $damage_health gm4_sr_data
scoreboard players operation $armor_toughness_effect gm4_sr_data *= $armor_toughness.dividend gm4_sr_data
scoreboard players operation $armor_toughness_effect gm4_sr_data /= #100 gm4_sr_data

# reduce damage taken
scoreboard players operation $damage_health gm4_sr_data -= $armor_toughness_effect gm4_sr_data
