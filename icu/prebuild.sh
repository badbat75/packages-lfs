# shellcheck shell=bash
# shellcheck disable=SC2154
# icu: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.
# The release tarball unpacks as source/ (the repository snapshot had icu4c/source/).

sed -i 's| $(ICUPKGDATA_DIR)| $(DESTDIR)/$(ICUPKGDATA_DIR)|g' source/data/Makefile.in
sed -i 's|$(CURR_TREE)|curr|' source/data/Makefile.in
sed -i 's|$(LANG_TREE)|lang|' source/data/Makefile.in
sed -i 's|$(REGION_TREE)|region|' source/data/Makefile.in
sed -i 's|$(ZONE_TREE)|zone|' source/data/Makefile.in
sed -i 's|$(UNIT_TREE)|unit|' source/data/Makefile.in
sed -i 's|$(BREAK_TREE)|brkitr|' source/data/Makefile.in
sed -i 's|$(COLLATION_TREE)|coll|' source/data/Makefile.in
sed -i 's|$(RBNF_TREE)|rbnf|' source/data/Makefile.in
sed -i 's|$(TRANSLIT_TREE)|translit|' source/data/Makefile.in
