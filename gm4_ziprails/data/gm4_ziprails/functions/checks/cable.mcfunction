execute if block ~ ~1 ~ #gm4_ziprails:cable[attached=true] run function gm4_ziprails:ziprail/zipping
execute if entity @s[tag=gm4_linked] unless block ~ ~1 ~ #gm4_ziprails:cable run function gm4_ziprails:ziprail/clear_tags
