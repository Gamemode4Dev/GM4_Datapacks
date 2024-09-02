# reduce damage with enchantments
# @s = damaged player
# at @s
# run from player/health/damaged/calculate_reduction

# get required data
item replace block 29999998 1 7134 container.0 from entity @s armor.head
item replace block 29999998 1 7134 container.1 from entity @s armor.chest
item replace block 29999998 1 7134 container.2 from entity @s armor.legs
item replace block 29999998 1 7134 container.3 from entity @s armor.feet
data modify storage gm4_survival_refightalized:temp Items set from block 29999998 1 7134 Items
data remove block 29999998 1 7134 Items

# enchantments have been nerfed! Protection values are:
# 1% per level of Protection
# 4% per level of Fire / Blast / Projectile Protection

# generic protection enchantment
execute store result score $enchant.protection gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:0b}].components."minecraft:enchantments".levels."minecraft:protection" 1
execute store result score $enchant.protection.add gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:1b}].components."minecraft:enchantments".levels."minecraft:protection" 1
scoreboard players operation $enchant.protection gm4_sr_data += $enchant.protection.add gm4_sr_data
execute store result score $enchant.protection.add gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:2b}].components."minecraft:enchantments".levels."minecraft:protection" 1
scoreboard players operation $enchant.protection gm4_sr_data += $enchant.protection.add gm4_sr_data
execute store result score $enchant.protection.add gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:3b}].components."minecraft:enchantments".levels."minecraft:protection" 1
scoreboard players operation $enchant.protection gm4_sr_data += $enchant.protection.add gm4_sr_data

scoreboard players operation $enchant.protection gm4_sr_data < #80 gm4_sr_data
scoreboard players operation $enchant.protection gm4_sr_data *= $damage_health gm4_sr_data
scoreboard players operation $enchant.protection gm4_sr_data /= #100 gm4_sr_data

# check if specific protection enchants would apply
scoreboard players set $enchant.fire_protection gm4_sr_data 0
scoreboard players set $enchant.blast_protection gm4_sr_data 0
scoreboard players set $enchant.projectile_protection gm4_sr_data 0
execute if entity @s[advancements={gm4_survival_refightalized:damaged={is_fire=true}}] run function gm4_survival_refightalized:player/health/damaged/fire_protection
execute if entity @s[advancements={gm4_survival_refightalized:damaged={is_explosion=true}}] run function gm4_survival_refightalized:player/health/damaged/blast_protection
execute if entity @s[advancements={gm4_survival_refightalized:damaged={is_projectile=true}}] run function gm4_survival_refightalized:player/health/damaged/projectile_protection

# damage is only reduced at the end, this allows all enchantments to work on the full damage (after armor toughness)
scoreboard players operation $damage_health gm4_sr_data -= $enchant.protection gm4_sr_data
execute if score $enchant.protection gm4_sr_data matches 1.. run tellraw @s[tag=gm4_sr_dev] [{"text":"Protection: ","color":"gray"},{"text":"-","color":"white"},{"score":{"name":"$enchant.protection","objective":"gm4_sr_data"},"color":"white"},{"text":" = ","color":"gray"},{"score":{"name":"$damage_health","objective":"gm4_sr_data"},"color":"white"}]
scoreboard players operation $damage_health gm4_sr_data -= $enchant.fire_protection gm4_sr_data
execute if score $enchant.fire_protection gm4_sr_data matches 1.. run tellraw @s[tag=gm4_sr_dev] [{"text":"Fire Protection: ","color":"gray"},{"text":"-","color":"white"},{"score":{"name":"$enchant.fire_protection","objective":"gm4_sr_data"},"color":"white"},{"text":" = ","color":"gray"},{"score":{"name":"$damage_health","objective":"gm4_sr_data"},"color":"white"}]
scoreboard players operation $damage_health gm4_sr_data -= $enchant.blast_protection gm4_sr_data
execute if score $enchant.blast_protection gm4_sr_data matches 1.. run tellraw @s[tag=gm4_sr_dev] [{"text":"Blast Protection: ","color":"gray"},{"text":"-","color":"white"},{"score":{"name":"$enchant.blast_protection","objective":"gm4_sr_data"},"color":"white"},{"text":" = ","color":"gray"},{"score":{"name":"$damage_health","objective":"gm4_sr_data"},"color":"white"}]
scoreboard players operation $damage_health gm4_sr_data -= $enchant.projectile_protection gm4_sr_data
execute if score $enchant.projectile_protection gm4_sr_data matches 1.. run tellraw @s[tag=gm4_sr_dev] [{"text":"Projectile Protection: ","color":"gray"},{"text":"-","color":"white"},{"score":{"name":"$enchant.projectile_protection","objective":"gm4_sr_data"},"color":"white"},{"text":" = ","color":"gray"},{"score":{"name":"$damage_health","objective":"gm4_sr_data"},"color":"white"}]
