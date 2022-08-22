# @s = player holding writable_book
# at @s
# run from main

# reveal invisible armor_stand
execute if predicate gm4_better_armour_stands:holding/mainhand/book_visible run effect give @e[type=armor_stand,tag=!gm4_no_edit,tag=!smithed.entity,distance=..6,nbt={Invisible:1b}] glowing 2 0

# enable right click detection for nearby armor_stand
execute if predicate gm4_better_armour_stands:holding/mainhand/book_arms positioned ^ ^ ^2.5 as @e[type=armor_stand,tag=!gm4_bas_no_arms,tag=!gm4_no_edit,tag=!smithed.entity,distance=..2.5,nbt={ShowArms:0b}] at @s run function gm4_better_armour_stands:toggle/arms/detect_interaction

# remove ignore tag from writable_book
item modify entity @s[predicate=gm4_better_armour_stands:holding/mainhand/book_ignore] weapon.mainhand gm4_better_armour_stands:remove_ignore

# enable temporary interaction for locked armor_stand
execute if predicate gm4_better_armour_stands:holding/mainhand/book_unlock positioned ^ ^ ^2.5 as @e[type=armor_stand,tag=gm4_bas_locked,tag=!gm4_bas_temp_unlock,distance=..2.5] at @s run function gm4_better_armour_stands:toggle/lock/detect_interaction

# tracking check
execute if entity @s[tag=gm4_bas_track] run schedule function gm4_better_armour_stands:pose/track/tick 1t append
