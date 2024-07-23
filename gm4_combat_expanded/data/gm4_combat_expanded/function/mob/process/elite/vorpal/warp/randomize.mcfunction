
execute store result score $randomX gm4_ce_data run random value 0..12
execute store result score $randomZ gm4_ce_data run random value 0..12

execute at @s run function gm4_combat_expanded:mob/process/elite/vorpal/warp/tp_marker
