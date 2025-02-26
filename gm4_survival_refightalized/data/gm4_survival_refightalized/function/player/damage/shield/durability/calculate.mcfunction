
# if unbreakable don't run
execute if data storage gm4_survival_refightalized:temp Items[{Slot:4b}].components."minecraft:unbreakable" run return 0

# if incoming damage is less than 3 don't run
execute if score @s gm4_sr_stat.damage_resisted matches ..29 run return 0

tellraw @s[tag=gm4_sr_dev.damage_log] [{"text":"dam: ","color":"gray"},{"score":{"name":"@s","objective":"gm4_sr_stat.damage_resisted"},"color":"white"}]

# calculate incoming damage based on unbreaking
execute store result score $unbreaking_level gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:4b}].components."minecraft:enchantments".levels."minecraft:unbreaking"
scoreboard players add $unbreaking_level gm4_sr_data 1
scoreboard players set $damage_chance gm4_sr_data 100
scoreboard players operation $damage_chance gm4_sr_data /= $unbreaking_level gm4_sr_data
scoreboard players operation $damage_opportunities gm4_sr_data = @s gm4_sr_stat.damage_resisted
scoreboard players add $damage_opportunities gm4_sr_data 5
scoreboard players operation $damage_opportunities gm4_sr_data /= #10 gm4_sr_data
execute store result score $incoming_damage gm4_sr_data run loot spawn 29999998 1 7133 loot gm4_survival_refightalized:technical/roll_damage
# TODO: remove (spigot bug)
execute positioned 29999998 1 7133 run kill @e[type=item,distance=..2]

# dev damage log
tellraw @s[tag=gm4_sr_dev.damage_log] [{"text":"Shield Damage Base: ","color":"gray"},{"score":{"name":"$damage_opportunities","objective":"gm4_sr_data"},"color":"white"}]
tellraw @s[tag=gm4_sr_dev.damage_log] [{"text":"Shield Damage Final: ","color":"gray"},{"score":{"name":"$incoming_damage","objective":"gm4_sr_data"},"color":"white"}]

# if no damage is going to be applied cancel function
execute unless score $incoming_damage gm4_sr_data matches 1.. run return 0

# find the total durability of this item
execute store result score $total_durability gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:4b}].components."minecraft:max_damage"
execute if score $total_durability gm4_sr_data matches 0 run scoreboard players set $total_durability gm4_sr_data 336
execute if score $total_durability gm4_sr_data matches 0 run return 0

# add incoming damage to the current damage
execute store result score $current_damage gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:4b}].components."minecraft:damage"
scoreboard players operation $current_damage gm4_sr_data += $incoming_damage gm4_sr_data
execute if score $current_damage gm4_sr_data > $total_durability gm4_sr_data run return run function gm4_survival_refightalized:player/damage/shield/durability/break

# apply to shield
execute store result storage gm4_survival_refightalized:temp set.damage int 1 run scoreboard players get $current_damage gm4_sr_data
function gm4_survival_refightalized:player/damage/shield/durability/eval with storage gm4_survival_refightalized:temp set

# cleanup
data remove storage gm4_survival_refightalized:temp set
scoreboard players reset $total_durability gm4_sr_data
