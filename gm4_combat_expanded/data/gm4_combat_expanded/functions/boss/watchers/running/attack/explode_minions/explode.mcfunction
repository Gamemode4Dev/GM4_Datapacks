
summon fireball ~ ~ ~ {Tags:["gm4_ce_boss.watcher","gm4_ce_boss.amethyst_explosion"],ExplosionPower:1b,power:[0.0,-5.0,0.0],CustomName:'{"text":"Amethyst Explosion"}'}
execute as @a[distance=..3,gamemode=!creative,gamemode=!spectator] run damage @s 18 explosion at ~ ~ ~
execute as @a[distance=3..5,gamemode=!creative,gamemode=!spectator] run damage @s 10 explosion at ~ ~ ~
effect give @a[distance=..5,gamemode=!creative,gamemode=!spectator] slowness 10 1
particle minecraft:explosion ~ ~1 ~ 1 1 1 0.5 3
kill @s
