#run from trident
#@s is trident with inGround and a hopper with empty slot 1

data modify block ~ ~-.1 ~ Items insert 1 value {Count:1,Slot:1,id:"trident"}
data modify block ~ ~-.1 ~ Items[1].tag set from entity @s Trident.tag
scoreboard players set @s gm4_bh_data 1
kill @s