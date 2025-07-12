

tellraw @p "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

tellraw @p [{text:"| Tracked Foal: "},{selector:"@s"}]

tellraw @p ""

tellraw @p [{text:"Foal Potential: ","color":"gray"},{"score":{"name":"@s","objective":"gm4_horse_potential.foal"},"color":"white"},\
{text:"/33750"}]

tellraw @p ""

execute store result score $nearby_horses gm4_horse_data at @s if entity @e[type=#gm4_horsemanship:trainable,distance=0.01..24,limit=10]

tellraw @p [{text:"Grazes left: ","color":"gray"},{"score":{"name":"@s","objective":"gm4_horse_need.graze"},"color":"white"},\
{text:"/1 | Leash Time: "},{"score":{"name":"@s","objective":"gm4_horse_need.on_leash"},"color":"white"},\
{text:"/150 | Nearby Horses: "},{"score":{"name":"$nearby_horses","objective":"gm4_horse_data"},"color":"white"},\
{text:"/10"},\
]
