# process elites
# @s = elite mob
# at @s
# run from main

execute if entity @s[tag=gm4_mu_elite.mending] run function gm4_monsters_unbound:mob/process/elite/mending/process
execute if entity @s[tag=gm4_mu_elite.blazing] run function gm4_monsters_unbound:mob/process/elite/blazing/process
execute if entity @s[tag=gm4_mu_elite.zephyr] run function gm4_monsters_unbound:mob/process/elite/zephyr/process
execute if entity @s[tag=gm4_mu_elite.gargantuan] run function gm4_monsters_unbound:mob/process/elite/gargantuan/process
execute if entity @s[tag=gm4_mu_elite.pearlescent] run function gm4_monsters_unbound:mob/process/elite/pearlescent/process
execute if entity @s[tag=gm4_mu_elite.volatile] run function gm4_monsters_unbound:mob/process/elite/volatile/process
