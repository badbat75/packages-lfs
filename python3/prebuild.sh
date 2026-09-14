# shellcheck shell=bash
# shellcheck disable=SC2154
# python3: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed -i 's/self.srcdir = sysconfig.get_config_var('\''srcdir'\'')/self.srcdir = os.path.dirname(os.path.abspath(__file__))/' -i setup.py
