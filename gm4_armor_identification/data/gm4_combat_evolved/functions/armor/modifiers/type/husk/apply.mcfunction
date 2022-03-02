# run from armor/modifiers/type/husk/check
# @s = player wearing husk armour above 50% health

# get level
execute store result score $level gm4_ce_data run data get storage gm4_combat_evolved:temp tag.gm4_combat_evolved.level

# give effects
execute if score $level gm4_ce_data matches 1..3 run effect give @s haste 1 0 true
execute if score $level gm4_ce_data matches 4 run effect give @s haste 1 1 true

execute if score $level gm4_ce_data matches 1 run effect give @s hunger 1 2 true
execute if score $level gm4_ce_data matches 2 run effect give @s hunger 1 1 true
execute if score $level gm4_ce_data matches 3 run effect give @s hunger 1 0 true
execute if score $level gm4_ce_data matches 4 run effect give @s hunger 1 4 true
