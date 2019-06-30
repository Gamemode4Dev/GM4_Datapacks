#@s = player who has hit a mob with a spider fang
#run from advancement "use_spider_fang"

tag @s add gm4_fang_user
execute anchored eyes positioned ^ ^ ^2 run effect give @e[tag=!gm4_fang_user,distance=..2.5,nbt={HurtTime:10s}] poison 5 0
tag @s remove gm4_fang_user
advancement revoke @s only potion_infusers:use_spider_fang
