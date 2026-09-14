# shellcheck shell=bash
# shellcheck disable=SC2154
# icu: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed -i 's| $(ICUPKGDATA_DIR)| $(DESTDIR)/$(ICUPKGDATA_DIR)|g' icu4c/source/data/Makefile.in
	sed -i 's|$(CURR_TREE)|curr|' icu4c/source/data/Makefile.in
	sed -i 's|$(LANG_TREE)|lang|' icu4c/source/data/Makefile.in
	sed -i 's|$(REGION_TREE)|region|' icu4c/source/data/Makefile.in
	sed -i 's|$(ZONE_TREE)|zone|' icu4c/source/data/Makefile.in
	sed -i 's|$(UNIT_TREE)|unit|' icu4c/source/data/Makefile.in
	sed -i 's|$(BREAK_TREE)|brkitr|' icu4c/source/data/Makefile.in
	sed -i 's|$(COLLATION_TREE)|coll|' icu4c/source/data/Makefile.in
	sed -i 's|$(RBNF_TREE)|rbnf|' icu4c/source/data/Makefile.in
	sed -i 's|$(TRANSLIT_TREE)|translit|' icu4c/source/data/Makefile.in
