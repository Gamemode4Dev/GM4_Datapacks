# run while using a shield
# @s = player using a shield
# at @s
advancement revoke @s only gm4_survival_refightalized:using_custom_shield

# add to spam detection so you can't just spam click your shield to parry
execute unless score @s gm4_sr_shield.timer matches 1.. unless score @s gm4_sr_shield.spam_detection matches 30.. run scoreboard players add @s gm4_sr_shield.spam_detection 6

# track how many ticks shield is being held in gm4_sr_shield.use_ticks
execute unless score @s gm4_sr_shield.timer matches 1.. run scoreboard players set @s gm4_sr_shield.use_ticks 0
scoreboard players add @s gm4_sr_shield.use_ticks 1
scoreboard players set @s gm4_sr_shield.timer 2
