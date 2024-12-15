# calculate damage reduction based on different factors - if armor is worn
# @s = damaged player
# at @s
# run from player/health/damaged/run

# TEMP - paper fix - damage resist score gets multiplied by 51.2, so we need to revert that or the player instantly dies
# this currently breaks if a player takes a multiple of 51.2 damage, but that should be rare enough
scoreboard players set #512 gm4_sr_data 512
execute if score $on_paper gm4_sr_data matches 1 run tellraw @s[tag=gm4_sr_dev] {"text":"Paper Bug - divided damage by 51.2","color":"red","italic":true}
execute if score $on_paper gm4_sr_data matches 1 run scoreboard players operation @s gm4_sr_stat.damage_resisted *= #10 gm4_sr_data
execute if score $on_paper gm4_sr_data matches 1 run scoreboard players operation @s gm4_sr_stat.damage_resisted /= #512 gm4_sr_data

# grab active effects to check for resistance later - can be skipped if this was already done for cave spider poison reduction
execute unless data storage gm4_survival_refightalized:temp active_effects run data modify storage gm4_survival_refightalized:temp active_effects set from entity @s active_effects

# don't run if this resistance level is not due to armor (as the player will already have taken the damage)
# this should generally not run, and is mostly here as a fail-safe
execute store result score $resistance_level gm4_sr_data run data get storage gm4_survival_refightalized:temp active_effects[{id:"minecraft:resistance"}].amplifier
execute unless score $resistance_level gm4_sr_data matches -1 run return run scoreboard players reset @s gm4_sr_stat.damage_resisted

# dev damage log
tellraw @s[tag=gm4_sr_dev] [{"text":"Base Damage Taken (x10): ","color":"gray"},{"score":{"name":"@s","objective":"gm4_sr_stat.damage_resisted"},"color":"white"}]

# transfer damage resistance to damage to health score
scoreboard players operation $damage_total gm4_sr_data = @s gm4_sr_stat.damage_resisted

# first check the resistance level besides from this module
# if this results in 100% damage reduction skip the rest of this function
execute store success score $resistance_damage_reduction gm4_sr_data if data storage gm4_survival_refightalized:temp active_effects[{id:"minecraft:resistance"}].hidden_effect.duration
execute if score $resistance_damage_reduction gm4_sr_data matches 1 store result score $resistance_damage_reduction gm4_sr_data run data get storage gm4_survival_refightalized:temp active_effects[{id:"minecraft:resistance"}].hidden_effect.amplifier 20
execute if score $resistance_damage_reduction gm4_sr_data matches 1.. run scoreboard players add $resistance_damage_reduction gm4_sr_data 20
execute unless score $resistance_damage_reduction gm4_sr_data matches 0..99 run return run data remove storage gm4_survival_refightalized:temp active_effects

# | Reduce damage taken based on
# /!\ order for these is important!
# 1. armor toughness (only if player still has armor)
execute store result score $armor_toughness gm4_sr_data run attribute @s armor_toughness get
execute if score $armor_toughness gm4_sr_data matches 1.. if score @s gm4_sr_stat.armor matches 1.. run function gm4_survival_refightalized:player/damage/reduction/armor_toughness

# 2. enchantments
execute if entity @s[advancements={gm4_survival_refightalized:damaged={bypasses_enchantments=false}}] run function gm4_survival_refightalized:player/damage/reduction/enchantments/run

# 3. resistance effect (uses highest level besides the one used for this module)
scoreboard players operation $resistance_damage_reduction_percentage gm4_sr_data = $resistance_damage_reduction gm4_sr_data
scoreboard players operation $resistance_damage_reduction gm4_sr_data *= $damage_total gm4_sr_data
scoreboard players operation $resistance_damage_reduction gm4_sr_data /= #100 gm4_sr_data
scoreboard players operation $damage_total gm4_sr_data -= $resistance_damage_reduction gm4_sr_data
execute if score $resistance_damage_reduction gm4_sr_data matches 1.. run tellraw @s[tag=gm4_sr_dev] [{"text":"Resistance: ","color":"gray"},{"text":"-","color":"white"},{"score":{"name":"$resistance_damage_reduction","objective":"gm4_sr_data"},"color":"white"},{"text":" = "},{"score":{"name":"$damage_total","objective":"gm4_sr_data"},"color":"white"},{"text":" (","color":"dark_gray"},{"score":{"name":"$resistance_damage_reduction_percentage","objective":"gm4_sr_data"},"color":"dark_gray"},{"text":"%)","color":"dark_gray"}]
