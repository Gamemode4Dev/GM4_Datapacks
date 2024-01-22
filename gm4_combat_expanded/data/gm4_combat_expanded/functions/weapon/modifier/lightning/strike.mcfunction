# strike players with full lightning charges
# @s = entity with a lightning charge
# at @s
# run from weapon/modifier/lightning/tick

execute unless entity @s[type=player] run damage @s 30 lightning_bolt at ~ ~ ~
execute if entity @s[type=player] run damage @s 10 lightning_bolt at ~ ~ ~
summon lightning_bolt

scoreboard players set @s gm4_ce_lightning_charge.timer 0
scoreboard players set @s gm4_ce_lightning_charge.striking 0
scoreboard players set @s gm4_ce_lightning_charge 0
