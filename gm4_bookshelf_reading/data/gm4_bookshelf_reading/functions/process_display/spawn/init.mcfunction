# init text display
# @s = text display
# at chiseled bookshelf, top-left book slot
# run from process_display/locate_slot

# set data
data merge entity @s {Tags:["gm4_bookshelf_reading_display","gm4_bookshelf_reading_display.extending"]}

# set rotation
execute if score $rot gm4_bookshelf_reading_data matches 1 run data modify entity @s Rotation set value [0.0F,0.0F]
execute if score $rot gm4_bookshelf_reading_data matches 2 run data modify entity @s Rotation set value [0.0F,0.0F]
execute if score $rot gm4_bookshelf_reading_data matches 3 run data modify entity @s Rotation set value [0.0F,0.0F]
execute if score $rot gm4_bookshelf_reading_data matches 4 run data modify entity @s Rotation set value [0.0F,0.0F]

# move text_display to the correct book location
execute if score $xz gm4_bookshelf_reading_data matches 33..65 at @s run tp @s ^0.33 ^ ^
execute if score $xz gm4_bookshelf_reading_data matches 66.. at @s run tp @s ^0.66 ^ ^
execute if score $y gm4_bookshelf_reading_data matches ..50 at @s run tp @s ~ ~-0.5 ~
