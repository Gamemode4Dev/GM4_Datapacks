# locate the main/central interaction for the hit furniture
# @s = furniture interaction that was hit
# at @s
# run from break/detect_hit

# find a main furniture interaction entity matching the hit id
scoreboard players operation $check_id gm4_furniture_id = @s gm4_furniture_id
execute as @e[type=interaction,tag=gm4_furniture.main,distance=..8] if score @s gm4_furniture_id = $check_id gm4_furniture_id at @s run function gm4_furniture:break/process_hit

# cleanup
data remove entity @s attack
