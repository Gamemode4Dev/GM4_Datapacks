#@s = vex mould entity
#runs from initialize

#melt copper
execute if block ~ ~1 ~ minecraft:player_head{SkullOwner:{Id:[I;-359695444,30126360,-1513204284,-616246813]}} run function gm4_metallurgy:casting/recycle_band/add_copper

#melt barium
execute if block ~ ~1 ~ minecraft:player_head{SkullOwner:{Id:[I;-758190455,118414880,1677653096,2076204799]}} run function gm4_metallurgy:casting/recycle_band/add_barium

#melt thorium
execute if block ~ ~1 ~ minecraft:player_head{SkullOwner:{Id:[I;1709100198,-881135263,-295939255,1602156123]}} run function gm4_metallurgy:casting/recycle_band/add_thorium

#melt aluminium
execute if block ~ ~1 ~ minecraft:player_head{SkullOwner:{Id:[I;1961294324,1560605478,885901402,915511979]}} run function gm4_metallurgy:casting/recycle_band/add_aluminium

#melt barimium
execute if block ~ ~1 ~ minecraft:player_head{SkullOwner:{Id:[I;-340714413,1525011343,50560746,-1948445052]}} run function gm4_metallurgy:casting/recycle_band/add_barimium

#melt thorium brass
execute if block ~ ~1 ~ minecraft:player_head{SkullOwner:{Id:[I;-1331314679,659659762,2101919484,662148976]}} run function gm4_metallurgy:casting/recycle_band/add_thorium_brass
