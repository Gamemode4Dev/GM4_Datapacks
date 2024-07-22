
$damage @s $(damage) mob_attack by @e[type=#gm4_combat_expanded:elite_types,tag=gm4_ce_self,limit=1,distance=..7]
effect give @s slowness 2 3
effect give @s nausea 4 0

particle block{block_state:"chest"} ~ ~1.2 ~ 0.325 0.925 0.325 1 12
