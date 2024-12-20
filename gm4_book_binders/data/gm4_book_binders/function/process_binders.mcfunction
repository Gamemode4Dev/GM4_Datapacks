# @s any book binder armor stand
# at @s
# run from gm4_book_binders:main

# disable bookbinders with books on actual lectern
execute unless entity @s[tag=gm4_book_binder_active] if block ~ ~ ~ lectern[has_book=false] run function gm4_book_binders:binder/placement/enable
execute if entity @s[tag=gm4_book_binder_active] unless block ~ ~ ~ lectern[has_book=false] run function gm4_book_binders:binder/placement/disable

# kill armor stands that are no longer in a lectern
execute unless block ~ ~ ~ lectern run function gm4_book_binders:binder/placement/kill

# slow clock per book binder for recipe processing
scoreboard players add @s[tag=gm4_book_binder_active] gm4_binder_data 1
execute if score @s gm4_binder_data matches 4.. run scoreboard players set @s gm4_binder_data 0


#process binders that aren't locked on a slow clock
execute if score @s[tag=gm4_book_binder_active] gm4_binder_data matches 0 at @s run function gm4_book_binders:binder/tick
