#@s = @s[scores={gm4_gold_sword=109} = @a[score_GM4_useGSword_min=1]
effect give @e[distance=..2.5,tag=!smithed.strict,tag=!gm4_gold_user] wither 4 1
execute as @e[type=skeleton,tag=!smithed.entity,nbt={ActiveEffects:[{Id:20}],HurtTime:10s},distance=..5] at @s run function gm4_potion_swords:wither_transform
