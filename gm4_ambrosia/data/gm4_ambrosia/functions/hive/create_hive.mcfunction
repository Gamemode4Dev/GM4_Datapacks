#@s = larvae item on top of barrel
#run from larvea/validate_larvae

# create beehive
data merge block ~ ~-1 ~ {CustomName:'{"translate":"%1$s","with":["Beehive","block.gm4.beehive"]}'}
execute unless entity @e[type=area_effect_cloud,distance=..1,tag=gm4_beehive] align xyz positioned ~.5 ~ ~.5 run summon area_effect_cloud ~ ~-.5 ~ {CustomName:'{"text":"gm4_beehive"}',Tags:["gm4_beehive"],Duration:2147483647}
scoreboard players set @e[type=area_effect_cloud,distance=..1,tag=gm4_beehive] gm4_bees 1
kill @s

# particle and sound
particle block yellow_concrete_powder ~ ~ ~ 0.3 0 0.3 0.5 13
playsound block.barrel.close block @a ~ ~ ~ 1 1.5

# summon a single ambient bee as feedback
function gm4_ambrosia:beehavior/spawn_roaming_bee

# grant advancement
advancement grant @a[distance=..6] only gm4:ambrosia_create_beehive
