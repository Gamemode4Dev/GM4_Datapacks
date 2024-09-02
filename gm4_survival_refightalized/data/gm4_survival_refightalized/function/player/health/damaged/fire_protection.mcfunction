# reduce damage with fire protection
# @s = damaged player
# at @s
# run from player/health/damaged/enchantments

execute store result score $enchant.fire_protection gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:0b}].components."minecraft:enchantments".levels."minecraft:fire_protection" 4
execute store result score $enchant.fire_protection.add gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:1b}].components."minecraft:enchantments".levels."minecraft:fire_protection" 4
scoreboard players operation $enchant.fire_protection gm4_sr_data += $enchant.fire_protection.add gm4_sr_data
execute store result score $enchant.fire_protection.add gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:2b}].components."minecraft:enchantments".levels."minecraft:fire_protection" 4
scoreboard players operation $enchant.fire_protection gm4_sr_data += $enchant.fire_protection.add gm4_sr_data
execute store result score $enchant.fire_protection.add gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:3b}].components."minecraft:enchantments".levels."minecraft:fire_protection" 4
scoreboard players operation $enchant.fire_protection gm4_sr_data += $enchant.fire_protection.add gm4_sr_data

scoreboard players operation $enchant.fire_protection gm4_sr_data < #80 gm4_sr_data
scoreboard players operation $enchant.fire_protection gm4_sr_data *= $damage_health gm4_sr_data
scoreboard players operation $enchant.fire_protection gm4_sr_data /= #100 gm4_sr_data
