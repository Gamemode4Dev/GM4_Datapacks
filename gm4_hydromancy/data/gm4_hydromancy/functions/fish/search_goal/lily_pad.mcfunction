# remove tag from fish after finding lily pads and giving points
# @s = tropical fish with gm4_hy_tracked_fish tag
# at @s, raycasted up to lily pad
# run from fish/search_goal/lily_pad/surface

scoreboard players set $max_search_depth gm4_hy_data 0

# give points per lily pads in a 3x1x3 area on the surface, up to 3. Any lily pad over 6 removes one point
execute store result score $lily_pad_count gm4_hy_data run clone ~-1 ~ ~-1 ~1 ~ ~1 ~-1 ~ ~-1 filtered lily_pad move
execute if score $lily_pad_count gm4_hy_data matches 1.. run tag @s remove gm4_hy_tracked_fish
scoreboard players operation $lily_pad_overcount gm4_hy_data = $lily_pad_count gm4_hy_data
scoreboard players operation $lily_pad_overcount gm4_hy_data %= #6 gm4_hy_data
scoreboard players operation $lily_pad_count gm4_hy_data < #3 gm4_hy_data
scoreboard players operation $lily_pad_count gm4_hy_data -= $lily_pad_overcount gm4_hy_data
scoreboard players operation @s gm4_hy_charge += $lily_pad_count gm4_hy_data
