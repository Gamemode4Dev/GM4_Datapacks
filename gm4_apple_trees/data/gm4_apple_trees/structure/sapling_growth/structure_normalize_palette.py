# normalizes a minecraft structure file's palette and removes unused or duplicated
# entries. This is useful when manipulating structure files via script or by hand, 
# as it reduces filesize and mimics the form of structure blocks produced naturally 
# by the game

import amulet_nbt

def normalize_palette(structure):
    # first generate list of non-repeating palette entries
    state_map = dict() # maps old->new {old:new}
    non_repeating_palette = []
    repeated_idxs = []

    for idx, p_member in enumerate(structure.tag['palette'].copy()):
        if p_member not in non_repeating_palette:
            non_repeating_palette.append(p_member)
            state_map[idx] = idx
        else:
            state_map[idx] = non_repeating_palette.index(p_member)
            # then mark for palette entry deletion
            repeated_idxs.append(idx)
    
    for idx in reversed(repeated_idxs):
        del structure.tag['palette'][idx]
        for k in state_map.keys():
            if k > idx and k not in repeated_idxs:
                state_map[k] -= 1

    # then search through list of blocks and remove unused palette members
    used_states = set()
    for b_member in structure.tag['blocks']:
        used_states.add(b_member['state'].py_int)
    unused_states = set(state_map.keys()).difference(used_states)
    
    old_state_map = state_map.copy()
    for idx in unused_states:
        # adjust palette state mapping for removed entry
        del state_map[idx]
        for k, v in old_state_map.items():
            if v > idx:
                state_map[k] -= 1
    
    for idx in reversed(list(unused_states)):
        del structure.tag['palette'][idx]

    # finally adjust block state references with new palette
    for b_member in structure.tag['blocks']:
        b_member['state'] = amulet_nbt.IntTag(state_map[b_member['state'].py_int])

    return structure

if __name__ == '__main__':
    LOAD_FILE = 'data\gm4_golden_apple_trees\structures\golden_apple_tree_short_2'

    test_file = amulet_nbt.load(LOAD_FILE+'.nbt')
    ret = normalize_palette(test_file)
    ret.save_to(LOAD_FILE+'_normalized.nbt')