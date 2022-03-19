# run from armor/check_modifier
# @s = player being checked
# at @s

# get level
execute store result score $level gm4_ce_data run data get storage gm4_combat_evolved:temp tag.gm4_combat_evolved.level

# give effect
execute if score $level gm4_ce_data matches 1..2 run effect give @a[distance=0.01..5] strength 1 0
execute if score $level gm4_ce_data matches 3 run effect give @a[distance=0.01..5] strength 1 1
