# use item_display transformation to calculate distance to point in 3D space
# @s = item_display
# at unspecified
# run from evaluate/position

# this method was made by 'Triton365' on the Minecraft Commands discord

# it works by setting the x,y,z co-ordinates of a point into the transformation of a display_entity
# This will force the scale[0] of that entity to = (x^2 + y^2 + z^2)^1/2
# This equals the distance in blocks between that point and 0,0,0
$data modify entity @s transformation set value [$(x)f,0f,0f,0f,$(y)f,0f,0f,0f,$(z)f,0f,0f,0f,0f,0f,0f,1f]

# this distance can then be stored in a scoreboard to check later
execute store result score $distance gm4_bookshelf_inspector_data run data get entity @s transformation.scale[0] 100

# cleanup
kill @s
