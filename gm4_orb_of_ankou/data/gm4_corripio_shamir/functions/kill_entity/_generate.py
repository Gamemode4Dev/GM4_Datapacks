values = ['allay','axolotl','bat','bee','blaze', 'cat','cave_spider','chicken','cod','cow','creeper','dolphin','donkey','drowned','elder_guardian','ender_dragon','enderman','endermite','evoker','fox','frog','ghast','giant','glow_squid','goat','guardian','hoglin','horse','husk','illusioner','iron_golem','llama','magma_cube','mooshroom','mule','ocelot','panda','parrot','phantom','pig','piglin','piglin_brute','pillager','polar_bear','pufferfish','rabbit','ravager','salmon','sheep','shulker','silverfish','skeleton_horse','skeleton','slime','snow_golem','spider','squid','stray','strider','tadpole','trader_llama','tropical_fish','turtle','vex','villager','vindicator','wandering_trader','warden','witch','wither_skeleton','wither','wolf','zoglin','zombie_horse','zombie_villager','zombie','zombified_piglin']
# for each item in the list of items
for value in values:
# construct the filename; prefix or suffix optional
    filename = './gm4_orb_of_ankou/data/gm4_corripio_shamir/functions/kill_entity/' + value + '.mcfunction'
# open the file to be written
    fo = open(filename, 'w')
# write the content in the file including the value being passed to each; %s indicates a string
    fo.write('# run from advancement hurt_entity/' + '%s' %value + '\n# @s = player who hurt a ' + '%s' %value + ' using the corripio shamir\n\nloot spawn ~ ~.3 ~ fish gm4_corripio_shamir:entities/' + '%s' %value + ' ~ ~ ~ mainhand\nexecute as @e[type=item,distance=..1,nbt={Age:0s,Item:{tag:{gm4_orb_of_ankou:{item:"soul_essence"}}}}] run data merge entity @s {PickupDelay:0}\n\nadvancement revoke @s only gm4_corripio_shamir:kill_entity/' + '%s' %value + '\n')
#close the file
fo.close()
