# calculate damage reduction based on different factors - if armor is worn
# @s = damaged player
# at @s
# run from player/health/damaged/run

# dev damage log
tellraw @s[tag=gm4_sr_dev] [{"text":"-- Damage Log --\n"},{"text":"Damage Taken: ","color":"gray"},{"score":{"name":"@s","objective":"gm4_sr_damage_resisted"},"color":"white"}]

# transfer damage resistance to damage to health score
scoreboard players operation $damage_health gm4_sr_data = @s gm4_sr_damage_resisted
scoreboard players reset @s gm4_sr_damage_resisted

# grab active effects to check for resistance later
data modify storage gm4_survival_refightalized:temp active_effects set from entity @s active_effects

# don't run if this resistance level is not due to armor (as the player will already have taken the damage)
# this should generally not run, and is mostly here as a fail-safe
execute store result score $resistance_level gm4_sr_data run data get storage gm4_survival_refightalized:temp active_effects[{id:"minecraft:resistance"}].amplifier
execute unless score $resistance_level gm4_sr_data matches -1 run return 0

# first check the resistance level besides from this module
# if this results in 100% damage reduction skip the rest of this function
execute store success score $resistance_damage_reduction gm4_sr_data if data storage gm4_survival_refightalized:temp active_effects[{id:"minecraft:resistance"}].hidden_effect.duration
execute if score $resistance_damage_reduction gm4_sr_data matches 1 store result score $resistance_damage_reduction gm4_sr_data run data get storage gm4_survival_refightalized:temp active_effects[{id:"minecraft:resistance"}].hidden_effect.amplifier 20
execute unless score $resistance_damage_reduction gm4_sr_data matches 0..99 run return run data remove storage gm4_survival_refightalized:temp active_effects

# | Reduce damage taken based on
# /!\ order for these is important!
# 1. armor toughness (only if player still has armor)
execute store result score $armor_toughness gm4_sr_data run attribute @s generic.armor_toughness get
execute if score $armor_toughness gm4_sr_data matches 1.. if score @s gm4_sr_armor matches 1.. run function gm4_survival_refightalized:player/health/damaged/armor_toughness

# 2. enchantments
execute if entity @s[advancements={gm4_survival_refightalized:damaged={bypasses_enchantments=false}}] run function gm4_survival_refightalized:player/health/damaged/enchantments

# 3. resistance effect (uses highest level besides the one used for this module)
scoreboard players operation $resistance_damage_reduction gm4_sr_data *= $damage_health gm4_sr_data
scoreboard players operation $resistance_damage_reduction gm4_sr_data /= #100 gm4_sr_data
scoreboard players operation $damage_health gm4_sr_data -= $resistance_damage_reduction gm4_sr_data
execute if score $resistance_damage_reduction gm4_sr_data matches 1.. run tellraw @s[tag=gm4_sr_dev] [{"text":"Resistance: ","color":"gray"},{"text":"-","color":"white"},{"score":{"name":"$resistance_damage_reduction","objective":"gm4_sr_data"},"color":"white"},{"text":" = "},{"score":{"name":"$damage_health","objective":"gm4_sr_data"},"color":"white"}]

# | Convert to scores
# add 5 and divide by 10 to round to half-hearts, make sure at least 1 damage is dealt
scoreboard players add $damage_health gm4_sr_data 5
scoreboard players operation $damage_health gm4_sr_data /= #10 gm4_sr_data
scoreboard players operation $damage_health gm4_sr_data > #1 gm4_sr_data
tellraw @s[tag=gm4_sr_dev] [{"text":"Total Damage: ","color":"gray"},{"score":{"name":"$damage_health","objective":"gm4_sr_data"},"color":"white"}]
# damage armor first, unless damage pierces armor
scoreboard players operation $damage_armor gm4_sr_data = $damage_health gm4_sr_data
execute unless entity @s[advancements={gm4_survival_refightalized:damaged={armor_piercing=false,armor_piercing_mob=false}}] run scoreboard players set $damage_armor gm4_sr_data 0
# if armor is reduced to 0 remove resistance effect on player
execute if score $damage_armor gm4_sr_data >= @s gm4_sr_armor run function gm4_survival_refightalized:player/health/damaged/resistance_remove
# any leftover damage is applied to the players health
scoreboard players operation $damage_health gm4_sr_data -= $damage_armor gm4_sr_data
tellraw @s[tag=gm4_sr_dev] [{"text":"  > Armor: ","color":"gray"},{"score":{"name":"$damage_armor","objective":"gm4_sr_data"},"color":"white"}]

# | Damage the player
# armor
attribute @s generic.armor modifier remove gm4_sr_armor_reduced
execute store result storage gm4_survival_refightalized:temp set.armor_reduction int 1 run scoreboard players operation @s gm4_sr_armor_reduced += $damage_armor gm4_sr_data
execute if score @s gm4_sr_armor_reduced matches 1.. run function gm4_survival_refightalized:player/health/eval_armor_reduction with storage gm4_survival_refightalized:temp set
data remove storage gm4_survival_refightalized:temp set

# stop running if all damage is dealt
execute unless score $damage_health gm4_sr_data matches 1.. run return run data remove storage gm4_survival_refightalized:temp active_effects
# absorption hearts
execute store result score $current_absorption_max gm4_sr_data run attribute @s generic.max_absorption get
execute store result score $current_absorption_hearts gm4_sr_data run data get entity @s AbsorptionAmount

scoreboard players operation $damage_absorption gm4_sr_data = $damage_health gm4_sr_data
scoreboard players operation $damage_absorption gm4_sr_data < $current_absorption_hearts gm4_sr_data
scoreboard players operation $damage_health gm4_sr_data -= $damage_absorption gm4_sr_data
execute if score $damage_absorption gm4_sr_data matches 1.. run tellraw @s[tag=gm4_sr_dev] [{"text":"  > Absorption: ","color":"gray"},{"score":{"name":"$damage_absorption","objective":"gm4_sr_data"},"color":"white"}]

scoreboard players operation $current_absorption_hearts gm4_sr_data -= $damage_absorption gm4_sr_data
execute store result storage gm4_survival_refightalized:temp set.absorption_reduction int 1 run scoreboard players operation $current_absorption_max gm4_sr_data -= $current_absorption_hearts gm4_sr_data
execute if score $damage_absorption gm4_sr_data matches 1.. run function gm4_survival_refightalized:player/health/damaged/eval_absorption_reduction with storage gm4_survival_refightalized:temp set
data remove storage gm4_survival_refightalized:temp set

# red hearts
execute if score $damage_health gm4_sr_data matches 1.. run tellraw @s[tag=gm4_sr_dev] [{"text":"  > Health: ","color":"gray"},{"score":{"name":"$damage_health","objective":"gm4_sr_data"},"color":"white"}]
execute if score $damage_health gm4_sr_data matches 1.. run function gm4_survival_refightalized:player/health/reduce/activate

data remove storage gm4_survival_refightalized:temp active_effects
