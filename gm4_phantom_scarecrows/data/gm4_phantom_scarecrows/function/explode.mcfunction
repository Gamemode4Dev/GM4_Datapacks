# @s = @e[type=area_effect_cloud,tag=gm4_phantom_scarecrow_rocket] with phantom within 0.5 blocks
# at @s
# ran from propulsion

#generate random color
execute store result score color gm4_ps_time run data get entity @s UUID[0]
scoreboard players operation color gm4_ps_time %= modulo gm4_ps_time

#explosion
execute if score color gm4_ps_time matches 0 run summon minecraft:firework_rocket ~ ~ ~ {Silent:1b,LifeTime:0,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"small_ball",has_twinkle:1b,has_trail:0b,colors:[I;7211016],fade_colors:[I;3671815]}]}}}}

execute if score color gm4_ps_time matches 1 run summon minecraft:firework_rocket ~ ~ ~ {Silent:1b,LifeTime:0,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"small_ball",has_twinkle:1b,has_trail:0b,colors:[I;4018687],fade_colors:[I;7382527]}]}}}}

execute if score color gm4_ps_time matches 2 run summon minecraft:firework_rocket ~ ~ ~ {Silent:1b,LifeTime:0,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"small_ball",has_twinkle:1b,has_trail:0b,colors:[I;16773153],fade_colors:[I;15531886]}]}}}}

#advancement
advancement grant @a[distance=..3,gamemode=!spectator] only gm4:phantom_scarecrows

kill @e[type=phantom,distance=..0.5,limit=1,sort=nearest]
#kill other rockets within explosion radius
kill @e[type=area_effect_cloud,tag=gm4_phantom_scarecrow_rocket,distance=..3]
kill @s
