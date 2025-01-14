# get pos of target
# @s = marker
# at @s
# run from mob/process/elite/zephyr/skeleton/init_arrow

data modify storage gm4_monsters_unbound:temp Pos set from entity @s Pos
execute store result score $target_x gm4_mu_data run data get storage gm4_monsters_unbound:temp Pos[0] 100
execute store result score $target_y gm4_mu_data run data get storage gm4_monsters_unbound:temp Pos[1] 100
execute store result score $target_z gm4_mu_data run data get storage gm4_monsters_unbound:temp Pos[2] 100
kill @s
