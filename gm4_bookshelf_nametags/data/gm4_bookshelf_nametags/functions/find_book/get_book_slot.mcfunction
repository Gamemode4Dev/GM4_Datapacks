# check which book slot is being looked at
# @s = marker
# at chiseled bookshelf
# run from find_book/find_book

# get y position relative to the block
execute store result score $y gm4_bookshelf_nametags_data run data get entity @s Pos[1] 100
scoreboard players operation $y gm4_bookshelf_nametags_data %= #100 gm4_bookshelf_nametags_data

# check rotation from stored player yaw and transform it into a score
# 1=north / 2=south / 3=west / 4=east
scoreboard players operation $rot gm4_bookshelf_nametags_data = $yaw gm4_bookshelf_nametags_data
execute if score $rot gm4_bookshelf_nametags_data matches -45..45 run scoreboard players set $rot gm4_bookshelf_nametags_data 2
execute if score $rot gm4_bookshelf_nametags_data matches -135..-45 run scoreboard players set $rot gm4_bookshelf_nametags_data 4
execute if score $rot gm4_bookshelf_nametags_data matches 45..135 run scoreboard players set $rot gm4_bookshelf_nametags_data 3
execute unless score $rot gm4_bookshelf_nametags_data matches 2..4 run scoreboard players set $rot gm4_bookshelf_nametags_data 1

# check if the marker is located on the front face of the bookshelf, if so return 0 to skip further checks and fail evaluation
execute if score $rot gm4_bookshelf_nametags_data matches 1..2 store result score $face_check gm4_bookshelf_nametags_data run data get entity @s Pos[2] 100
execute if score $rot gm4_bookshelf_nametags_data matches 3..4 store result score $face_check gm4_bookshelf_nametags_data run data get entity @s Pos[0] 100
scoreboard players operation $face_check gm4_bookshelf_nametags_data %= #100 gm4_bookshelf_nametags_data
scoreboard players add $face_check gm4_bookshelf_nametags_data 3
execute if score $face_check gm4_bookshelf_nametags_data matches 7..93 run kill @s
execute if score $face_check gm4_bookshelf_nametags_data matches 7..93 run return 0

# store either the x or z coord depending on player facing
execute if score $rot gm4_bookshelf_nametags_data matches 1..2 store result score $xz gm4_bookshelf_nametags_data run data get entity @s Pos[0] 100
execute if score $rot gm4_bookshelf_nametags_data matches 3..4 store result score $xz gm4_bookshelf_nametags_data run data get entity @s Pos[2] 100
scoreboard players operation $xz gm4_bookshelf_nametags_data %= #100 gm4_bookshelf_nametags_data

# book slots:
# 0 1 2
# 3 4 5
scoreboard players set $book_slot gm4_bookshelf_nametags_data 0
execute if score $xz gm4_bookshelf_nametags_data matches 33.. unless score $rot gm4_bookshelf_nametags_data matches 2..3 run scoreboard players add $book_slot gm4_bookshelf_nametags_data 1
execute if score $xz gm4_bookshelf_nametags_data matches 66.. unless score $rot gm4_bookshelf_nametags_data matches 2..3 run scoreboard players add $book_slot gm4_bookshelf_nametags_data 1
execute if score $xz gm4_bookshelf_nametags_data matches ..33 if score $rot gm4_bookshelf_nametags_data matches 2..3 run scoreboard players add $book_slot gm4_bookshelf_nametags_data 1
execute if score $xz gm4_bookshelf_nametags_data matches ..66 if score $rot gm4_bookshelf_nametags_data matches 2..3 run scoreboard players add $book_slot gm4_bookshelf_nametags_data 1
execute if score $y gm4_bookshelf_nametags_data matches ..50 run scoreboard players add $book_slot gm4_bookshelf_nametags_data 3

# remove marker
kill @s

# return success
return 1
