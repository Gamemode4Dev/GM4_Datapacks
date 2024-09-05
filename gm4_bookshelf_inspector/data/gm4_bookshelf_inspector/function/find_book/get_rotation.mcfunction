# spawn marker to get player yaw
# @s = marker
# at @s
# run from find_book/get_book_slot

tp @s @p[tag=gm4_bookshelf_inspector_target]
execute store result score $rotation gm4_bookshelf_inspector_data run data get entity @s Rotation[0]
execute if score $rotation gm4_bookshelf_inspector_data matches -45..44 run scoreboard players set $rotation gm4_bookshelf_inspector_data 2
execute if score $rotation gm4_bookshelf_inspector_data matches -135..-45 run scoreboard players set $rotation gm4_bookshelf_inspector_data 4
execute if score $rotation gm4_bookshelf_inspector_data matches 45..135 run scoreboard players set $rotation gm4_bookshelf_inspector_data 3
execute unless score $rotation gm4_bookshelf_inspector_data matches 2..4 run scoreboard players set $rotation gm4_bookshelf_inspector_data 1
kill @s
