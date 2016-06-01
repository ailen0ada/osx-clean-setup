.PHONY: all
all : install_xcode install_ansible play_ansible

.PHONY: install_xcode
install_xcode :
	@./scripts/install_xcode.sh

.PHONY: install_ansible
install_ansible :
	@./scripts/install_ansible.sh

.PHONY: play_ansible
play_ansible :
	@./scripts/play_ansible.sh