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

  printf "${GREEN}";
  printf "                                                     ▄▄█▀▀▀▀▀▀▀█▄▄  \n";
  printf "                                                   ${GREEN}▄█▀${NC}   ${WHITE}▄▄${NC}      ${GREEN}▀█▄\n";
  printf "                                                   ${GREEN}█${NC}    ${WHITE}███${NC}         ${GREEN}█\n";
  printf "                                                   ${GREEN}█${NC}    ${WHITE}██▄         ${GREEN}█${NC}\n";
  printf "                                                   ${GREEN}█${NC}     ${WHITE}▀██▄${NC} ${WHITE}██${NC}    ${GREEN}█\n";
  printf "                                                   ${GREEN}█${NC}       ${WHITE}▀███▀${NC}    ${GREEN}█\n";
  printf "                                                   ${GREEN}▀█▄           ▄█▀\n";
  printf "                                                    ▄█    ▄▄▄▄█▀▀  \n";
  printf "                                                    █  ▄█▀        \n";
  printf "                                                    ▀▀▀▀          \n";
  printf "${NC}";

  printf "\n"

  printf "${GREEN}";
  printf " _____                        _______  _        _          _   \n";
  printf "|  __ \                      |__   __|(_)      | |        | |  \n";
  printf "| |__) |_ __  ___  ___  ___     | |    _   ___ | | __ ___ | |_ \n";
  printf "|  ___/| '__|/ _ \/ __|/ __|    | |   | | / __|| |/ // _ \| __|\n";
  printf "| |    | |  |  __/\__ \\__ \     | |   | || (__ |   <|  __/| |_ \n";
  printf "|_|    |_|   \___||___/|___/    |_|   |_| \___||_|\_\\___| \__|\n";
  printf "${NC}";

  printf "\n"
}
