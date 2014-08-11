CREATE EVENT "sync"."sync_all"
SCHEDULE "every 15minutes" BETWEEN '00:00' AND '23:59' EVERY 15 MINUTES
HANDLER
BEGIN 
    message 'sync_all started';

    message 'sync.add_obj_type';
	    call sync.add_obj_type();
    message 'sync.change_obj_type';
	    call sync.change_obj_type();

    message 'sync.add_organizations';
	    call sync.add_organizations();
    message 'sync.change_organizations';
	    call sync.change_organizations();

    message 'sync.add_stalls_type';
	    call sync.add_stalls_type();
    message 'sync.change_stalls_type';
	    call sync.change_stalls_type();

    message 'sync.add_objects';
	    call sync.add_objects();
    message 'sync.change_objects';
	    call sync.change_objects();

    message 'sync.add_stalls';
	    call sync.add_stalls();
    message 'sync.change_stalls';
	    call sync.change_stalls();
	    
    message 'sync.add_banks';
	    call sync.add_banks();
    message 'sync.change_banks';
	    call sync.change_banks();
END;
