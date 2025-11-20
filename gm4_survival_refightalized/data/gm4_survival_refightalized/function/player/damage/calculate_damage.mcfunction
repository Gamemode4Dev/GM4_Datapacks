# devide damage between armor, absorption and health
# @s = damaged player
# at @s
# run from player/damage/run

# make sure at least 1 damage is dealt
scoreboard players operation $damage_total gm4_sr_data > #1 gm4_sr_data

# | Armor
scoreboard players operation $damage_armor gm4_sr_data += $damage_total gm4_sr_data
# if damage pierces armor no effect
execute unless entity @s[advancements={gm4_survival_refightalized:damaged={armor_piercing=false,armor_piercing_mob=false}}] run scoreboard players set $damage_armor gm4_sr_data 0
# breach adds 15% more damage per level
scoreboard players operation $total_armor_damage gm4_sr_data = $damage_armor gm4_sr_data
execute if entity @s[advancements={gm4_survival_refightalized:damaged={breaching=true}}] run function gm4_survival_refightalized:player/damage/calculate_breach_enchantment
# if armor is reduced to below 1 play sound and remove resistance effect on player
execute store result score $player_armor gm4_sr_data run attribute @s minecraft:armor get 10
scoreboard players operation $armor_check gm4_sr_data = $player_armor gm4_sr_data
scoreboard players operation $armor_check gm4_sr_data -= $total_armor_damage gm4_sr_data
execute if score $armor_check gm4_sr_data matches ..9 run function gm4_survival_refightalized:player/armor/break
tellraw @s[tag=gm4_sr_dev.damage_log] [{"text":"Real Damage Taken (x10): ","color":"gray"},{"score":{"name":"$damage_total","objective":"gm4_sr_data"},"color":"white"}]
# apply armor reduction to player armor
scoreboard players operation @s gm4_sr_armor.reduction += $total_armor_damage gm4_sr_data
execute store result storage gm4_survival_refightalized:temp set.armor_reduction float 0.1 run scoreboard players get @s gm4_sr_armor.reduction
# any leftover damage is applied to the players absorption and health
scoreboard players operation $damage_left gm4_sr_data = $damage_total gm4_sr_data
scoreboard players operation $damage_left gm4_sr_data -= $damage_armor gm4_sr_data

# | Absorption
# get scores
scoreboard players operation $current_absorption_hearts gm4_sr_data = @s gm4_sr_stat.current_absorption
scoreboard players operation $current_absorption_max gm4_sr_data = @s gm4_sr_stat.max_absorption
# apply leftover damge to absorption first
scoreboard players operation $damage_absorption gm4_sr_data += $damage_left gm4_sr_data
scoreboard players operation $damage_absorption gm4_sr_data < $current_absorption_hearts gm4_sr_data
scoreboard players operation $current_absorption_hearts gm4_sr_data -= $damage_absorption gm4_sr_data
# set storage to the amount of reduction of max absorption needed to get to the new absorption total
execute store result storage gm4_survival_refightalized:temp set.absorption_reduction float 0.1 run scoreboard players operation $current_absorption_max gm4_sr_data -= $current_absorption_hearts gm4_sr_data

# | Health
scoreboard players operation $damage_left gm4_sr_data -= $damage_absorption gm4_sr_data
scoreboard players operation $damage_health gm4_sr_data += $damage_left gm4_sr_data

# | Damage the player
# armor
execute if score $damage_armor gm4_sr_data matches 1.. unless entity @s[advancements={gm4_survival_refightalized:damaged={breaching=true}}] run tellraw @s[tag=gm4_sr_dev.damage_log] [{"text":"  > Armor: ","color":"gray"},{"score":{"name":"$total_armor_damage","objective":"gm4_sr_data"},"color":"white"}]
execute if score $damage_armor gm4_sr_data matches 1.. if entity @s[advancements={gm4_survival_refightalized:damaged={breaching=true}}] run tellraw @s[tag=gm4_sr_dev.damage_log] [{"text":"  > Armor: ","color":"gray"},{"score":{"name":"$total_armor_damage","objective":"gm4_sr_data"},"color":"white"},{"text":" | Breach Enchantment: ","color":"gray"},{"text":"+","color":"white"},{"score":{"name":"$extra_armor_damage","objective":"gm4_sr_data"},"color":"white"},{"text":" (","color":"dark_gray"},{"score":{"name":"$breach_level","objective":"gm4_sr_data"},"color":"dark_gray"},{"text":"%)","color":"dark_gray"}]
execute if score $damage_armor gm4_sr_data matches 1.. run function gm4_survival_refightalized:player/armor/eval_reduction with storage gm4_survival_refightalized:temp set
# absorption hearts
execute if score $damage_absorption gm4_sr_data matches 1.. run tellraw @s[tag=gm4_sr_dev.damage_log] [{"text":"  > Absorption: ","color":"gray"},{"score":{"name":"$damage_absorption","objective":"gm4_sr_data"},"color":"white"}]
execute if score $damage_absorption gm4_sr_data matches 1.. run function gm4_survival_refightalized:player/absorption/eval_reduction with storage gm4_survival_refightalized:temp set
# red hearts
execute if score $damage_health gm4_sr_data matches 1.. run tellraw @s[tag=gm4_sr_dev.damage_log] [{"text":"  > Health: ","color":"gray"},{"score":{"name":"$damage_health","objective":"gm4_sr_data"},"color":"white"}]
execute if score $damage_health gm4_sr_data matches 1.. run function gm4_survival_refightalized:player/health/reduce/activate

# advancement
execute if score $damage_armor gm4_sr_data matches 1.. run advancement grant @s only gm4:survival_refightalized_armor_damage
