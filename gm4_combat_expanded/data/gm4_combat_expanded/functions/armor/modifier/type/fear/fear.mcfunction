# freeze mob
# @s = mob to fear
# at @s
# run from armor/check_modifier/killing

# get level of fear
execute store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.level

# freeze mobs for 1-2 seconds
execute if score $level gm4_ce_data matches 1 run effect give @s slowness 1 10
execute if score $level gm4_ce_data matches 2 run effect give @s slowness 2 10
execute if score $level gm4_ce_data matches 3 run effect give @s slowness 1 10
execute if score $level gm4_ce_data matches 4 run effect give @s slowness 2 10

# damage mobs at higher levels
execute if score $level gm4_ce_data matches 3 run effect give @s wither 1 4 true
execute if score $level gm4_ce_data matches 4 run effect give @s wither 2 4 true

# extra effects
effect give @s weakness 1 10 true
execute if score $level gm4_ce_data matches 1..2 anchored eyes run particle block blue_ice ^ ^ ^ 0.3 0.3 0.3 0 3
execute if score $level gm4_ce_data matches 3..4 anchored eyes run particle block blue_ice ^ ^ ^ 0.3 0.3 0.3 0.1 8
