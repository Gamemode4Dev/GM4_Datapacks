# process players with lightning charge
# @s = entity with a lightning charge
# at @s
# run from tick

scoreboard players set $keep_tick.lightning gm4_ce_keep_tick 1

# track striking timer
scoreboard players add @s[scores={gm4_ce_lightning_charge.striking=1..}] gm4_ce_lightning_charge.striking 1
execute unless score @s gm4_ce_lightning_charge.striking matches 1.. run scoreboard players set @s[scores={gm4_ce_lightning_charge=7..}] gm4_ce_lightning_charge.striking 1

# limit lightning charges to 7
scoreboard players set @s[scores={gm4_ce_lightning_charge=8..}] gm4_ce_lightning_charge 7

# display particles based on the amount of lightning charges a player has
scoreboard players operation @s gm4_ce_lightning_charge.deg += @s gm4_ce_lightning_charge
scoreboard players remove @s[scores={gm4_ce_lightning_charge.deg=360..}] gm4_ce_lightning_charge.deg 360
execute store result storage gm4_combat_expanded:temp lightning.deg int 1 run scoreboard players get @s gm4_ce_lightning_charge.deg

scoreboard players set $degree_per_particle gm4_ce_data 360
execute store result storage gm4_combat_expanded:temp lightning.deg_pp int 1 run scoreboard players operation $degree_per_particle gm4_ce_data /= @s gm4_ce_lightning_charge

scoreboard players operation $particles_to_display gm4_ce_data = @s gm4_ce_lightning_charge

execute store result storage gm4_combat_expanded:temp lightning.scale float 0.0066 run attribute @s generic.scale get 100
execute store result storage gm4_combat_expanded:temp lightning.height float 0.0133 run attribute @s generic.scale get 100

execute rotated 0 0 run function gm4_combat_expanded:weapon/modifier/lightning/particles/eval_rotation with storage gm4_combat_expanded:temp lightning

# check for full charge
execute if score @s gm4_ce_lightning_charge.striking matches 1 run playsound minecraft:entity.lightning_bolt.thunder player @a ~ ~ ~ 1 0
execute if score @s gm4_ce_lightning_charge.striking matches 1.. run particle electric_spark ~ ~10 ~ 0.1 4 0.1 0.2 16
execute if score @s gm4_ce_lightning_charge.striking matches 45.. run function gm4_combat_expanded:weapon/modifier/lightning/strike

# reduce lightning charges if timer runs out
scoreboard players remove @s gm4_ce_lightning_charge.timer 1
scoreboard players remove @s[scores={gm4_ce_lightning_charge.timer=..0,gm4_ce_lightning_charge=..6}] gm4_ce_lightning_charge 1
scoreboard players set @s[scores={gm4_ce_lightning_charge.timer=..0}] gm4_ce_lightning_charge.timer 5

# cleanup
data remove storage gm4_combat_expanded:temp lightning
