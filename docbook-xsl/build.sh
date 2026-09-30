# shellcheck shell=bash
# shellcheck disable=SC2154
# docbook-xsl: custom build script, sourced by runmake.sh (cwd: ${PKG_BLDPATH}, bash -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### The style sheets, registered in the XML catalog of lfs/libxml2:native under the URLs the documents
### import them by: the one of the release, "current" of cdn.docbook.org and the old
### docbook.sourceforge.net that systemd, polkit and xmlto name
DOCBOOK_XSL_DIR=${INSTALL_SHAREDIR}/xml/docbook/xsl-stylesheets-nons-${PKG_VER}
XML_CATALOG=${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/xml/catalog
install -v -d -m 755 "${PKG_PKGPATH}${DOCBOOK_XSL_DIR}" "${XML_CATALOG%/*}"
cp -v -R --no-preserve=ownership "${PKG_SRCPATH}"/{VERSION,assembly,common,eclipse,epub,epub3,extensions,fo,highlighting,html,htmlhelp,images,javahelp,lib,manpages,params,profiling,roundtrip,slides,template,website,xhtml,xhtml-1_1,xhtml5} \
	"${PKG_PKGPATH}${DOCBOOK_XSL_DIR}"
ln -sfv VERSION "${PKG_PKGPATH}${DOCBOOK_XSL_DIR}/VERSION.xsl"
[ -e "${XML_CATALOG}" ] || "${GLOBAL_TOOLCHAIN_PATH}/bin/xmlcatalog" --noout --create "${XML_CATALOG}"
for XSL_URL in "https://cdn.docbook.org/release/xsl-nons/${PKG_VER}" "https://cdn.docbook.org/release/xsl-nons/current" \
	"http://docbook.sourceforge.net/release/xsl/current"
do
	for ENTRY in rewriteSystem rewriteURI
	do
		"${GLOBAL_TOOLCHAIN_PATH}/bin/xmlcatalog" --noout --add "${ENTRY}" "${XSL_URL}" "file://${DOCBOOK_XSL_DIR}" "${XML_CATALOG}"
	done
done
