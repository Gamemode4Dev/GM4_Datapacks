
# | Convert to integer
# add 5 and divide by 10 to round to half-hearts, make sure at least 1 damage is dealt
scoreboard players add $damage_total gm4_sr_data 5
scoreboard players operation $damage_total gm4_sr_data /= #10 gm4_sr_data
scoreboard players operation $damage_total gm4_sr_data > #1 gm4_sr_data
tellraw @s[tag=gm4_sr_dev] [{"text":"Damage Taken: ","color":"gray"},{"score":{"name":"$damage_total","objective":"gm4_sr_data"},"color":"white"}]

# | Armor
scoreboard players operation $damage_armor gm4_sr_data += $damage_total gm4_sr_data
# if damage pierces armor no effect
execute unless entity @s[advancements={gm4_survival_refightalized:damaged={armor_piercing=false,armor_piercing_mob=false}}] run scoreboard players set $damage_armor gm4_sr_data 0
# if armor is reduced to 0 play sound and remove resistance effect on player
execute if score $damage_armor gm4_sr_data >= @s gm4_sr_stat.armor run function gm4_survival_refightalized:player/armor/break
# calc the reduction in armor that should be applied
execute store result storage gm4_survival_refightalized:temp set.armor_reduction int 1 run scoreboard players operation @s gm4_sr_armor.reduction += $damage_armor gm4_sr_data
# any leftover damage is applied to the players absorption and health
scoreboard players operation $damage_left gm4_sr_data = $damage_total gm4_sr_data
scoreboard players operation $damage_left gm4_sr_data -= $damage_armor gm4_sr_data

# | Absorption
# get scores
scoreboard players operation $current_absorption_hearts gm4_sr_data = @s gm4_sr_health.absorption
scoreboard players operation $current_absorption_max gm4_sr_data = @s gm4_sr_stat.max_absorption
# apply leftover damge to absorption first
scoreboard players operation $damage_absorption gm4_sr_data += $damage_left gm4_sr_data
scoreboard players operation $damage_absorption gm4_sr_data < $current_absorption_hearts gm4_sr_data
scoreboard players operation $current_absorption_hearts gm4_sr_data -= $damage_absorption gm4_sr_data
# set storage to the amount of reduction of max absorption needed to get to the new absorption total
execute store result storage gm4_survival_refightalized:temp set.absorption_reduction int 1 run scoreboard players operation $current_absorption_max gm4_sr_data -= $current_absorption_hearts gm4_sr_data

# | Health
scoreboard players operation $damage_left gm4_sr_data -= $damage_absorption gm4_sr_data
scoreboard players operation $damage_health gm4_sr_data += $damage_left gm4_sr_data

# | Damage the player
# armor
execute if score $damage_armor gm4_sr_data matches 1.. run tellraw @s[tag=gm4_sr_dev] [{"text":"  > Armor: ","color":"gray"},{"score":{"name":"$damage_armor","objective":"gm4_sr_data"},"color":"white"}]
execute if score $damage_armor gm4_sr_data matches 1.. run function gm4_survival_refightalized:player/armor/eval_reduction with storage gm4_survival_refightalized:temp set
# absorption hearts
execute if score $damage_absorption gm4_sr_data matches 1.. run tellraw @s[tag=gm4_sr_dev] [{"text":"  > Absorption: ","color":"gray"},{"score":{"name":"$damage_absorption","objective":"gm4_sr_data"},"color":"white"}]
execute if score $damage_absorption gm4_sr_data matches 1.. run function gm4_survival_refightalized:player/absorption/eval_reduction with storage gm4_survival_refightalized:temp set
# red hearts
execute if score $damage_health gm4_sr_data matches 1.. run tellraw @s[tag=gm4_sr_dev] [{"text":"  > Health: ","color":"gray"},{"score":{"name":"$damage_health","objective":"gm4_sr_data"},"color":"white"}]
execute if score $damage_health gm4_sr_data matches 1.. run function gm4_survival_refightalized:player/health/reduce/activate

# advancement
execute if score $damage_armor gm4_sr_data matches 1.. run advancement grant @s only gm4:survival_refightalized_armor_damage
