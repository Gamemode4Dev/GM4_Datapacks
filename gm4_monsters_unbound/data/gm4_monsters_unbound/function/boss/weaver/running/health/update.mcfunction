# update health value of boss if it has been hit
# @s = boss shulker (main)
# at @s
# run from boss/watchers/tick

# update health value of boss
scoreboard players operation @s gm4_mu_boss.health -= $health gm4_mu_boss

# trigger next phases if health drops below threshold
execute if score @s[scores={gm4_mu_boss.phase=1}] gm4_mu_boss.health matches ..225 run scoreboard players set @s gm4_mu_boss.phase 2
execute if score @s[scores={gm4_mu_boss.phase=2}] gm4_mu_boss.health matches ..150 run scoreboard players set @s gm4_mu_boss.phase 3
execute if score @s[scores={gm4_mu_boss.phase=3}] gm4_mu_boss.health matches ..75 run scoreboard players set @s gm4_mu_boss.phase 4
