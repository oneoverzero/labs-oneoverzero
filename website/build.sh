#! /bin/bash

WEBSITE_DIR="/pub/provisioning/machinecmd/_data/nginx/sites/labs_oneoverzero_org"
HUGO="../hugo"

$HUGO -d "$WEBSITE_DIR";
