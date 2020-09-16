#@s = vex mould entity
#runs from initialize

setblock ~ ~1 ~ minecraft:fire
playsound block.fire.extinguish block @a ~ ~ ~ .25 .9
summon minecraft:armor_stand ~ ~ ~ {NoGravity:1b,Silent:1b,Small:1b,Invisible:1b,CustomName:'"gm4_burnt_head"',Tags:["gm4_burnt_head","gm4_no_edit"],DeathLootTable:"minecraft:empty"}
