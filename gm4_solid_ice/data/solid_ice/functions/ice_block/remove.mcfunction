#@s = solid ice ready to be removed

#give back cooling element (I don't know if it's more balanced if you don't get it back) and remove areaeffectcloud
execute at @s run summon item ~ ~.5 ~ {Item: {id: "player_head",Count:1,tag: {display:{Lore:['{"translate":"%1$s%3427655$s","with":["Im so cold", {translate: "item.gm4.cooling_element.lore"}],"italic":false}'],Name:['{"translate":"%1$s%3427655$s","with":["Cooling Element",{"translate":"item.gm4.cooling_element"}],"italic":false,"color":"white"}']},gm4_solid_ice:1,SkullOwner:{Id:"907b3257-ca9a-44d3-9987-003bc32be262",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZjA1NWQyZWYyZGYzZTg2YjM3MWQ0YjE5YzEwMzA4ZTA3OTM3OThmOWY1Mzk5ZWJhNTYyNmFkMjcxNDNhOWEwMCJ9fX0="}]}}}},Motion:[0.0,0.2,0.0]}
kill @s
