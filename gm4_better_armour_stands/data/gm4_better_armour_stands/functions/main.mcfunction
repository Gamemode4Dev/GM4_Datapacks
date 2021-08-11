execute at @a[gamemode=!spectator,predicate=gm4_better_armour_stands:holding_book_and_quill] run effect give @e[type=armor_stand,tag=!gm4_no_edit,distance=..8,nbt={Invisible:1b}] glowing 2 0

schedule function gm4_better_armour_stands:main 16t
