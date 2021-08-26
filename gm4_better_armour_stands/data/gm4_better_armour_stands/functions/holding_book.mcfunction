# @s = player holding book and quill
# at @s
# run from main

# Reveal invisible armor_stand
effect give @e[type=armor_stand,tag=!gm4_bas_hide,tag=!gm4_no_edit,distance=..8,nbt={Invisible:1b}] glowing 2 0
execute if predicate gm4_better_armour_stands:holding/mainhand/book_reveal run effect give @e[type=armor_stand,tag=gm4_bas_hide,tag=!gm4_no_edit,distance=..8,nbt={Invisible:1b}] glowing 2 0

# Give arms to nearby armor_stand if holding book with "arms"
execute if predicate gm4_better_armour_stands:holding/mainhand/book_arms as @e[type=armor_stand,tag=!gm4_bas_no_arms,tag=!gm4_no_edit,distance=..4,nbt={ShowArms:0b}] at @s run function gm4_better_armour_stands:toggle/arms_detection
