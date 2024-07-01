# @s = book binder AEC
# at most negative corner of lectern
# run from binder/placement/place_lectern
execute if block ~ ~ ~ lectern[facing=north] run function gm4_book_binders:binder/placement/facing/north
execute if block ~ ~ ~ lectern[facing=south] run function gm4_book_binders:binder/placement/facing/south
execute if block ~ ~ ~ lectern[facing=east] run function gm4_book_binders:binder/placement/facing/east
execute if block ~ ~ ~ lectern[facing=west] run function gm4_book_binders:binder/placement/facing/west

scoreboard players set @e[type=armor_stand,dx=0,tag=gm4_book_binder] gm4_entity_version 1
