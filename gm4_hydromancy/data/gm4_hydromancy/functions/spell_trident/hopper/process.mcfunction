# process thrown spell trident
# @s = spell trident
# at @s
# run from spell_trident/process_fast

execute on passengers run tag @s add gm4_hy_passenger_item
tag @s add gm4_hy_target
execute as @e[type=item,distance=..5,tag=!gm4_hy_passenger_item,tag=!smithed.strict] run ride @s mount @e[type=trident,tag=gm4_hy_target,limit=1]
tag @s remove gm4_hy_target
tag @e remove gm4_hy_passenger_item

# TODO: effect vfx for riding
