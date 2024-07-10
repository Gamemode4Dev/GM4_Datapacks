
execute store result score $randomX gm4_ce_data run random value 0..8
execute store result score $randomZ gm4_ce_data run random value 0..8

execute at @s run function gm4_combat_expanded:mob/process/elite/fear/warp/tp_marker
