# replace blocks on furniture to stored block id from item display
# @s = furniture item display
# unspecified
# with {block_id}
# run from place/furniture/{set_name}/{row['technical_id']}   (generated)

$execute as @e[type=interaction,tag=gm4_furniture.interaction,distance=..8] if score @s gm4_furniture_id = $check_id gm4_furniture_id at @s run setblock ~ ~0.1 ~ $(block_id)
