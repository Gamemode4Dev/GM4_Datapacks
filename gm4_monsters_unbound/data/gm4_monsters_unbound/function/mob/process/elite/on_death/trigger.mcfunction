
execute if entity @s[tag=gm4_mu_elite.glacial] run function gm4_monsters_unbound:mob/process/elite/glacial/death
execute if entity @s[tag=gm4_mu_elite.vorpal] run function gm4_monsters_unbound:mob/process/elite/vorpal/death
execute if entity @s[tag=gm4_mu_elite.splitting] run function gm4_monsters_unbound:mob/process/elite/splitting/death

kill @s[tag=gm4_mu_elite_death_marker]
