# disable shield if it blocked damage
# @s = damaged player
# at @s
# run from player/damage/run

# revoke advancement as it's not needed for shield blocking
advancement revoke @s only gm4_survival_refightalized:damaged

# get shield data
scoreboard players set $mainhand_shield gm4_sr_data 0
execute if items entity @s weapon.mainhand *[custom_data~{gm4_survival_refightalized:{shield:{}}}] store success score $mainhand_shield gm4_sr_data run item replace block 29999998 1 7134 container.0 from entity @s weapon.mainhand
execute if score $mainhand_shield gm4_sr_data matches 0 run item replace block 29999998 1 7134 container.0 from entity @s weapon.offhand
data modify storage gm4_survival_refightalized:temp Item set from block 29999998 1 7134 Items[0]
data remove block 29999998 1 7134 Items

# non-player attacker is weak for 1 second so they don't immediatly hit again
execute on attacker run effect give @s[type=!player] weakness 1 9 true

# parry attack (shield won't get disabled)
execute store result score $parry_ticks gm4_sr_data run data get storage gm4_survival_refightalized:temp Item.components."minecraft:custom_data".gm4_survival_refightalized.shield.parry_ticks
execute if score @s gm4_sr_shield.use_ticks <= $parry_ticks gm4_sr_data unless score @s gm4_sr_shield.spam_detection matches 10.. run return run function gm4_survival_refightalized:player/damage/shield/parry

# disable shield
tag @s add gm4_sr_target
execute at @s anchored eyes positioned ^ ^ ^1 summon armor_stand run function gm4_survival_refightalized:player/damage/shield/disable
tag @s remove gm4_sr_target

# dev damage log
tellraw @s[tag=gm4_sr_dev.damage_log] {"text":"Damage blocked by shield","color":"dark_gray"}

# cleanup
scoreboard players reset @s gm4_sr_stat.damage_resisted
scoreboard players reset @s gm4_sr_stat.damage_blocked
advancement revoke @s only gm4_survival_refightalized:damaged
