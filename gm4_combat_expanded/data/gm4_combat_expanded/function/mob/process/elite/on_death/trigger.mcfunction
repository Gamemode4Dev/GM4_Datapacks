
execute if entity @s[tag=gm4_ce_elite.glacial] run function gm4_combat_expanded:mob/process/elite/glacial/death
execute if entity @s[tag=gm4_ce_elite.vorpal] run function gm4_combat_expanded:mob/process/elite/vorpal/death
execute if entity @s[tag=gm4_ce_elite.splitting] run function gm4_combat_expanded:mob/process/elite/splitting/death

kill @s[tag=gm4_ce_elite_death_marker]
