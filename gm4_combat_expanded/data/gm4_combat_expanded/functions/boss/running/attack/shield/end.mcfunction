
scoreboard players set @s gm4_ce_boss.attack_id 0
scoreboard players reset @s gm4_ce_boss.attack_progress
scoreboard players set @s gm4_ce_boss.tick_delay 1

tag @s remove gm4_ce_boss.shielded
execute as @e[type=item_display,tag=gm4_ce_boss.shield] if score @s gm4_ce_boss.id = $running_id gm4_ce_boss.id run kill @s
