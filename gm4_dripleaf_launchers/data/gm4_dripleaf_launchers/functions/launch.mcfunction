# launch into the air!
# @s = player on dripleaf
# at @s
# run from check

tag @s remove gm4_dl_on_dripleaf
playsound minecraft:block.big_dripleaf.tilt_up player @s ~ ~1 ~ 3 0 1
playsound minecraft:block.beehive.enter player @s ~ ~1 ~ 1 1.6 1
execute align xyz run particle block big_dripleaf ~.5 ~.93751 ~.5 0.25 0.01 0.25 0 12

execute align y run summon snowball ~ ~.93751 ~ {Motion:[0.0,3.0,0.0],Tags:["gm4_dl_launch","gm4_dl_launch_new"],Item:{id:"minecraft:grass",Count:1b}}
ride @s mount @e[type=snowball,tag=gm4_dl_launch_new,limit=1]
effect give @s minecraft:levitation 1 30 true
tag @e[type=snowball,tag=gm4_dl_launch_new] remove gm4_dl_launch_new
