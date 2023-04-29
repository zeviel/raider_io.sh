#!/bin/bash

api="https://raider.io/api/v1"
user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36"

function get_character_profile() {
    # 1 - realm: (string): the realm of the character
    # 2 - name: (string): the name of the character
    # 3 - fields: (string): optional comma-separated list of fields to include in the response
    curl --request GET \
        --url "$api/characters/profile" \
        --user-agent "$user_agent" \
        --header "content-type: application/x-www-form-urlencoded" \
        --data "region=us&realm=$1&name=$2&fields=${3:-}"
}

function get_guild_profile() {
    # 1 - realm: (string): the realm of the guild
    # 2 - name: (string): the name of the guild
    # 3 - fields: (string): optional comma-separated list of fields to include in the response
    curl --request GET \
        --url "$api/guilds/profile" \
        --user-agent "$user_agent" \
        --header "content-type: application/x-www-form-urlencoded" \
        --data "region=us&realm=$1&name=$2&fields=${3:-}"
}

function get_mythic_plus_scores() {
    # 1 - realm: (string): the realm of the character
    # 2 - name: (string): the name of the character
    # 3 - season: (integer): the season number to get scores for (default: 1)
    curl --request GET \
        --url "$api/mythic-plus/scores" \
        --user-agent "$user_agent" \
        --header "content-type: application/x-www-form-urlencoded" \
        --data "region=us&realm=$1&name=$2&season=${3:-1}"
}
