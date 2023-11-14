# give nearby players strength
# @s = player being checked
# at @s
# run from armor/check_modifier/equip

# get level
execute store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.level

# give effect
execute if score $level gm4_ce_data matches 1..2 run effect give @a[distance=0.01..18] strength 2 0
execute if score $level gm4_ce_data matches 3 run effect give @a[distance=0.01..18] strength 2 1
execute if score $level gm4_ce_data matches 1..2 as @e[type=wolf,distance=0.01..18] if data entity @s Owner run effect give @s strength 2 0
execute if score $level gm4_ce_data matches 3 as @e[type=wolf,distance=0.01..18] if data entity @s Owner run effect give @s strength 2 1
