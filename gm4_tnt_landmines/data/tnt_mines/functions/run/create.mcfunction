#@s = tnt player skull on ground
#runs from tnt_mines:main

#kills item
kill @s
#summons landmine display stand
summon armor_stand ~ ~ ~ {Fire:10000,Marker:1b,NoGravity:1b,Invulnerable:1b,Small:1b,Invisible:1b,Tags:["gm4_tnt_mines_mine"],DisabledSlots:4140847,ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{display:{Name:"{\"text\":\"TNT Landmine\",\"color\":\"red\",\"italic\":\"false\"}",Lore:["§fDrop on ground to create!"]},SkullOwner:{Id:"3d80d659-36cd-4aee-8540-8cdb548ede75",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2FmNTk3NzZmMmYwMzQxMmM3YjU5NDdhNjNhMGNmMjgzZDUxZmU2NWFjNmRmN2YyZjg4MmUwODM0NDU2NWU5In19fQ=="}]}}}}],CustomName:"{\"text\":\"gm4_tnt_mines_mine\"}"}
#gives advancement to player
advancement grant @p[gamemode=!spectator,distance=..8] only gm4:tnt_mines_create