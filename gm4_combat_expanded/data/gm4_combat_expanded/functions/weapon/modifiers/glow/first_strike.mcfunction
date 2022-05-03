# damage players hit by 'glow' that do not have glowing
# @s = entity first being hit with glow
# run from weapon/modifiers/glow/glow

# get item level
execute store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.level

# damage according to level
execute if score $level gm4_ce_data matches 1 run effect give @s wither 2 10
execute if score $level gm4_ce_data matches 2 run effect give @s wither 3 10
execute if score $level gm4_ce_data matches 3 run effect give @s wither 4 10
