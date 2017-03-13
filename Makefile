### Environment constants 

LGW_PATH ?= ../../lora_gateway/libloragw
ARCH ?=
CROSS_COMPILE ?=
export

### general build targets

all:
	$(MAKE) all -e -C basic_pkt_fwd
	$(MAKE) all -e -C gps_pkt_fwd
	$(MAKE) all -e -C beacon_pkt_fwd
	$(MAKE) all -e -C poly_pkt_fwd
	$(MAKE) all -e -C util_ack
	$(MAKE) all -e -C util_sink
	$(MAKE) all -e -C util_tx_test

clean:
	$(MAKE) clean -e -C basic_pkt_fwd
	$(MAKE) clean -e -C gps_pkt_fwd
	$(MAKE) clean -e -C beacon_pkt_fwd
	$(MAKE) clean -e -C poly_pkt_fwd
	$(MAKE) clean -e -C util_ack
	$(MAKE) clean -e -C util_sink
	$(MAKE) clean -e -C util_tx_test

install:
	mkdir -p $(DESTDIR)$(prefix)/lib/systemd/system
	install -m 0755 basic_pkt_fwd $(DESTDIR)$(prefix)/sbin
	install -m 0755 gps_pkt_fwd $(DESTDIR)$(prefix)/sbin
	install -m 0755 beacon_pkt_fwd $(DESTDIR)$(prefix)/sbin
	install -m 0755 poly_pkt_fwd $(DESTDIR)$(prefix)/sbin
	install -m 0755 util_ack $(DESTDIR)$(prefix)/sbin
	install -m 0755 util_sink $(DESTDIR)$(prefix)/sbin
	install -m 0755 util_tx_test $(DESTDIR)$(prefix)/sbin
	install -m 0755 debian/ttn-gateway.systemd $(DESTDIR)$(prefix)/lib/systemd/system/ttn-gateway@.service
### EOF
