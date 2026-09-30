# shellcheck shell=bash
# shellcheck disable=SC2154
# docbook-xml: custom build script, sourced by runmake.sh (cwd: ${PKG_BLDPATH}, bash -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### The DTD and its entities, registered in the XML catalog that xmllint and xsltproc of
### lfs/libxml2:native read by default (${INSTALL_SYSCONFDIR}/xml/catalog): a document that names the
### DTD of DocBook 4.1.2 to 4.5 by its public identifier or its URL gets the local 4.5, as with the
### DocBook XML of LFS. xmlcatalog --add replaces an entry that is already there
DOCBOOK_XML_DIR=${INSTALL_SHAREDIR}/xml/docbook/xml-dtd-${PKG_VER}
XML_CATALOG=${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/xml/catalog
install -v -d -m 755 "${PKG_PKGPATH}${DOCBOOK_XML_DIR}" "${XML_CATALOG%/*}"
cp -v -af --no-preserve=ownership "${PKG_SRCPATH}"/{docbook.cat,*.dtd,ent,*.mod} "${PKG_PKGPATH}${DOCBOOK_XML_DIR}"
[ -e "${XML_CATALOG}" ] || "${GLOBAL_TOOLCHAIN_PATH}/bin/xmlcatalog" --noout --create "${XML_CATALOG}"
for DTD_VER in 4.1.2 4.2 4.3 4.4 4.5
do
	"${GLOBAL_TOOLCHAIN_PATH}/bin/xmlcatalog" --noout --add public "-//OASIS//DTD DocBook XML V${DTD_VER}//EN" \
		"file://${DOCBOOK_XML_DIR}/docbookx.dtd" "${XML_CATALOG}"
	for ENTRY in rewriteSystem rewriteURI
	do
		"${GLOBAL_TOOLCHAIN_PATH}/bin/xmlcatalog" --noout --add "${ENTRY}" "http://www.oasis-open.org/docbook/xml/${DTD_VER}" \
			"file://${DOCBOOK_XML_DIR}" "${XML_CATALOG}"
	done
done
