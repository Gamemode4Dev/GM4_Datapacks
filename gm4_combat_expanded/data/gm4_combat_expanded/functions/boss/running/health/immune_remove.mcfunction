
$bossbar set gm4_combat_expanded:boss_$(running_id) color purple
tag @s remove gm4_ce_boss.immune

execute as @e[type=item_display,tag=gm4_ce_boss.shield] if score @s gm4_ce_boss.id = $running_id gm4_ce_boss.id run kill @s
