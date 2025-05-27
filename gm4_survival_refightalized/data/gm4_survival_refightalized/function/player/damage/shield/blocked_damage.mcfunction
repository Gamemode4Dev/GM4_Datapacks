# disable shield if it blocked damage
# @s = damaged player
# at @s
# run from player/damage/run

# revoke advancement as it's not needed for shield blocking
advancement revoke @s only gm4_survival_refightalized:damaged

# non-player attacker is weak for 1 second so they don't immediatly hit again
execute on attacker run effect give @s[type=!player] weakness 1 9 true

# apply durability damage to shield if needed
execute unless score @s gm4_sr_stat.damage_blocked matches 1.. run function gm4_survival_refightalized:player/damage/shield/durability/run

# parried
execute if score @s gm4_sr_shield.use_ticks matches ..5 run return run function gm4_survival_refightalized:player/damage/shield/parry

# disable shield
function gm4_survival_refightalized:player/damage/shield/disable

# dev damage log
tellraw @s[tag=gm4_sr_dev.damage_log] {"text":"Damage blocked by shield","color":"dark_gray"}

# cleanup
scoreboard players reset @s gm4_sr_stat.damage_resisted
scoreboard players reset @s gm4_sr_stat.damage_blocked
advancement revoke @s only gm4_survival_refightalized:damaged
