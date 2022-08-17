# @s = player modifying armor_stand
# at @s
# run from advancement pose/set, pose/undo

advancement revoke @s only gm4_better_armour_stands:book/use
advancement revoke @s only gm4_better_armour_stands:pose/set
advancement revoke @s only gm4_better_armour_stands:book/tracking

# advancement for customizing armor_stand
advancement grant @s only gm4:better_armour_stands

# get current player id
scoreboard players operation $current gm4_bas_id = @s gm4_bas_id

# reset/remove linked entities
execute as @e[type=armor_stand,tag=gm4_bas_track] if score @s gm4_bas_id = $current gm4_bas_id at @s run function gm4_better_armour_stands:pose/track/clear
execute as @e[type=marker,tag=gm4_bas_marker] if score @s gm4_bas_id = $current gm4_bas_id at @s run kill @s
execute as @e[type=wandering_trader,tag=gm4_bas_detect] if score @s gm4_bas_id = $current gm4_bas_id at @s run tp @s ~ -10000 ~

# reset tag
tag @s remove gm4_bas_track
