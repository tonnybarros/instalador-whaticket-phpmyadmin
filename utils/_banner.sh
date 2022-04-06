#!/bin/bash
#
# Print banner art.

#######################################
# Print a board. 
# Globals:
#   BG_BROWN
#   NC
#   WHITE
#   CYAN_LIGHT
#   RED
#   BLUE
#   GREEN
#   YELLOW
# Arguments:
#   None
#######################################
print_banner() {

  clear

  printf "\n\n"

  printf "${BLUE}";
  printf "                                                     ▄▄█▀▀▀▀▀▀▀█▄▄  \n";
  printf "                                                   ${BLUE}▄█▀${NC}   ${WHITE}▄▄${NC}      ${BLUE}▀█▄\n";
  printf "                                                   ${BLUE}█${NC}    ${WHITE}███${NC}         ${BLUE}█\n";
  printf "                                                   ${BLUE}█${NC}    ${WHITE}██▄         ${BLUE}█${NC}\n";
  printf "                                                   ${BLUE}█${NC}     ${WHITE}▀██▄${NC} ${WHITE}██${NC}    ${BLUE}█\n";
  printf "                                                   ${BLUE}█${NC}       ${WHITE}▀███▀${NC}    ${BLUE}█\n";
  printf "                                                   ${BLUE}▀█▄           ▄█▀\n";
  printf "                                                    ▄█    ▄▄▄▄█▀▀  \n";
  printf "                                                    █  ▄█▀        \n";
  printf "                                                    ▀▀▀▀          \n";
  printf "${NC}";

  printf "\n"

  printf "${BLUE}";
  printf "███████ ██     ██  ███████  ████    ██           ██████████   █████████  ████████   \n";
  printf "██   ██ ██     ██  ██       ██ ██   ██                  ███   ██     ██  ██    ██      \n";
  printf "███████ ██  █  ██  ███████  ██  ██  ██  ██████       ███      █████████  ████████               \n";
  printf "██   ██ ██ ███ ██  ██       ██   ██ ██            ███         ██     ██  ██        \n";
  printf "███████  ███ ███   ███████  ██    ████           ██████████   ██     ██  ██       \n";
  printf "${NC}";

  printf "\n"
}
