# @s = player modifying armor_stand
# at @s
# run from pose/track/tick

# get current player id
scoreboard players operation $current gm4_bas_id = @s gm4_bas_id

# select armor_stand linked to player
scoreboard players reset $success gm4_bas_data
execute store success score $success gm4_bas_data if predicate gm4_better_armour_stands:holding/mainhand/book_and_quill as @e[type=armor_stand,tag=gm4_bas_track,distance=..6] if score @s gm4_bas_id = $current gm4_bas_id positioned ~ ~1.6 ~ run function gm4_better_armour_stands:pose/track/update

# undo changes if no linked armor_stand found, or if player not holding book_and_quill
execute unless score $success gm4_bas_data matches 1 run function gm4_better_armour_stands:pose/undo
