summon armor_stand ~ ~ ~ {Tags:["trapped_signs_init"],NoGravity:1b,Invisible:1b,Marker:1b}
data merge block ~ ~ ~ {Text4:"{\"text\":\"-*-\",\"bold\":false,\"italic\":false,\"underlined\":false,\"color\":\"black\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"function trapped_signs:pulse\"}}"}
data merge entity @e[limit=1,type=armor_stand,tag=trapped_signs_init] {Tags:["trapped_sign"]}
