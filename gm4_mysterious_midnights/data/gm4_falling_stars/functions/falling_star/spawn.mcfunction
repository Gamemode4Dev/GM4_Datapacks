# @s = @e[type=marker,tag=gm4_star_impact_point]
# at @s positioned ~ 260 ~
# run from gm4_falling_stars:event

# summon falling star
summon shulker_bullet ~ ~ ~ {Motion:[0.0d,0.0d,0.0d],Tags:["gm4_falling_star","gm4_new_falling_star"],CustomName:'{"translate":"entity.gm4.falling_star","fallback":"Falling Star"}',Steps:0,Passengers:[{id:"potion",Tags:["gm4_falling_star"],CustomName:'"Falling Star"',Item:{Count:1b,id:"splash_potion",tag:{CustomPotionEffects:[{Id:25,Amplifier:0,Duration:300}],Potion:"thick",CustomPotionColor:16777215}}},{id:"area_effect_cloud",Tags:["gm4_falling_star"],Duration:600,CustomName:'"gm4_falling_star_particle"',Radius:0.5f,Particle:"end_rod"},{id:"item",Age:3600,Tags:["gm4_falling_star","gm4_falling_stars_item"],Item:{Count:1b,id:"minecraft:end_stone"}}]}

# set random motion vector
data modify storage gm4_falling_stars:motion temp.uuid set from entity @e[type=shulker_bullet,tag=gm4_new_falling_star,limit=1] UUID
data modify storage gm4_falling_stars:motion temp.motion set value [0.0d,0.0d,0.0d]
execute store result storage gm4_falling_stars:motion temp.motion[0] double 0.0000000003 run data get storage gm4_falling_stars:motion temp.uuid[0] 1
execute store result storage gm4_falling_stars:motion temp.motion[2] double 0.0000000003 run data get storage gm4_falling_stars:motion temp.uuid[1] 1
execute as @e[type=shulker_bullet,tag=gm4_new_falling_star,limit=1] run function gm4_falling_stars:falling_star/initilize
data remove storage gm4_falling_stars:motion temp

# add loot to falling star
loot spawn ~ 300 ~ loot gm4_falling_stars:star_type
execute positioned ~ 300 ~ run data modify entity @e[type=item,limit=1,tag=gm4_falling_stars_item] Item set from entity @e[type=item,limit=1,distance=..1] Item
execute as @e[type=item,limit=1,tag=gm4_falling_stars_item] if data entity @s Item.tag.gm4_endermite_egg run tag @s add gm4_endermite_star

tag @e[type=item] remove gm4_falling_stars_item
execute positioned ~ 300 ~ run kill @e[type=item,limit=1,distance=..1]

# kill marker to avoid buildup
kill @s
