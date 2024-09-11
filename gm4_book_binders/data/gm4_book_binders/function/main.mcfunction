schedule function gm4_book_binders:main 16t

# handle book binders
execute as @e[type=armor_stand,tag=gm4_book_binder,tag=!smithed.entity] run function gm4_book_binders:upgrade_path/smithed_compat
execute as @e[type=armor_stand,tag=gm4_book_binder] at @s run function gm4_book_binders:process_binders
