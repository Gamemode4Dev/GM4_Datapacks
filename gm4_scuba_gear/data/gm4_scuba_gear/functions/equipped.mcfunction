# @s = player wearing a piece of scuba gear
# run from main

execute if entity @s[tag=!gm4_in_water,predicate=gm4_scuba_gear:tank_equipped] at @s anchored eyes positioned ^ ^ ^ if predicate gm4_scuba_gear:in_water run function gm4_scuba_gear:breathe
effect give @s[scores={gm4_sg_swim=1..},predicate=gm4_scuba_gear:flippers_equipped] dolphins_grace 3 0 true

# reward advancement
advancement grant @s[predicate=gm4_scuba_gear:all_gear_equipped] only gm4:scuba_gear
