# add lightning charges to hit entity
# @s = entity hit by the weapon
# at @s
# run from weapon/modifier/lightning/activate

scoreboard players add @s gm4_ce_lightning_charge 2
scoreboard players set @s gm4_ce_lightning_charge.timer 160