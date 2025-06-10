# reduce damage with enchantments
# @s = damaged player
# at @s
# run from player/damage/calculate_reduction

# get required data
item replace block 29999998 1 7134 container.0 from entity @s armor.head
item replace block 29999998 1 7134 container.1 from entity @s armor.chest
item replace block 29999998 1 7134 container.2 from entity @s armor.legs
item replace block 29999998 1 7134 container.3 from entity @s armor.feet
data modify storage gm4_survival_refightalized:temp Items set from block 29999998 1 7134 Items
data remove block 29999998 1 7134 Items

# /?\ enchantments have been nerfed! Protection values are:
# 1% per level of Protection
# 4% per level of Fire / Blast / Projectile Protection

scoreboard players set $enchant.damage_reduction gm4_sr_data 0

# generic protection enchantment
execute store result score $enchant.protection gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:0b}].components."minecraft:enchantments"."minecraft:protection" 1
execute store result score $enchant.protection.add gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:1b}].components."minecraft:enchantments"."minecraft:protection" 1
scoreboard players operation $enchant.protection gm4_sr_data += $enchant.protection.add gm4_sr_data
execute store result score $enchant.protection.add gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:2b}].components."minecraft:enchantments"."minecraft:protection" 1
scoreboard players operation $enchant.protection gm4_sr_data += $enchant.protection.add gm4_sr_data
execute store result score $enchant.protection.add gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:3b}].components."minecraft:enchantments"."minecraft:protection" 1
scoreboard players operation $enchant.protection gm4_sr_data += $enchant.protection.add gm4_sr_data

execute if score $enchant.damage_reduction gm4_sr_data matches 0 if score $enchant.protection gm4_sr_data matches 1.. run tellraw @s[tag=gm4_sr_dev.damage_log] {"text":"Enchantments:","color":"gray"}
scoreboard players operation $enchant.damage_reduction gm4_sr_data += $enchant.protection gm4_sr_data
execute if score $enchant.protection gm4_sr_data matches 1.. run tellraw @s[tag=gm4_sr_dev.damage_log] [{"text":" > Protection: ","color":"gray"},{"score":{"name":"$enchant.protection","objective":"gm4_sr_data"},"color":"white"},{"text":"%","color":"white"}]

# check if specific protection enchants would apply
scoreboard players set $enchant.fire_protection gm4_sr_data 0
scoreboard players set $enchant.blast_protection gm4_sr_data 0
scoreboard players set $enchant.projectile_protection gm4_sr_data 0
scoreboard players set $enchant.feather_falling gm4_sr_data 0
execute if entity @s[advancements={gm4_survival_refightalized:damaged={is_fire=true}}] run function gm4_survival_refightalized:player/damage/reduction/enchantments/fire_protection
execute if entity @s[advancements={gm4_survival_refightalized:damaged={is_explosion=true}}] run function gm4_survival_refightalized:player/damage/reduction/enchantments/blast_protection
execute if entity @s[advancements={gm4_survival_refightalized:damaged={is_projectile=true}}] run function gm4_survival_refightalized:player/damage/reduction/enchantments/projectile_protection
execute if entity @s[advancements={gm4_survival_refightalized:damaged={is_fall=true}}] run function gm4_survival_refightalized:player/damage/reduction/enchantments/feather_falling

# total enchantment damage reduction is capped at 80%
scoreboard players operation $enchant.damage_reduction gm4_sr_data < #80 gm4_sr_data
scoreboard players operation $enchant.damage_reduction_percentage gm4_sr_data = $enchant.damage_reduction gm4_sr_data
scoreboard players operation $enchant.damage_reduction gm4_sr_data *= $damage_total gm4_sr_data
scoreboard players operation $enchant.damage_reduction gm4_sr_data /= #100 gm4_sr_data
scoreboard players operation $damage_total gm4_sr_data -= $enchant.damage_reduction gm4_sr_data

execute if score $enchant.damage_reduction gm4_sr_data matches 1.. run tellraw @s[tag=gm4_sr_dev.damage_log] [{"text":" >> Total: ","color":"gray"},{"text":"-","color":"white"},{"score":{"name":"$enchant.damage_reduction","objective":"gm4_sr_data"},"color":"white"},{"text":" = ","color":"gray"},{"score":{"name":"$damage_total","objective":"gm4_sr_data"},"color":"white"},{"text":" (","color":"dark_gray"},{"score":{"name":"$enchant.damage_reduction_percentage","objective":"gm4_sr_data"},"color":"dark_gray"},{"text":"%)","color":"dark_gray"}]

# cleanup
data remove storage gm4_survival_refightalized:temp Items
