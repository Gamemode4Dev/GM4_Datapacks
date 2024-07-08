
# get required data
item replace block 29999998 1 7134 container.0 from entity @s armor.head
item replace block 29999998 1 7134 container.1 from entity @s armor.chest
item replace block 29999998 1 7134 container.2 from entity @s armor.legs
item replace block 29999998 1 7134 container.3 from entity @s armor.feet
data modify storage gm4_combat_expanded:temp Items set from block 29999998 1 7134 Items
data remove block 29999998 1 7134 Items

# generic protection enchantment
execute store result score $enchant.protection gm4_ce_data run data get storage gm4_combat_expanded:temp Items[0].components."minecraft:enchantments".levels."minecraft:protection" 4
execute store result score $enchant.protection.add gm4_ce_data run data get storage gm4_combat_expanded:temp Items[1].components."minecraft:enchantments".levels."minecraft:protection" 4
scoreboard players operation $enchant.protection gm4_ce_data += $enchant.protection.add gm4_ce_data
execute store result score $enchant.protection.add gm4_ce_data run data get storage gm4_combat_expanded:temp Items[2].components."minecraft:enchantments".levels."minecraft:protection" 4
scoreboard players operation $enchant.protection gm4_ce_data += $enchant.protection.add gm4_ce_data
execute store result score $enchant.protection.add gm4_ce_data run data get storage gm4_combat_expanded:temp Items[3].components."minecraft:enchantments".levels."minecraft:protection" 4
scoreboard players operation $enchant.protection gm4_ce_data += $enchant.protection.add gm4_ce_data

scoreboard players operation $enchant.protection gm4_ce_data *= $damage_health gm4_ce_data
scoreboard players operation $enchant.protection gm4_ce_data /= #100 gm4_ce_data
scoreboard players operation $damage_health gm4_ce_data -= $enchant.protection gm4_ce_data

# check if specific protection enchants would apply
execute if entity @s[advancements={gm4_combat_expanded:damaged/detect={is_fire=true}}] run function gm4_combat_expanded:player/health/damaged/fire_protection
execute if entity @s[advancements={gm4_combat_expanded:damaged/detect={is_explosion=true}}] run function gm4_combat_expanded:player/health/damaged/blast_protection
execute if entity @s[advancements={gm4_combat_expanded:damaged/detect={is_projectile=true}}] run function gm4_combat_expanded:player/health/damaged/projectile_protection
