# reduce damage with feather falling
# @s = damaged player
# at @s
# run from player/health/damaged/enchantments

execute store result score $enchant.feather_falling gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:0b}].components."minecraft:enchantments".levels."minecraft:feather_falling" 12
execute store result score $enchant.feather_falling.add gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:1b}].components."minecraft:enchantments".levels."minecraft:feather_falling" 12
scoreboard players operation $enchant.feather_falling gm4_sr_data += $enchant.feather_falling.add gm4_sr_data
execute store result score $enchant.feather_falling.add gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:2b}].components."minecraft:enchantments".levels."minecraft:feather_falling" 12
scoreboard players operation $enchant.feather_falling gm4_sr_data += $enchant.feather_falling.add gm4_sr_data
execute store result score $enchant.feather_falling.add gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:3b}].components."minecraft:enchantments".levels."minecraft:feather_falling" 12
scoreboard players operation $enchant.feather_falling gm4_sr_data += $enchant.feather_falling.add gm4_sr_data

execute if score $enchant.damage_reduction gm4_sr_data matches 0 if score $enchant.feather_falling gm4_sr_data matches 1.. run tellraw @s[tag=gm4_sr_dev.damage_log] {"text":"Enchantments:","color":"gray"}
scoreboard players operation $enchant.damage_reduction gm4_sr_data += $enchant.feather_falling gm4_sr_data
execute if score $enchant.feather_falling gm4_sr_data matches 1.. run tellraw @s[tag=gm4_sr_dev.damage_log] [{"text":" > Feather Falling: ","color":"gray"},{"score":{"name":"$enchant.feather_falling","objective":"gm4_sr_data"},"color":"white"},{"text":"%","color":"white"}]
