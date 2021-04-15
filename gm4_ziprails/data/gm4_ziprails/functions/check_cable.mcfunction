# Checks to see if minecart is under a tripwire cable
# @s = minecart
# at @s
# runs from gm4_ziprails:tick

execute if block ~ ~1 ~ #gm4_ziprails:cable[attached=true] run function gm4_ziprails:ziprail/zipping
execute if entity @s[tag=gm4_linked] unless block ~ ~1 ~ #gm4_ziprails:cable run function gm4_ziprails:ziprail/clear_tags
