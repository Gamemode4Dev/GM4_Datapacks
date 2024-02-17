
$bossbar set gm4_combat_expanded:boss_$(running_id) color white
tag @s add gm4_ce_boss.immune

execute unless score @s gm4_ce_boss.attack_id matches 6 positioned ~ ~0.5 ~ summon item_display run function gm4_combat_expanded:boss/running/health/immune_shield
