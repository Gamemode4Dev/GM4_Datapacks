# damage player from gargantuan ground slam
# @s = player that got hit
# at @s
# run from mob/process/elite/gargantuan/activate

particle block{block_state:"chest"} ~ ~1.2 ~ 0.325 0.925 0.325 1 12

$damage @s $(damage) mob_attack by @e[type=#gm4_monsters_unbound:elite_types,tag=gm4_mu_self,limit=1,distance=..7]
effect give @s slowness 3 3
effect give @s nausea 5 0
