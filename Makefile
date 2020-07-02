# This Makefile is a wrapper around the scripts from `package.json`.
# https://github.com/lgarron/Makefile-scripts

# Note: the first command becomes the default `make` target.
NPM_COMMANDS = build clean

.PHONY: $(NPM_COMMANDS)
$(NPM_COMMANDS):
	npm run $@

# We write the npm commands to the top of the file above to make shell autocompletion work in more places.
DYNAMIC_NPM_COMMANDS = $(shell cat package.json | npx jq --raw-output ".scripts | keys_unsorted | join(\" \")")
.PHONY: update-Makefile
update-Makefile:
	sed -i "" "s/^NPM_COMMANDS = .*$$/NPM_COMMANDS = ${DYNAMIC_NPM_COMMANDS}/" Makefile

SFTP_PATH = "towns.dreamhost.com:~/cdn.cubing.net/esm"
URL       = "https://cdn.cubing.net/esm/"

.PHONY: deploy
deploy: clean build
	rsync -avz \
		--exclude .DS_Store \
		--exclude .git \
		./build/web_modules/ \
		${SFTP_PATH}
	echo "\nDone deploying. Go to ${URL}\n"
