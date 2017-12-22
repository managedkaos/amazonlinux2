export vm   = Amazon-Linux-2
export vbox = VBoxManage

SUBDIRS   = Virtualbox Vagrant
CLEANDIRS = $(SUBDIRS:%=clean-%)

.PHONY : all clean $(SUBDIRS)

all : $(SUBDIRS)

clean : $(CLEANDIRS)

$(SUBDIRS) :
	$(MAKE) -C $@

$(CLEANDIRS) :
	$(MAKE) -C $(@:clean-%=%) clean
	
Vagrant : Virtualbox
