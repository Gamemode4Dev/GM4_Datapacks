#@s = alchemical_crafter with supercharge recipe
#run from recipe_validity_check

data merge block ~ ~ ~ {Items:[{Slot:4,id:"player_head",Count:1b,tag:{CustomModelData:20,gm4_transmutation_stone:1b,gm4_transmutation_charge:200s,display:{Lore:['{"translate":"%1$s%3427655$s","with":["Supercharged",{"translate":"item.gm4.ee_supercharged"}],"italic":true,"color":"aqua"}'],Name:'{"translate":"%1$s%3427655$s","with":["Transmutation Stone",{"translate":"item.gm4.transmutation_stone"}],"italic":false}'},SkullOwner:{Id:"0d867dc5-c2b3-460f-bbc6-8cbd4ae93a5f",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYWFkY2Q3OWE5YmM3OWE3NjQyYTczZTU3ZGU2NzkzOWQzYzM3OTQyN2MyMWQzODQ2MTZmNDA0MDdmMWYzNDc2MSJ9fX0="}]}}}}]}
playsound minecraft:block.end_portal.spawn block @a[distance=..8] ~ ~ ~ 0.3 2
