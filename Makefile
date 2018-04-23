SFD=$(notdir $(wildcard src/*.sfd))

TTF=$(addprefix fonts/, $(SFD:%.sfd=%.ttf))
OTF=$(addprefix fonts/, $(SFD:%.sfd=%.otf))

fonts/%.ttf: src/%.sfd
	[ -d fonts ] || mkdir -p fonts
	fontforge -lang=ff -c 'Open($$1); Generate($$2)' $< $@

fonts/%.otf: src/%.sfd
	[ -d fotns ] || mkdir -p fonts
	fontforge -lang=ff -c 'Open($$1); Generate($$2)' $< $@

all: ${TTF} ${OTF}

clean:
	-rm ${TTF} ${OTF}
