# activate reckless armor on mob kill
# @s = player wearing armor
# at unspecified
# run from armor/modifier/killing

# get data
execute store result score $max_level gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.armor_clamp -1

# update time to deactivate (15 sec)
execute store result score $deactive_at gm4_ce_data run time query gametime
execute store result storage gm4_combat_expanded:temp tag.gm4_combat_expanded.deactivates_at int 1 run scoreboard players add $deactive_at gm4_ce_data 300

# don't update armor if it is at its cap
execute if score $active gm4_ce_data >= $max_level gm4_ce_data run return 0

scoreboard players set $change gm4_ce_data 1

# add kils to level and store for future
scoreboard players operation $active gm4_ce_data += @s gm4_ce_kill
execute store result storage gm4_combat_expanded:temp tag.gm4_combat_expanded.active int 1 run scoreboard players operation $active gm4_ce_data < $max_level gm4_ce_data

# update modifiers
execute store result storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded}].Amount float 0.5 run scoreboard players get $active gm4_ce_data
execute store result storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:gm4_combat_expanded_2}].Amount float -1 run scoreboard players get $active gm4_ce_data

# sound
execute at @s run playsound minecraft:entity.vex.ambient player @s ~ ~ ~ 0.8 1.6
