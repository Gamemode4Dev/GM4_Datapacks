# @s = player modifying armor_stand
# at @s
# run from pose/track/tick

# select armor_stand linked to player
execute as @e[type=armor_stand,tag=gm4_bas_track] if score @s gm4_bas_id = @p[tag=gm4_bas_track] gm4_bas_id positioned ~ ~1.6 ~ run function gm4_better_armour_stands:pose/track/update

# undo changes if player not holding writable_book
execute unless predicate gm4_better_armour_stands:holding/mainhand/book_and_quill run function gm4_better_armour_stands:pose/track/undo

# detect broken armor_stand
execute unless entity @e[type=armor_stand,tag=gm4_bas_track,distance=..10] run function gm4_better_armour_stands:pose/set
