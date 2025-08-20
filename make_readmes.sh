#!/usr/bin/env bash

jekyll_collection_path="src/_plugins"

mkdir -p $jekyll_collection_path

for plugin_path in albert/plugins/*/
do
  plugin_id=$(basename "$plugin_path")
  plugin_name=$(cat "$plugin_path/metadata.json" | jq -r ".name")
  jekyll_source_file="$jekyll_collection_path/$plugin_id.md"
  echo "$plugin_path | $plugin_id | $plugin_name > $jekyll_source_file"

  cat << EOF > "$jekyll_source_file"
---
layout: default
title: $plugin_name
parent: Plugins
permalink: /plugins/$plugin_id/
---

# Albert plugin: {{ page.title }}
{: .no_toc }

- TOC
{:toc}

EOF

  sed '/^# [^#]/d' "$plugin_path/README.md" >> "$jekyll_source_file"

done

