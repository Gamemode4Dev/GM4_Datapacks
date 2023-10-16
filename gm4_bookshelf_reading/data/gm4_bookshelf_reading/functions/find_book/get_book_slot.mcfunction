# check which book slot is being looked at
# @s = marker
# at chiseled bookshelf
# run from find_book/raycast

# get y position relative to the block
execute store result score $y gm4_bookshelf_reading_data run data get entity @s Pos[1] 100
scoreboard players operation $y gm4_bookshelf_reading_data %= #100 gm4_bookshelf_reading_data

# check rotation from stored player yaw and transform it into a score
# 1=north / 2=south / 3=east / 4=west
scoreboard players operation $rot gm4_bookshelf_reading_data = $yaw gm4_bookshelf_reading_data
execute if score $rot gm4_bookshelf_reading_data matches -45..45 run scoreboard players set $rot gm4_bookshelf_reading_data 2
execute if score $rot gm4_bookshelf_reading_data matches -135..-45 run scoreboard players set $rot gm4_bookshelf_reading_data 3
execute if score $rot gm4_bookshelf_reading_data matches 45..135 run scoreboard players set $rot gm4_bookshelf_reading_data 4
execute unless score $rot gm4_bookshelf_reading_data matches 2..4 run scoreboard players set $rot gm4_bookshelf_reading_data 1

# store either the x or z coord depending on player facing
execute if score $rot gm4_bookshelf_reading_data matches 1..2 store result score $xz gm4_bookshelf_reading_data run data get entity @s Pos[0] 100
execute if score $rot gm4_bookshelf_reading_data matches 3..4 store result score $xz gm4_bookshelf_reading_data run data get entity @s Pos[2] 100
scoreboard players operation $xz gm4_bookshelf_reading_data %= #100 gm4_bookshelf_reading_data

# book slots:
# 0 1 2
# 3 4 5
scoreboard players set $book_slot gm4_bookshelf_reading_data 0
execute if score $xz gm4_bookshelf_reading_data matches 33.. run scoreboard players add $book_slot gm4_bookshelf_reading_data 1
execute if score $xz gm4_bookshelf_reading_data matches 66.. run scoreboard players add $book_slot gm4_bookshelf_reading_data 1
execute if score $y gm4_bookshelf_reading_data matches ..50 run scoreboard players add $book_slot gm4_bookshelf_reading_data 3

# remove marker
kill @s
