# armor is reduced to 0
# @s = damaged player
# at @s
# run from player/damage/calculate_damage

playsound minecraft:entity.armor_stand.break player @a[distance=..8] ~ ~ ~ 1 0 1
playsound minecraft:entity.armor_stand.break player @s ~ ~ ~ 1 0.75 1
function gm4_survival_refightalized:player/resistance/remove
function #gm4_survival_refightalized:armor_break

# set damage taken to the amount of armor remaining so it gets removed
scoreboard players operation $total_armor_damage gm4_sr_data = $player_armor gm4_sr_data
scoreboard players operation $damage_armor gm4_sr_data < $player_armor gm4_sr_data

# reduce damage by players max armor
scoreboard players operation $armor_break_damage_reduction gm4_sr_data = @s gm4_sr_armor.reduction
scoreboard players operation $armor_break_damage_reduction gm4_sr_data += $player_armor gm4_sr_data
scoreboard players operation $damage_total gm4_sr_data -= $armor_break_damage_reduction gm4_sr_data
scoreboard players operation $damage_total gm4_sr_data > $player_armor gm4_sr_data
tellraw @s[tag=gm4_sr_dev.damage_log] [{"text":"Armor Break: ","color":"gray"},{"text":"-","color":"white"},{"score":{"name":"$armor_break_damage_reduction","objective":"gm4_sr_data"},"color":"white"},{"text":" = ","color":"gray"},{"score":{"name":"$damage_total","objective":"gm4_sr_data"},"color":"white"}]

# increase the armor recharge cooldown
scoreboard players operation $set gm4_sr_armor.reduction_timer += $armor_recharge_timer gm4_sr_config
