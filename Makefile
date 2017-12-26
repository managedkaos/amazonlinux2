export vm   = Amazon-Linux-2
export vbox = VBoxManage

SUBDIRS   = Virtualbox
CLEANDIRS = $(SUBDIRS:%=clean-%)
CLEANALLDIRS = $(SUBDIRS:%=cleanall-%)

.PHONY : all clean cleanall $(SUBDIRS)

all : $(SUBDIRS)

clean : $(CLEANDIRS)
cleanall : $(CLEANALLDIRS)

$(SUBDIRS) :
	$(MAKE) -C $@

$(CLEANDIRS) :
	$(MAKE) -C $(@:clean-%=%) clean
	
$(CLEANALLDIRS) :
	$(MAKE) -C $(@:cleanall-%=%) cleanall
	
Vagrant : Virtualbox
