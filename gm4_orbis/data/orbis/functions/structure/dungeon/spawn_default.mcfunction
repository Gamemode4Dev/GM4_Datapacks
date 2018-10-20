setblock ~ ~ ~ structure_block{ignoreEntities:0b,posX:-8,mode:"LOAD",posY:-7,posZ:-8,showair:0b,name:"orbis:dungeon_default",showboundingbox:0b}
setblock ~ ~1 ~ redstone_block
scoreboard players add orbis_dungeons gm4_count 1
function orbis:structure/announce
