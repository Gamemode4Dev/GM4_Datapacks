# @s = item entity with x, y, z, dimension in Item.tag
# at world spawn; Y = -512

#extract x, y, z, and dimension into fake players
execute store result score wormhole_x gm4_zc_data run data get entity @s Item.tag.x
execute store result score wormhole_y gm4_zc_data run data get entity @s Item.tag.y
execute store result score wormhole_z gm4_zc_data run data get entity @s Item.tag.z
execute store result score wormhole_d gm4_zc_data run data get entity @s Item.tag.dimension
