# finds the block the relocator was placed on
# @s = player who placed the relocator
# located at the center of the placed relocator
# run from gm4_relocators:machine/verify_place_down

# pick up the block the relocator was placed on
execute if score $face_placement gm4_machine_data matches 1..2 positioned ~ ~-1 ~ run function gm4_relocators:pick_up/check_block_validity
execute if score $face_placement gm4_machine_data matches 3 positioned ~ ~ ~1 run function gm4_relocators:pick_up/check_block_validity
execute if score $face_placement gm4_machine_data matches 4 positioned ~-1 ~ ~ run function gm4_relocators:pick_up/check_block_validity
execute if score $face_placement gm4_machine_data matches 5 positioned ~ ~ ~-1 run function gm4_relocators:pick_up/check_block_validity
execute if score $face_placement gm4_machine_data matches 6 positioned ~1 ~ ~ run function gm4_relocators:pick_up/check_block_validity

# delete relocator skull
setblock ~ ~ ~ air replace
