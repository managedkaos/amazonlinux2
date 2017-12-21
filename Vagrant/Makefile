seed.iso : ./config/meta-data ./config/user-data
	hdiutil makehybrid -o seed.iso -hfs -joliet -iso -default-volume-name cidata config/

clean :
	rm seed.iso
