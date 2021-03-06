vm        = Amazon-Linux-2
iso       = seed.iso
vdi       = amzn2-virtualbox-2017.12.0.20171212.2-x86_64.xfs.gpt.vdi
vbox      = VBoxManage

.PHONY: clean 
.PHONY: cleanall

$(vm).ovf : $(vm).txt
	$(vbox) startvm $(vm) --type headless || exit 0
	sleep 60
	$(vbox) controlvm $(vm) acpipowerbutton || exit 0
	sleep 6
	$(vbox) export $(vm) -o $(vm).ovf
	$(vbox) storageattach $(vm) --storagectl SATA --port 0 --device 0 --medium none || exit 0
	$(vbox) storageattach $(vm) --storagectl IDE  --port 0 --device 0 --medium none || exit 0
	$(vbox) unregistervm  $(vm) --delete || exit 0

$(vm).txt : $(iso) $(vdi)
	$(vbox) createvm --name $(vm) --ostype Linux26_64 --register
	$(vbox) storagectl $(vm) --name IDE  --add ide
	$(vbox) storageattach $(vm) --storagectl IDE --port 0 --device 0 --type dvddrive --medium $(iso)
	$(vbox) storagectl $(vm) --name SATA --add sata --controller IntelAHCI
	$(vbox) storageattach $(vm) --storagectl SATA --port 0 --device 0 --type hdd --medium $(vdi)
	$(vbox) modifyvm $(vm) --ioapic on
	$(vbox) modifyvm $(vm) --boot1 dvd --boot2 disk
	$(vbox) modifyvm $(vm) --memory 1024 --vram 128
	$(vbox) modifyvm $(vm) --nic1 NAT
	$(vbox) modifyvm $(vm) --natpf1 "ssh,tcp,127.0.0.1,2222,,22"
	$(vbox) showvminfo $(vm) > $(vm).txt

$(iso) : ./config/meta-data ./config/user-data
	hdiutil makehybrid -o $@ -hfs -joliet -iso -default-volume-name cidata config/

$(vdi):
	wget --quiet --timestamping --output-document $@ https://cdn.amazonlinux.com/os-images/2017.12.0.20171212.2/virtualbox/$@

clean : 
	$(vbox) controlvm $(vm) acpipowerbutton || exit 0
	sleep 2
	$(vbox) storageattach $(vm) --storagectl SATA --port 0 --device 0 --medium none || exit 0
	$(vbox) storageattach $(vm) --storagectl IDE  --port 0 --device 0 --medium none || exit 0
	$(vbox) unregistervm  $(vm) --delete || exit 0
	rm -f $(vm).txt $(vm).ovf $(vm)*disk*.vmdk

cleanall : clean
	rm -f $(iso) $(vdi)
