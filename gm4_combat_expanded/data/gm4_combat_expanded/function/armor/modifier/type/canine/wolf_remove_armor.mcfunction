# remove armor from wolf
# @s = wolf that is waering armor
# at @s
# run from armor/type/canine/wolf_interact_check

# spawn item with the data
summon item ~ ~ ~ {Tags:["gm4_ce_dropped_wolf_armor"],Item:{id:"wolf_armor",count:1}}
item replace entity @e[type=item,tag=gm4_ce_dropped_wolf_armor,limit=1,sort=nearest,distance=..1] contents from entity @s armor.body

# remove armor from wolf
data remove entity @s body_armor_item
