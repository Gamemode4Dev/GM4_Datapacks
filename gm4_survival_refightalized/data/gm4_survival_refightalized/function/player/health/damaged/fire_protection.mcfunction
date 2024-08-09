
execute store result score $enchant.fire_protection gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[0].components."minecraft:enchantments".levels."minecraft:fire_protection" 8
execute store result score $enchant.fire_protection.add gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[1].components."minecraft:enchantments".levels."minecraft:fire_protection" 8
scoreboard players operation $enchant.fire_protection gm4_sr_data += $enchant.fire_protection.add gm4_sr_data
execute store result score $enchant.fire_protection.add gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[2].components."minecraft:enchantments".levels."minecraft:fire_protection" 8
scoreboard players operation $enchant.fire_protection gm4_sr_data += $enchant.fire_protection.add gm4_sr_data
execute store result score $enchant.fire_protection.add gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[3].components."minecraft:enchantments".levels."minecraft:fire_protection" 8
scoreboard players operation $enchant.fire_protection gm4_sr_data += $enchant.fire_protection.add gm4_sr_data

execute if score $enchant.fire_protection gm4_sr_data matches 0 run return 0

scoreboard players operation $enchant.fire_protection gm4_sr_data < #80 gm4_sr_data

scoreboard players operation $enchant.fire_protection gm4_sr_data < #80 gm4_sr_data
scoreboard players operation $enchant.fire_protection gm4_sr_data *= $damage_health gm4_sr_data
scoreboard players operation $enchant.fire_protection gm4_sr_data /= #100 gm4_sr_data

scoreboard players operation $damage_health gm4_sr_data -= $enchant.fire_protection gm4_sr_data
