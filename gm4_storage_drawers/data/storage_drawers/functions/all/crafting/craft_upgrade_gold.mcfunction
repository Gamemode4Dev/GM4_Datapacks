#run from crafting
#@s = crafter with correct recipe for gold upgrade
#This function only exists for the advancement grant

data merge block ~ ~ ~ {Items:[{Slot:8,id:"minecraft:gold_ingot",Count:1b,tag:{gm4_custom_crafters:{multiplier:1}, CustomModelData:715124, display: {Name: '{"text":"Storage Upgrade: Gold"}'}, Enchantments: [{id: ""}]}}]}
advancement grant @p[distance=..5] only gm4:storage_drawers_create_upgrade_gold