
execute store result score $randomX gm4_mu_data run random value 0..12
execute store result score $randomZ gm4_mu_data run random value 0..12

execute at @s run function gm4_monsters_unbound:mob/process/elite/vorpal/warp/tp_marker
