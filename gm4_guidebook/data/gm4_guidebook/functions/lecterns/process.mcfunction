# process lecterns
# @s = guidebook lectern marker
# located at @s
# run from gm4_guidebook:main

execute unless block ~ ~ ~ lectern run kill @s
execute unless entity @a[gamemode=!spectator,distance=..6,limit=1] run tag @s[tag=gm4_guide_tracking] remove gm4_guide_tracking
