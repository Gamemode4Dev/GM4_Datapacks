# Check if flower pot id is in storage
# @s = type=minecraft:marker, tag=rc_blossoming_pots.flowerPot
# at @s
# with {id}
# run from upgrade_paths/3.1/legacy_flower_pot

$execute if data storage gm4_blossoming_pots:flower_pots $(id) run data modify storage gm4_blossoming_pots:flower_pots temp.legacy.in_storage set value 1
