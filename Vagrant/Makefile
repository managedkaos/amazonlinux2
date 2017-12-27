vm          = Amazon-Linux-2
packer      = /usr/local/bin/packer
packer_json = ./packer.json

.PHONY : clean
.PHONY : validate build

build : validate ../Virtualbox/$(vm).ovf
	PACKER_LOG=$(PACKER_LOG) $(packer) build $(packer_json)

validate : $(packer_json)
	$(packer) validate $(packer_json)

clean :
	true

cleanall : clean
	true
