.PHONY: clean-tptp clean-tchs

all:
	@echo There is no default target:
	@echo
	cat Makefile

# remove all .tptp files under ./
clean-tptp:
	find ./ -name '*.tptp' -exec rm {} +
# remove all .tc.hs files under ./
clean-tchs:
	find ./ -name '*.tc.hs' -exec rm {} +
