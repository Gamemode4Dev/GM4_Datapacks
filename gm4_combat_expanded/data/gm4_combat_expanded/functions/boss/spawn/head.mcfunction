
kill @e[type=item_display,tag=gm4_ce_boss.head]
kill @e[type=block_display,tag=gm4_ce_boss.head]

summon item_display ~ ~ ~ {Tags:["gm4_ce_boss.head","gm4_ce_boss.head_main"],teleport_duration:2,item:{id:"minecraft:chiseled_deepslate",Count:1b},Passengers:[\
    {id:"minecraft:item_display",brightness:{sky:15,block:15},Tags:["gm4_ce_boss.head","gm4_ce_boss.eyes"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.1875f,0.3125f],scale:[1.005f,0.125f,0.25f]},item:{id:"minecraft:amethyst_block",Count:1b}},\
    {id:"minecraft:item_display",brightness:{sky:15,block:15},Tags:["gm4_ce_boss.head","gm4_ce_boss.eyes"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.1875f,-0.3125f],scale:[1.005f,0.125f,0.25f]},item:{id:"minecraft:amethyst_block",Count:1b}},\
    {id:"minecraft:item_display",brightness:{sky:15,block:15},Tags:["gm4_ce_boss.head","gm4_ce_boss.eyes"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.3125f,0.1875f,0f],scale:[0.25f,0.125f,1.005f]},item:{id:"minecraft:amethyst_block",Count:1b}},\
    {id:"minecraft:item_display",brightness:{sky:15,block:15},Tags:["gm4_ce_boss.head","gm4_ce_boss.eyes"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.3125f,0.1875f,0f],scale:[0.25f,0.125f,1.005f]},item:{id:"minecraft:amethyst_block",Count:1b}},\
    {id:"minecraft:block_display",teleport_duration:2,Tags:["gm4_ce_boss.head","gm4_ce_boss.crystal"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[1f,0f,0f,1f],translation:[-0.5f,0.5f,0.4375f],scale:[0.5f,0.5f,0.5f]},block_state:{Name:"minecraft:amethyst_cluster"}},\
    {id:"minecraft:item_display",Tags:["gm4_ce_boss.head","gm4_ce_boss.vertical"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-0.0025f,0f],scale:[0.95f,1.0075f,0.95f]},item:{id:"minecraft:polished_deepslate",Count:1b}}\
    ]}

