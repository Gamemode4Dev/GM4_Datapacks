
scoreboard players operation @s gm4_ce_boss.id = $next_id gm4_ce_boss.id
scoreboard players operation @s gm4_ce_boss.guardian_id = $running_id gm4_ce_boss.id
scoreboard players set @s[tag=gm4_ce_boss.main] gm4_ce_boss.health 200
scoreboard players set @s[tag=gm4_ce_boss.main] gm4_ce_boss.attack_id 1
scoreboard players set @s[tag=gm4_ce_boss.main] gm4_ce_boss.stage 1

tag @s add gm4_ce_boss.sentinel
tag @s remove gm4_ce_boss.new
