#run from crafting
#@s = crafter with correct recipe for key
#This function only exists for the advancement grant

data merge block ~ ~ ~ {Items:[{Slot:8,id:"minecraft:gold_nugget",Count:1b,tag:{gm4_custom_crafters:{multiplier:1}, CustomModelData:11525, display: {Name: '{"text":"Key"}'}, Enchantments: [{id: ""}]}}]}
advancement grant @p[distance=..5] only gm4:storage_drawers_create_key