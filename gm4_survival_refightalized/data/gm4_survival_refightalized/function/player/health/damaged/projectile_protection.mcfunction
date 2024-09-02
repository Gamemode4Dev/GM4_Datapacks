# reduce damage with projectile protection
# @s = damaged player
# at @s
# run from player/health/damaged/enchantments

execute store result score $enchant.projectile_protection gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:0b}].components."minecraft:enchantments".levels."minecraft:projectile_protection" 4
execute store result score $enchant.projectile_protection.add gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:1b}].components."minecraft:enchantments".levels."minecraft:projectile_protection" 4
scoreboard players operation $enchant.projectile_protection gm4_sr_data += $enchant.projectile_protection.add gm4_sr_data
execute store result score $enchant.projectile_protection.add gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:2b}].components."minecraft:enchantments".levels."minecraft:projectile_protection" 4
scoreboard players operation $enchant.projectile_protection gm4_sr_data += $enchant.projectile_protection.add gm4_sr_data
execute store result score $enchant.projectile_protection.add gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:3b}].components."minecraft:enchantments".levels."minecraft:projectile_protection" 4
scoreboard players operation $enchant.projectile_protection gm4_sr_data += $enchant.projectile_protection.add gm4_sr_data

scoreboard players operation $enchant.projectile_protection gm4_sr_data < #80 gm4_sr_data
scoreboard players operation $enchant.projectile_protection gm4_sr_data *= $damage_health gm4_sr_data
scoreboard players operation $enchant.projectile_protection gm4_sr_data /= #100 gm4_sr_data
