
advancement revoke @s only gm4_survival_refightalized:using_shield

# if player parried disable the shield if it is held for 0.25 seconds total
execute if entity @s[tag=gm4_sr_parried,scores={gm4_sr_shield.use_ticks=5..}] run return run function gm4_survival_refightalized:player/damage/shield/disable

# give a short burst
execute unless score @s gm4_sr_shield.timer matches 1.. run attribute @s minecraft:knockback_resistance modifier add gm4_survival_refightalized:using_shield 1 add_value
execute unless score @s gm4_sr_shield.timer matches 1.. run effect give @s resistance 1 255 true

execute unless score @s gm4_sr_shield.timer matches 1.. run scoreboard players set @s gm4_sr_shield.use_ticks 0
scoreboard players add @s gm4_sr_shield.use_ticks 1
scoreboard players set @s gm4_sr_shield.timer 2
