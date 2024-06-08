
$execute as @e[distance=0.01..$(range),predicate=gm4_ce_base:technical/pvp_able,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s $(damage) player_attack by @p[tag=gm4_ce_target]
