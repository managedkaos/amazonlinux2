vm          = Amazon-Linux-2
packer      = /usr/local/bin/packer

.PHONY : clean
.PHONY : validate build

build : validate ../Virtualbox/$(vm).ovf
	PACKER_LOG=$(PACKER_LOG) $(packer) build $(vm).json

validate : $(packer_json)
	$(packer) validate $(packer_json) $(vm).json

clean :
	true

cleanall : clean
	true
