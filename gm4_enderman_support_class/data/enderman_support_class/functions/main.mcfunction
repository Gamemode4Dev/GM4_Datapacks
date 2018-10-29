#tag all hostile mobs (and shulkers) near an enderman
execute at @e[type=enderman,tag=!gm4_noESC] run tag @e[distance=..25,nbt={Attributes:[{Name:"generic.attackDamage"}]},tag=!gm4_noESC] add gm4_ESC
execute at @e[type=enderman,tag=!gm4_noESC] run tag @e[distance=..25,type=shulker,tag=!gm4_noESC] add gm4_ESC

#apply buffs to mobs with tag
execute at @e[type=skeleton,tag=gm4_ESC] run effect give @a[distance=..7] weakness 7 0
execute at @e[type=shulker,tag=gm4_ESC] run effect give @a[distance=..7] blindness 3 9
effect give @e[type=silverfish,tag=gm4_ESC] resistance 4 1
effect give @e[type=creeper,tag=gm4_ESC] regeneration 4 0
effect give @e[type=spider,tag=gm4_ESC] jump_boost 4 1
effect give @e[type=cave_spider,tag=gm4_ESC] jump_boost 4 1
effect give @e[type=zombie,tag=gm4_ESC] speed 4 1

#advancement
advancement grant @a[tag=gm4_ESC] only gm4:enderman_support_class

tag @e remove gm4_ESC
