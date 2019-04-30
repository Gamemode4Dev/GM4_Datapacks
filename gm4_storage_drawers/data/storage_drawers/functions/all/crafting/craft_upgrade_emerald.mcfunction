#run from crafting
#@s = crafter with correct recipe for emerald upgrade
#This function only exists for the advancement grant

data merge block ~ ~ ~ {Items:[{Slot:8,id:"minecraft:emerald",Count:1b,tag:{gm4_custom_crafters:{multiplier:1}, CustomModelData:5135181124, display: {Name: '{"text":"Storage Upgrade: Emerald"}'}, Enchantments: [{id: ""}]}}]}
advancement grant @p[distance=..5] only gm4:storage_drawers_create_upgrade_emerald