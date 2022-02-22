# run from advancement feed_canine
# @s = player that fed a canine wolf
# at @s

advancement revoke @s only gm4_armor_identification:feed_canine

# check which wolf was fed
execute as @e[type=wolf,tag=gm4_ai_wolf] if data entity @s InLove run function gm4_armor_identification:armor/modifiers/type/canine/wolf_fed_power
