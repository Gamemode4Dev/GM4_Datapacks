#@s = gm4_lt_honey_display
#run from standard_liquids:util/honey_casting/honey_rise

summon item ~ ~1 ~ {Item:{id:"honey_block",Count:1}}
playsound block.honey_block.place block @a[distance=..10]
kill @s

execute unless entity @e[type=armor_stand,tag=gm4_lt_honey_display,limit=1] run schedule clear gm4_standard_liquids:util/honey_casting/honey_rise
