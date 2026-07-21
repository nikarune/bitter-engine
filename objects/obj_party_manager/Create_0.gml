party_size = 3;
party_record_dist = 20;

global.record_ref = obj_party_manager;

pos = [];

for (var i = 0; i < party_size * party_record_dist; i++) {
	
	pos[i] = {
		x : global.record_ref.x,
		y : global.record_ref.y,
	}
		
}

party_add("bob", new Party_Member());
party_add("eee", new Party_Member());