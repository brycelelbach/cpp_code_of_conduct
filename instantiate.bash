#! /bin/bash
################################################################################
# Copyright (c) 2017 Bryce Adelstein Lelbach aka wash <brycelelbach@gmail.com>
#
# Distributed under the Creative Commons Attribution 3.0 Unported License. 
# (See https://creativecommons.org/licenses/by/3.0).
################################################################################

# Supported events.
EVENTS="cppnow or cppcon"

# Files to perform substition on.
TEMPLATE_FILES=README.md code_of_conduct.md attendee_procedure_for_incident_handling.md staff_procedure_for_incident_handling.md

################################################################################

if [ "${#}" -lt 1 ]; then
    echo "Usage: `basename ${0}` <event>"
    echo "       where <event> is ${EVENTS}" 
    exit 1
fi

EVENT=${1}

case ${EVENT} in
    cppnow)
        CONFERENCE='C++Now'
        COMMUNITY='C++ and Boost'
        COC_STAFF_CONTACT_INFO='* Jackie Kay,              Attendee Liaison, [mailto:jackie@cppnow.org][]\n* Bryce Adelstein Lelbach, Program Chair,    [mailto:bryce@cppnow.org][]\n* Jon Kalb,                Conference Chair, [mailto:jon@cppnow.org][]'
        COC_STAFF_FIRST_NAMES='Jackie, Bryce and/or Jon'
        ;;
    cppcon)
        CONFERENCE='CppCon'
        COMMUNITY='C++'
        COC_STAFF_CONTACT_INFO='* Titus Winters,           Attendee Liaison,                [mailto:titus@cppcon.org][]\n* Bryce Adelstein Lelbach, Program Chair,                   [mailto:bryce@cppcon.org][]\n* Jon Kalb,                Conference Chair,                [mailto:jon@cppcon.org][]\n* Herb Sutter,             Standard C++ Foundation Advisor, [mailto:herb@cppcon.org][]'
        COC_STAFF_FIRST_NAMES='Titus, Bryce, Jon and/or Herb'
        ;;
    *)
        echo "ERROR: Unknown event '${EVENT}'"
        echo "       Supported events are ${EVENTS}"
        exit 2
        ;;
esac

################################################################################

mv README.md README.md.backup
mv README_generic.md README.md

sed -i.backup "
    s/%%CONFERENCE%%/${CONFERENCE}/g;
    s/%%COMMUNITY%%/${COMMUNITY}/g;
    s/%%COC_STAFF_CONTACT_INFO%%/${COC_STAFF_CONTACT_INFO}/g;
    s/%%COC_STAFF_FIRST_NAMES%%/${COC_STAFF_FIRST_NAMES}/g;
" ${TEMPLATE_FILES}
