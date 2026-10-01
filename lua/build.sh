# shellcheck shell=bash
# shellcheck disable=SC2154
# lua: build script, sourced by runmake.sh (cwd: ${PKG_BLDPATH}, a copy of the sources, bash -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### The modules of the image under its prefix, not /usr/local
sed -i "s|^#define LUA_ROOT.*|#define LUA_ROOT\t\"${INSTALL_PREFIX}/\"|" src/luaconf.h
### The objects of liblua.a position independent, for the shared library too; lua.o and luac.o
make -C src CC="${CC}" AR="${AR} rcu" RANLIB="${RANLIB}" MYCFLAGS="${CFLAGS} ${CPPFLAGS} -fPIC" \
	SYSCFLAGS="-DLUA_USE_LINUX" liblua.a lua.o luac.o
(
	cd src
	LUA_OBJECTS=$( ${AR} t liblua.a | tr '\n' ' ' )
	### The objects of the archive, one word each
	# shellcheck disable=SC2086
	${CC} -shared ${CFLAGS} ${LDFLAGS} -Wl,-soname,liblua.so.${LUA_MAJVER} -o liblua.so.${PKG_VER} ${LUA_OBJECTS} -lm -ldl
	ln -sf liblua.so.${PKG_VER} liblua.so.${LUA_MAJVER}
	ln -sf liblua.so.${LUA_MAJVER} liblua.so
	### lua with the shared library (-E: the C modules it loads find the API in it), luac with the static
	### one: it uses functions the shared library does not export
	${CC} ${CFLAGS} ${LDFLAGS} -Wl,-E -o lua lua.o -L. -llua -lm -ldl
	${CC} ${CFLAGS} ${LDFLAGS} -o luac luac.o liblua.a -lm -ldl
)

DESTDIR=${PKG_PKGPATH}
install -vdm755 "${DESTDIR}${INSTALL_EXECPREFIX}/bin" "${DESTDIR}${INSTALL_INCLUDEDIR}" \
	"${DESTDIR}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/pkgconfig" "${DESTDIR}${INSTALL_SHAREDIR}/man/man1" \
	"${DESTDIR}${INSTALL_SHAREDIR}/lua/${LUA_MAJVER}" "${DESTDIR}${INSTALL_PREFIX}/lib/lua/${LUA_MAJVER}"
install -vm755 src/lua src/luac "${DESTDIR}${INSTALL_EXECPREFIX}/bin"
install -vm644 src/lua.h src/luaconf.h src/lualib.h src/lauxlib.h src/lua.hpp "${DESTDIR}${INSTALL_INCLUDEDIR}"
cp -dv src/liblua.so* "${DESTDIR}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}"
install -vm644 src/liblua.a "${DESTDIR}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}"
install -vm644 doc/lua.1 doc/luac.1 "${DESTDIR}${INSTALL_SHAREDIR}/man/man1"
cat > "${DESTDIR}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/pkgconfig/lua.pc" <<-PC
	V=${LUA_MAJVER}
	R=${PKG_VER}
	prefix=${INSTALL_PREFIX}
	exec_prefix=${INSTALL_EXECPREFIX}
	libdir=${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}
	includedir=${INSTALL_INCLUDEDIR}
	INSTALL_LMOD=${INSTALL_SHAREDIR}/lua/${LUA_MAJVER}
	INSTALL_CMOD=${INSTALL_PREFIX}/lib/lua/${LUA_MAJVER}

	Name: Lua
	Description: An Extensible Extension Language
	Version: ${PKG_VER}
	Libs: -L\${libdir} -llua -lm -ldl
	Cflags: -I\${includedir}
PC
ln -sfv lua.pc "${DESTDIR}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/pkgconfig/lua${LUA_MAJVER}.pc"
