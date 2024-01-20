# strike players with full lightning charges
# @s = entity with a lightning charge
# at @s
# run from weapon/modifier/lightning/tick

summon lightning_bolt

scoreboard players set @s gm4_ce_lightning_charge.timer 0
scoreboard players set @s gm4_ce_lightning_charge.striking 0
scoreboard players set @s gm4_ce_lightning_charge 0
