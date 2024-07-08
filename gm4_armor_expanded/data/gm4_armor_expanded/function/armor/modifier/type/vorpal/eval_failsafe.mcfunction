# eval spreadplayer command
# @s = player wearing vorpal armor being damaged
# at @s
# run from armor/type/vorpal/failsafe

$spreadplayers ~ ~ 0 8 under $(max_y) false @s
scoreboard players set $warp_safe gm4_ae_data 0
execute at @s if predicate gm4_armor_expanded:technical/valid_tp run scoreboard players set $warp_safe gm4_ae_data 1
