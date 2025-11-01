# calculate breach extra damage to armor
# @s = damaged player
# at @s
# run from player/damage/calculate_damage

# get breach level x15
execute on attacker store result score $breach_level gm4_sr_data run data get entity @s equipment.mainhand.components."minecraft:enchantments"."minecraft:breach" 15

# get extra damage (this is calculated from post-mitigation damage)
scoreboard players operation $extra_armor_damage gm4_sr_data = $damage_armor gm4_sr_data
scoreboard players operation $extra_armor_damage gm4_sr_data *= $breach_level gm4_sr_data
scoreboard players operation $extra_armor_damage gm4_sr_data /= #100 gm4_sr_data
scoreboard players operation $total_armor_damage gm4_sr_data += $extra_armor_damage gm4_sr_data
