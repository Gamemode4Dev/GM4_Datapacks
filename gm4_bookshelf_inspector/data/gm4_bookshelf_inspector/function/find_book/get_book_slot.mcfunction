# check which book slot is being looked at
# @s = marker
# at chiseled bookshelf
# run from find_book/find_book

# get y position relative to the block
execute store result score $y gm4_bookshelf_inspector_data run data get entity @s Pos[1] 100
scoreboard players operation $y gm4_bookshelf_inspector_data %= #100 gm4_bookshelf_inspector_data

# get rotation from player yaw and transform it into a score
# 1=north / 2=south / 3=west / 4=east
execute summon marker run function gm4_bookshelf_inspector:find_book/get_rotation

# check if bookshelf is rotated correctly
execute if score $rotation gm4_bookshelf_inspector_data matches 1 unless block ~ ~ ~-1 chiseled_bookshelf[facing=south] run scoreboard players set $evaluate gm4_bookshelf_inspector_data 0
execute if score $rotation gm4_bookshelf_inspector_data matches 2 unless block ~ ~ ~1 chiseled_bookshelf[facing=north] run scoreboard players set $evaluate gm4_bookshelf_inspector_data 0
execute if score $rotation gm4_bookshelf_inspector_data matches 3 unless block ~-1 ~ ~ chiseled_bookshelf[facing=east] run scoreboard players set $evaluate gm4_bookshelf_inspector_data 0
execute if score $rotation gm4_bookshelf_inspector_data matches 4 unless block ~1 ~ ~ chiseled_bookshelf[facing=west] run scoreboard players set $evaluate gm4_bookshelf_inspector_data 0
# stop if evaluation failed
execute if score $evaluate gm4_bookshelf_inspector_data matches 0 run kill @s
execute if score $evaluate gm4_bookshelf_inspector_data matches 0 run return 0

# check if the marker is located on the front face of the bookshelf
execute if score $rotation gm4_bookshelf_inspector_data matches 1..2 store result score $face_check gm4_bookshelf_inspector_data run data get entity @s Pos[2] 100
execute if score $rotation gm4_bookshelf_inspector_data matches 3..4 store result score $face_check gm4_bookshelf_inspector_data run data get entity @s Pos[0] 100
scoreboard players operation $face_check gm4_bookshelf_inspector_data %= #100 gm4_bookshelf_inspector_data
execute unless score $face_check gm4_bookshelf_inspector_data matches 0..5 unless score $face_check gm4_bookshelf_inspector_data matches 94..99 run scoreboard players set $evaluate gm4_bookshelf_inspector_data 0
# stop if evaluation failed
execute if score $evaluate gm4_bookshelf_inspector_data matches 0 run kill @s
execute if score $evaluate gm4_bookshelf_inspector_data matches 0 run return 0

# store either the x or z coord depending on player facing
execute if score $rotation gm4_bookshelf_inspector_data matches 1..2 store result score $xz gm4_bookshelf_inspector_data run data get entity @s Pos[0] 100
execute if score $rotation gm4_bookshelf_inspector_data matches 3..4 store result score $xz gm4_bookshelf_inspector_data run data get entity @s Pos[2] 100
scoreboard players operation $xz gm4_bookshelf_inspector_data %= #100 gm4_bookshelf_inspector_data

# book slots:
# 0 1 2
# 3 4 5
scoreboard players set $book_slot gm4_bookshelf_inspector_data 0
execute if score $xz gm4_bookshelf_inspector_data matches 33.. unless score $rotation gm4_bookshelf_inspector_data matches 2..3 run scoreboard players add $book_slot gm4_bookshelf_inspector_data 1
execute if score $xz gm4_bookshelf_inspector_data matches 66.. unless score $rotation gm4_bookshelf_inspector_data matches 2..3 run scoreboard players add $book_slot gm4_bookshelf_inspector_data 1
execute if score $xz gm4_bookshelf_inspector_data matches ..33 if score $rotation gm4_bookshelf_inspector_data matches 2..3 run scoreboard players add $book_slot gm4_bookshelf_inspector_data 1
execute if score $xz gm4_bookshelf_inspector_data matches ..66 if score $rotation gm4_bookshelf_inspector_data matches 2..3 run scoreboard players add $book_slot gm4_bookshelf_inspector_data 1
execute if score $y gm4_bookshelf_inspector_data matches ..50 run scoreboard players add $book_slot gm4_bookshelf_inspector_data 3

# remove marker
kill @s
