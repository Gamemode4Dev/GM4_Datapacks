
summon fireball ~ ~ ~ {Tags:["gm4_ce_boss","gm4_ce_boss.amethyst_explosion"],ExplosionPower:-3b,power:[0.0,-5.0,0.0],CustomName:'{"text":"Amethyst Explosion"}'}
execute as @a[distance=..3] run damage @s 18 explosion by @e[type=fireball,tag=gm4_ce_boss.amethyst_explosion,limit=1,distance=..5]
execute as @a[distance=3..5] run damage @s 10 explosion by @e[type=fireball,tag=gm4_ce_boss.amethyst_explosion,limit=1,distance=..5]
particle minecraft:explosion ~ ~1 ~ 1 1 1 0.5 3
kill @s
