# @s = brewing stand marker that finished brewing a potion
# run from #gm4_brewing:finish_brew

# poison potion + fermented spider eye -> regeneration potion 
# (only implemented for first potion slot in this example)
execute if entity @s[nbt={data:{gm4_brewing:{previous_items:[{Slot:3b,id:"minecraft:fermented_spider_eye"},{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:poison"}}]}}}] run data modify block ~ ~ ~ Items[{Slot:0b}] set value {Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:regeneration"}}
