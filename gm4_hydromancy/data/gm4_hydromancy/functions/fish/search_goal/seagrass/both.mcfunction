# remove tag from fish after finding both types of seagrass
# @s = tropical fish with gm4_hy_tracked_fish tag
# at @s, raycasted down to seagrass
# run from fish/search_goal/seagrass/short
# run from fish/search_goal/seagrass/tall

tag @s remove gm4_hy_tracked_fish
tag @s remove gm4_hy_found_tall_grass
tag @s remove gm4_hy_found_short_grass
