#!/usr/bin/env sh

# shellcheck source=./lib/create_table
. "$(dirname "$0")"/lib/create_table
# shellcheck source=./lib/insert
. "$(dirname "$0")"/lib/insert

CALLER="$1"
shift

. "$(dirname "$0")"/"$CALLER"/get_title

DB_PATH="$1"
shift

insert_pages() {
	# Get title and insert into table for each html file
	while [ -n "$1" ]; do
		unset PAGE_NAME
		unset PAGE_TYPE
		PAGE_NAME="$(get_title "$1")"
		PAGE_TYPE="Guide"
		if [ -n "$PAGE_NAME" ]; then
			insert "$DB_PATH" "$PAGE_NAME" "$PAGE_TYPE" "$(basename "$1")"
		fi
		shift
	done
}

create_table "$DB_PATH"
insert_pages "$@"
