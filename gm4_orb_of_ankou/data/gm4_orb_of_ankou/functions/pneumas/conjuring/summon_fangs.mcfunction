# @s = fang_thrower armor stand
# run from pneumas/conjuring/throw

summon evoker_fangs ~ ~ ~ {Tags:[gm4_oa_fang]}
data modify entity @e[type=evoker_fangs,tag=gm4_oa_fang,limit=1,distance=..0.1] Owner set from entity @s ArmorItems[0].tag.gm4_oa_conjuring
tag @e[type=evoker_fangs] remove gm4_oa_fang

tag @a[distance=..1,gamemode=!creative,gamemode=!spectator] add gm4_oa_magic_ignore
tag @a[distance=..1,gamemode=!creative,gamemode=!spectator] add gm4_oa_magic_damaged
schedule function gm4_orb_of_ankou:pneumas/temp_tick/magic_damaged 1t
