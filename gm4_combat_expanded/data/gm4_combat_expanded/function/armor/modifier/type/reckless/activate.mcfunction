# activate reckless armor on mob kill
# @s = player wearing armor
# at unspecified
# run from armor/modifier/killing

# get max level
scoreboard players set $armor_level gm4_ce_data 0
data modify storage gm4_combat_expanded:temp attribute_modifiers set from storage gm4_combat_expanded:temp components."minecraft:attribute_modifiers".modifiers
function gm4_combat_expanded:armor/modifier/type/reckless/loop_attributes
data remove storage gm4_combat_expanded:temp check_modifier

# update time to deactivate (15 sec)
execute store result score $deactive_at gm4_ce_data run time query gametime
execute store result storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.deactivates_at int 1 run scoreboard players add $deactive_at gm4_ce_data 300

# don't update armor if it is at its cap
execute if score $armor_level gm4_ce_data matches 0 run return 0

scoreboard players set $change gm4_ce_data 1

# add kils to level and store for future
scoreboard players operation $armor_level gm4_ce_data += $active gm4_ce_data
scoreboard players operation $active gm4_ce_data += @s gm4_ce_kill
execute store result storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.active int 1 run scoreboard players operation $active gm4_ce_data < $armor_level gm4_ce_data

# update modifiers
execute store result storage gm4_combat_expanded:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_combat_expanded:dynamic"}].amount float 0.5 run scoreboard players get $active gm4_ce_data
execute store result storage gm4_combat_expanded:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_combat_expanded:dynamic_2"}].amount float -1 run scoreboard players get $active gm4_ce_data

# sound
execute at @s run playsound minecraft:entity.vex.ambient player @s ~ ~ ~ 0.8 1.6
