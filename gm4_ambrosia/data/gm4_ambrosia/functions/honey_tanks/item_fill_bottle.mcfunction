replaceitem block ~ ~ ~ container.0 potion{gm4_ambrosia:{item:"honey_bottle",honey_level:9},display:{Name:'{"translate":"%1$s","with":["Brim-Full Bottle of Honey","TRANSLATION.KEY.FOR.MISODE"],"italic":"false"}',Lore:['{"text":"9/9 Spoons","color":"gray","italic":"false"}']},CustomPotionColor:16754944,CustomPotionEffects:[{Id:10,Amplifier:0,Duration:1600}]} 1
scoreboard players remove @s gm4_lt_buffer 1
tag @s add gm4_lt_fill

# grant advancement
advancement grant @a[distance=..4] only gm4:ambrosia_bottled_honey
