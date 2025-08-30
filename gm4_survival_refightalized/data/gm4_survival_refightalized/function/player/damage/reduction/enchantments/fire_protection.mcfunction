# reduce damage with fire protection
# @s = damaged player
# at @s
# run from player/damage/reduction/enchantments/ruun

execute store result score $enchant.fire_protection gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:0b}].components."minecraft:enchantments"."minecraft:fire_protection" 4
execute store result score $enchant.fire_protection.add gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:1b}].components."minecraft:enchantments"."minecraft:fire_protection" 4
scoreboard players operation $enchant.fire_protection gm4_sr_data += $enchant.fire_protection.add gm4_sr_data
execute store result score $enchant.fire_protection.add gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:2b}].components."minecraft:enchantments"."minecraft:fire_protection" 4
scoreboard players operation $enchant.fire_protection gm4_sr_data += $enchant.fire_protection.add gm4_sr_data
execute store result score $enchant.fire_protection.add gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:3b}].components."minecraft:enchantments"."minecraft:fire_protection" 4
scoreboard players operation $enchant.fire_protection gm4_sr_data += $enchant.fire_protection.add gm4_sr_data

execute if score $enchant.damage_reduction gm4_sr_data matches 0 if score $enchant.fire_protection gm4_sr_data matches 1.. run tellraw @s[tag=gm4_sr_dev.damage_log] {"text":"Enchantments:","color":"gray"}
scoreboard players operation $enchant.damage_reduction gm4_sr_data += $enchant.fire_protection gm4_sr_data
execute if score $enchant.fire_protection gm4_sr_data matches 1.. run tellraw @s[tag=gm4_sr_dev.damage_log] [{"text":" > Fire Protection: ","color":"gray"},{"score":{"name":"$enchant.fire_protection","objective":"gm4_sr_data"},"color":"white"},{"text":"%","color":"white"}]
