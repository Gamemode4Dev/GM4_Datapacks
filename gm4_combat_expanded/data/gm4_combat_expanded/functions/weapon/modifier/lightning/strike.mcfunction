# strike players with full lightning charges
# @s = entity with a lightning charge
# at @s
# run from weapon/modifier/lightning/tick

execute unless entity @s[type=player] run damage @s 42 lightning_bolt at ~ ~ ~
execute if entity @s[type=player] run damage @s 16 lightning_bolt at ~ ~ ~
execute as @e[distance=0.01..2.5,type=!player,predicate=gm4_combat_expanded:technical/unblocked_hit,team=!gm4_ce_team_check,tag=!smithed.strict] run damage @s 21 lightning_bolt at ~ ~ ~
summon lightning_bolt

scoreboard players set @s gm4_ce_lightning_charge.timer 0
scoreboard players set @s gm4_ce_lightning_charge.striking 0
scoreboard players set @s gm4_ce_lightning_charge 0
