
summon fireball ~ ~ ~ {Tags:["gm4_mu_boss.watcher","gm4_mu_boss.amethyst_explosion"],ExplosionPower:1b,power:[0.0,-5.0,0.0],CustomName:'{"text":"Amethyst Explosion"}'}
execute as @a[distance=..3,gamemode=!creative,gamemode=!spectator] run damage @s 6 explosion at ~ ~ ~
execute as @a[distance=3..5,gamemode=!creative,gamemode=!spectator] run damage @s 4 explosion at ~ ~ ~
effect give @a[distance=..5,gamemode=!creative,gamemode=!spectator,tag=!gm4_mu_immune_slowness] slowness 10 1
particle minecraft:explosion ~ ~1 ~ 1 1 1 0.5 3
kill @s
