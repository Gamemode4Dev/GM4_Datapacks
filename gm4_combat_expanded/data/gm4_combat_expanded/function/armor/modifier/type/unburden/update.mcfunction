# update unburden armor
# @s = player wearing unburden armour
# at @s
# run from armor/check_modifier/type/unburden/check

# mark for change
scoreboard players set $change gm4_ce_data 1

# update the stored armor to not have to do this update until armor value changes
execute store result storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.stored_armor int 1 run scoreboard players get @s gm4_ce_armor

# calculate level of bonus movement speed and attack speed
execute store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.level 2
execute if score $level gm4_ce_data matches 1 run scoreboard players set $level gm4_ce_data 150
execute if score $level gm4_ce_data matches 2 run scoreboard players set $level gm4_ce_data 175
execute if score $level gm4_ce_data matches 3 run scoreboard players set $level gm4_ce_data 200
execute if score $level gm4_ce_data matches 4 run scoreboard players set $level gm4_ce_data 225
scoreboard players set $missing_armor gm4_ce_data 20
scoreboard players operation $missing_armor gm4_ce_data -= @s gm4_ce_armor
scoreboard players operation $level gm4_ce_data *= $missing_armor gm4_ce_data
execute store result storage gm4_combat_expanded:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_combat_expanded:dynamic"}].amount float 0.0001 run scoreboard players get $level gm4_ce_data
execute store result storage gm4_combat_expanded:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_combat_expanded:dynamic_2"}].amount float 0.0001 run scoreboard players get $level gm4_ce_data
