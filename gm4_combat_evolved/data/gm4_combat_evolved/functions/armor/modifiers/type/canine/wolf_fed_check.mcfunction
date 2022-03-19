# run from advancement feed_canine
# @s = player that fed a canine wolf
# at @s

advancement revoke @s only gm4_combat_evolved:feed_canine

# check which wolf was fed
execute as @e[type=wolf,tag=gm4_ce_wolf] if data entity @s InLove run function gm4_combat_evolved:armor/modifiers/type/canine/wolf_fed_power
