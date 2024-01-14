# Colors the biome hit by this potion in {{weather_modifier}} {{color}} depending on the potion bottle type thrown
# @s = @e[type=marker,tag=gm4_potion_tracker]
# at @s
# run from zauber_cauldrons:bottled_magicol/{{color}}/select_weather_modifier

# prepare fillbiome
execute if data storage gm4_zauber_cauldrons:temp/item/bottled_magicol Item{id:"minecraft:splash_potion"} run summon marker ~ ~ ~ {CustomName:'"gm4_zauber_cauldrons_magicol_painter"',Tags:["gm4_zc_magicol_painter"],data:{gm4_zauber_cauldrons:{biome:"gm4_zauber_cauldrons:{{weather_modifier}}_{{color}}_verzauberte_plains",flower:"{{flower}}"}}}
execute if data storage gm4_zauber_cauldrons:temp/item/bottled_magicol Item{id:"minecraft:lingering_potion"} run summon marker ~ ~ ~ {CustomName:'"gm4_zauber_cauldrons_magicol_painter"',Tags:["gm4_zc_magicol_painter"],data:{gm4_zauber_cauldrons:{biome:"gm4_zauber_cauldrons:glittering_{{weather_modifier}}_{{color}}_verzauberte_plains",flower:"{{flower}}"}}}

# eyecandy
execute if loaded ~ ~ ~ run summon area_effect_cloud ~ ~ ~ {CustomName:'"gm4_zauber_cauldrons_magicol_painter_particle"',Particle:"entity_effect",Radius:5f,Duration:5,Color:{{potion_color}},Tags:["gm4_zc_magicol_painter_particle"]}
particle minecraft:end_rod ~ ~ ~ 0.2 0.2 0.2 0.3 128

# run fillbiome
function gm4_zauber_cauldrons:bottled_magicol/maintain_magicol_painters
